import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/debris.dart';
import '../state/app_state.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../widgets/altitude_bar.dart';
import '../widgets/primary_button.dart';
import '../widgets/risk_badge.dart';
import 'confirmation_screen.dart';

class DetailScreen extends StatelessWidget {
  final Debris debris;

  const DetailScreen({super.key, required this.debris});

  @override
  Widget build(BuildContext context) {
    final isMonitored = context.watch<AppState>().isMonitored(debris.id);

    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      appBar: AppBar(
        backgroundColor: AppColors.spaceBlack,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: Text(
          debris.name,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.headlineSmall().copyWith(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DETRITO #${debris.id}',
              style: AppTypography.labelSmall().copyWith(
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              debris.name,
              style: AppTypography.displayMedium(),
            ),
            const SizedBox(height: 8),
            Text(
              debris.countryOfOrigin,
              style: AppTypography.bodyMedium().copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: RiskBadge(level: debris.riskLevel),
            ),
            const SizedBox(height: 32),
            Text(
              'ALTITUDE ORBITAL',
              style: AppTypography.labelSmall().copyWith(
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: 12),
            AltitudeBar(altitudeKm: debris.altitudeKm),
            const SizedBox(height: 32),
            _InfoGrid(debris: debris),
            const SizedBox(height: 32),
            Text(
              'HISTÓRIA',
              style: AppTypography.labelLarge().copyWith(
                color: AppColors.marsOrange,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              debris.story,
              style: AppTypography.bodyLarge().copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            _MonitorButton(
              isMonitored: isMonitored,
              onPressed: () {
                context.read<AppState>().toggleMonitored(debris.id);
              },
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              label: 'ADOTAR ESTE DETRITO',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ConfirmationScreen(debris: debris),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoGrid extends StatelessWidget {
  final Debris debris;
  const _InfoGrid({required this.debris});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _InfoCell(
                label: 'MASSA (KG)',
                value: _formatMass(debris.massKg),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _InfoCell(
                label: 'INCLINAÇÃO (°)',
                value: debris.orbitalInclinationDegrees.toStringAsFixed(1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _InfoCell(
                label: 'ANO DE LANÇAMENTO',
                value: debris.launchYear.toString(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _InfoCell(
                label: 'TIPO',
                value: debris.type,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatMass(double mass) {
    if (mass < 10) {
      return mass.toStringAsFixed(1);
    }
    return mass.toStringAsFixed(0);
  }
}

class _InfoCell extends StatelessWidget {
  final String label;
  final String value;

  const _InfoCell({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelSmall().copyWith(
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: AppTypography.titleLarge(),
        ),
      ],
    );
  }
}

class _MonitorButton extends StatelessWidget {
  final bool isMonitored;
  final VoidCallback onPressed;

  const _MonitorButton({
    required this.isMonitored,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final color = isMonitored ? AppColors.marsOrange : AppColors.textPrimary;
    final borderColor =
        isMonitored ? AppColors.marsOrange : AppColors.spaceBorder;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: borderColor, width: 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        icon: Icon(
          isMonitored ? Icons.check : Icons.visibility_outlined,
          color: color,
          size: 18,
        ),
        label: Text(
          isMonitored ? 'MONITORANDO' : 'MONITORAR ESTE DETRITO',
          style: AppTypography.labelLarge().copyWith(color: color),
        ),
      ),
    );
  }
}
