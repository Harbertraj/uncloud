import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum BackupType { photos, videos, files, apps }

class SelectFilesScreen extends StatefulWidget {
  const SelectFilesScreen({super.key});

  @override
  State<SelectFilesScreen> createState() => _SelectFilesScreenState();
}

class _SelectFilesScreenState extends State<SelectFilesScreen> {
  final Set<BackupType> _selected = {};

  void _toggle(BackupType type) {
    setState(() {
      if (_selected.contains(type)) {
        _selected.remove(type);
      } else {
        _selected.add(type);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Backup'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  _SelectCard(
                    type: BackupType.photos,
                    icon: Icons.photo_library_outlined,
                    label: 'Photos',
                    subtitle: 'Gallery images',
                    selected: _selected.contains(BackupType.photos),
                    onTap: () => _toggle(BackupType.photos),
                  ),
                  _SelectCard(
                    type: BackupType.videos,
                    icon: Icons.video_library_outlined,
                    label: 'Videos',
                    subtitle: 'Video files',
                    selected: _selected.contains(BackupType.videos),
                    onTap: () => _toggle(BackupType.videos),
                  ),
                  _SelectCard(
                    type: BackupType.files,
                    icon: Icons.folder_outlined,
                    label: 'Files',
                    subtitle: 'Documents, PDFs, etc.',
                    selected: _selected.contains(BackupType.files),
                    onTap: () => _toggle(BackupType.files),
                  ),
                  _SelectCard(
                    type: BackupType.apps,
                    icon: Icons.apps_outlined,
                    label: 'Apps',
                    subtitle: 'APK backups',
                    selected: _selected.contains(BackupType.apps),
                    onTap: () => _toggle(BackupType.apps),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _selected.isEmpty
                      ? null
                      : () => context.push('/backup'),
                  child: Text(
                    'Start Backup (${_selected.length} selected)',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectCard extends StatelessWidget {
  final BackupType type;
  final IconData icon;
  final String label;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _SelectCard({
    required this.type,
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: CheckboxListTile(
        value: selected,
        onChanged: (_) => onTap(),
        secondary: CircleAvatar(
          backgroundColor: selected
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Icon(
            icon,
            color: selected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        title: Text(label),
        subtitle: Text(subtitle),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
