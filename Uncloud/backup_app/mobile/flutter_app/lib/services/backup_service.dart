import 'dart:io';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as p;
import 'encryption_service.dart';
import 'telegram_service.dart';

class BackupService {
  final TelegramService _telegram = TelegramService();
  final EncryptionService _encryption = EncryptionService();

  Future<BackupResult> runBackup({
    required List<String> filePaths,
    required void Function(double progress, String currentFile) onProgress,
    String? password,
  }) async {
    final total = filePaths.length;
    var processed = 0;

    for (final path in filePaths) {
      final file = File(path);
      if (!await file.exists()) continue;

      onProgress(processed / total, p.basename(path));

      final bytes = await file.readAsBytes();
      final compressed = GZipEncoder().encode(bytes) ?? bytes;
      final encrypted = password != null
          ? _encryption.encrypt(compressed, password)
          : compressed;

      final tempFile = File('${path}.ucbk');
      await tempFile.writeAsBytes(encrypted);

      await _telegram.uploadToSavedMessages(
        tempFile.path,
        caption: 'uncloud:${p.basename(path)}',
      );

      await tempFile.delete();
      processed++;
      onProgress(processed / total, p.basename(path));
    }

    return BackupResult(success: true, filesBackedUp: processed);
  }
}

class BackupResult {
  final bool success;
  final int filesBackedUp;

  BackupResult({required this.success, required this.filesBackedUp});
}
