import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../widgets/orbital_decoration.dart';
import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 2500), _goToIntro);
  }

  void _goToIntro() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const IntroScreen()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const OrbitalDecoration(size: 200),
              const SizedBox(height: 40),
              Text(
                'PROJETO',
                style: AppTypography.labelLarge().copyWith(
                  color: AppColors.marsOrange,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'KESSLER',
                style: AppTypography.displayLarge(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
