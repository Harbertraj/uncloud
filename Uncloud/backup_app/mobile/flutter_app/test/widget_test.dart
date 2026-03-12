import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uncloud_backup/app.dart';

void main() {
  testWidgets('Uncloud app shows login screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: UncloudApp(),
      ),
    );

    expect(find.text('Uncloud'), findsOneWidget);
    expect(find.text('Unlimited backup to Telegram'), findsOneWidget);
  });
}
