import 'package:flutter/material.dart';

import '../data/models/debris.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'risk_badge.dart';

class DebrisCard extends StatelessWidget {
  final Debris debris;
  final VoidCallback onTap;

  const DebrisCard({
    super.key,
    required this.debris,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.spaceSurfaceElevated,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.spaceBorder, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      debris.id,
                      style: AppTypography.labelSmall().copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ),
                  RiskBadge(level: debris.riskLevel),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                debris.name,
                style: AppTypography.titleLarge(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '${debris.countryOfOrigin} · ${debris.launchYear}',
                style: AppTypography.bodyMedium().copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1, color: AppColors.spaceBorder),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _MiniMetric(
                      label: 'ALT (KM)',
                      value: _formatNumber(debris.altitudeKm),
                    ),
                  ),
                  Expanded(
                    child: _MiniMetric(
                      label: 'MASSA (KG)',
                      value: _formatNumber(debris.massKg),
                    ),
                  ),
                  Expanded(
                    child: _MiniMetric(
                      label: 'INCL (°)',
                      value: debris.orbitalInclinationDegrees
                          .toStringAsFixed(1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatNumber(double value) {
    if (value >= 1000) {
      return value.toStringAsFixed(0);
    }
    if (value == value.roundToDouble()) {
      return value.toStringAsFixed(0);
    }
    return value.toStringAsFixed(1);
  }
}

class _MiniMetric extends StatelessWidget {
  final String label;
  final String value;

  const _MiniMetric({required this.label, required this.value});

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
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTypography.titleMedium(),
        ),
      ],
    );
  }
}
