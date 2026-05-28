import 'package:flutter/material.dart';

import '../data/models/debris.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../widgets/primary_button.dart';

class ConfirmationScreen extends StatelessWidget {
  final Debris debris;

  const ConfirmationScreen({super.key, required this.debris});

  void _backToHome(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      appBar: AppBar(
        backgroundColor: AppColors.spaceBlack,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Icon(
                Icons.check_circle_outline,
                size: 72,
                color: AppColors.marsOrange,
              ),
              const SizedBox(height: 32),
              Text(
                'ADOÇÃO CONFIRMADA',
                textAlign: TextAlign.center,
                style: AppTypography.displayMedium(),
              ),
              const SizedBox(height: 16),
              Text(
                'Você apoiou simbolicamente a remoção de ${debris.name}.',
                textAlign: TextAlign.center,
                style: AppTypography.bodyLarge().copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Sua contribuição entrou no registro do Projeto Kessler.',
                textAlign: TextAlign.center,
                style: AppTypography.bodyMedium().copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
              const Spacer(),
              PrimaryButton(
                label: 'VOLTAR AO INÍCIO',
                onPressed: () => _backToHome(context),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => _backToHome(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textPrimary,
                  side: const BorderSide(
                    color: AppColors.spaceBorder,
                    width: 1,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
                child: Text(
                  'VER OUTROS DETRITOS',
                  style: AppTypography.labelLarge().copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
