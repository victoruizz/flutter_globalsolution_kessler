import 'package:flutter/material.dart';

import '../data/models/risk_level.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

Color riskColor(RiskLevel level) {
  switch (level) {
    case RiskLevel.baixo:
      return AppColors.riskLow;
    case RiskLevel.medio:
      return AppColors.riskMedium;
    case RiskLevel.alto:
      return AppColors.riskHigh;
    case RiskLevel.critico:
      return AppColors.riskCritical;
  }
}

class RiskBadge extends StatelessWidget {
  final RiskLevel level;

  const RiskBadge({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    final color = riskColor(level);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: color, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      child: Text(
        'RISCO ${level.label.toUpperCase()}',
        style: AppTypography.labelSmall().copyWith(color: color),
      ),
    );
  }
}
