import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/risk_level.dart';
import '../state/app_state.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class FilterChipsRow extends StatelessWidget {
  const FilterChipsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final selected = state.selectedRisk;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          _FilterChip(
            label: 'TODOS',
            isSelected: selected == null,
            onTap: () => context.read<AppState>().selectRisk(null),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'BAIXO',
            isSelected: selected == RiskLevel.baixo,
            onTap: () =>
                context.read<AppState>().selectRisk(RiskLevel.baixo),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'MÉDIO',
            isSelected: selected == RiskLevel.medio,
            onTap: () =>
                context.read<AppState>().selectRisk(RiskLevel.medio),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'ALTO',
            isSelected: selected == RiskLevel.alto,
            onTap: () =>
                context.read<AppState>().selectRisk(RiskLevel.alto),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'CRÍTICO',
            isSelected: selected == RiskLevel.critico,
            onTap: () =>
                context.read<AppState>().selectRisk(RiskLevel.critico),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.marsOrange : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.marsOrange : AppColors.spaceBorder,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Text(
          label,
          style: AppTypography.labelLarge().copyWith(
            color: isSelected
                ? AppColors.spaceBlack
                : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
