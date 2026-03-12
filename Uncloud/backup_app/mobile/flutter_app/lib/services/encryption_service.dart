import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class EncryptionService {
  static IV get _iv => IV.fromLength(16);

  List<int> encrypt(List<int> data, String password) {
    final key = Key.fromUtf8(_padKey(password));
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encryptBytes(data, iv: _iv);
    return utf8.encode(encrypted.base64);
  }

  List<int> decrypt(List<int> data, String password) {
    final key = Key.fromUtf8(_padKey(password));
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final base64Str = utf8.decode(data);
    final encrypted = Encrypted.fromBase64(base64Str);
    return encrypter.decryptBytes(encrypted, iv: _iv);
  }

  String _padKey(String key) {
    if (key.length >= 32) return key.substring(0, 32);
    return key.padRight(32, '0');
  }
}
