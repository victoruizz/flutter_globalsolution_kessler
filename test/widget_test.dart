import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:kessler/screens/splash_screen.dart';
import 'package:kessler/state/app_state.dart';

void main() {
  testWidgets('Splash mostra wordmark KESSLER', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: const MaterialApp(home: SplashScreen()),
      ),
    );
    expect(find.text('KESSLER'), findsOneWidget);
    expect(find.text('PROJETO'), findsOneWidget);
  });
}
