import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'screens/splash_screen.dart';
import 'state/app_state.dart';
import 'theme/app_colors.dart';
import 'theme/app_typography.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.spaceBlack,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: const KesslerApp(),
    ),
  );
}

class KesslerApp extends StatelessWidget {
  const KesslerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kessler',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: const SplashScreen(),
    );
  }

  ThemeData _buildTheme() {
    const colorScheme = ColorScheme.dark(
      primary: AppColors.marsOrange,
      onPrimary: AppColors.spaceBlack,
      secondary: AppColors.marsAmber,
      onSecondary: AppColors.spaceBlack,
      surface: AppColors.spaceSurface,
      onSurface: AppColors.textPrimary,
      error: AppColors.riskCritical,
      onError: AppColors.spaceBlack,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.spaceBlack,
      canvasColor: AppColors.spaceBlack,
      dividerColor: AppColors.spaceBorder,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.spaceBlack,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.headlineSmall(),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
    );
  }
}
