import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackupProgressScreen extends StatefulWidget {
  const BackupProgressScreen({super.key});

  @override
  State<BackupProgressScreen> createState() => _BackupProgressScreenState();
}

class _BackupProgressScreenState extends State<BackupProgressScreen> {
  double _progress = 0.0;
  int _currentFile = 1;
  int _totalFiles = 24;
  String _currentFileName = 'photo_001.jpg';
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _simulateBackup();
  }

  Future<void> _simulateBackup() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 80));
      if (!mounted) return;
      setState(() {
        _progress = i / 100;
        if (i < 90) {
          _currentFile = (i / 4).floor() + 1;
          _currentFileName = 'file_${_currentFile.toString().padLeft(3, '0')}.${i % 3 == 0 ? 'jpg' : 'mp4'}';
        }
        if (i >= 100) _completed = true;
      });
    }
    setState(() => _completed = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backing up'),
        leading: _completed
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => context.go('/dashboard'),
              )
            : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              if (_completed)
                Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 80,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Backup Complete',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'All files saved to Telegram Saved Messages',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6),
                          ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CircularProgressIndicator(
                            value: _progress,
                            strokeWidth: 8,
                          ),
                        ),
                        Text(
                          '${(_progress * 100).toInt()}%',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    LinearProgressIndicator(
                      value: _progress,
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '$_currentFile / $_totalFiles',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _currentFileName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6),
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              const Spacer(),
              if (_completed)
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => context.go('/dashboard'),
                    child: const Text('Done'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
