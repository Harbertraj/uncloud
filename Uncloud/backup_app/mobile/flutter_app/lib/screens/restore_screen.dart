import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestoreScreen extends StatelessWidget {
  const RestoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restore'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.photo_library_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                title: const Text('Photos & Videos'),
                subtitle: const Text('Restore to Gallery'),
                trailing: const Icon(Icons.download_outlined),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.folder_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                title: const Text('Documents'),
                subtitle: const Text('Restore to Downloads'),
                trailing: const Icon(Icons.download_outlined),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.apps_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                title: const Text('Apps'),
                subtitle: const Text('Install APK files'),
                trailing: const Icon(Icons.download_outlined),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Backup History',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            _RestoreItem(name: 'Mar 13, 2025 • 1.2 GB', onTap: () {}),
            _RestoreItem(name: 'Mar 10, 2025 • 2.1 GB', onTap: () {}),
            _RestoreItem(name: 'Mar 7, 2025 • 450 MB', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class _RestoreItem extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const _RestoreItem({required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(name),
        trailing: const Icon(Icons.restore),
        onTap: onTap,
      ),
    );
  }
}
