import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 8),
            _SectionTitle(title: 'Account'),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text('+1 234 567 8900'),
              subtitle: const Text('Connected via Telegram'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(),
            _SectionTitle(title: 'Backup'),
            SwitchListTile(
              title: const Text('Auto backup'),
              subtitle: const Text('Backup when on Wi‑Fi'),
              value: false,
              onChanged: (v) {},
            ),
            SwitchListTile(
              title: const Text('Compress files'),
              subtitle: const Text('Reduce upload size'),
              value: true,
              onChanged: (v) {},
            ),
            SwitchListTile(
              title: const Text('Encrypt backup'),
              subtitle: const Text('Password protected'),
              value: true,
              onChanged: (v) {},
            ),
            const Divider(),
            _SectionTitle(title: 'Storage'),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Manage saved messages'),
              subtitle: const Text('Delete old backups'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(),
            _SectionTitle(title: 'About'),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Uncloud v1.0.0'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: const Text('Privacy Policy'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
