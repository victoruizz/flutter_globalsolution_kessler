import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/repositories/debris_repository.dart';
import '../state/app_state.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../widgets/orbital_decoration.dart';
import '../widgets/primary_button.dart';
import 'about_screen.dart';
import 'catalog_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final monitoredCount = state.monitoredCount;
    final user = state.user;
    final totalDebris = DebrisRepository.all.length;
    final totalMassTons = DebrisRepository.all
            .fold<double>(0, (sum, d) => sum + d.massKg) /
        1000;

    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FIAP',
                    style: AppTypography.labelLarge().copyWith(
                      color: AppColors.marsOrange,
                    ),
                  ),
                  Text(
                    'GLOBAL SOLUTION 2026',
                    style: AppTypography.labelSmall().copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Center(child: OrbitalDecoration(size: 180)),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'PROJETO',
                  style: AppTypography.labelLarge().copyWith(
                    color: AppColors.marsOrange,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'KESSLER',
                  style: AppTypography.displayLarge(),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Antes que a cascata comece.',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyLarge().copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Card(
                color: AppColors.spaceSurfaceElevated,
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.spaceBorder, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (user != null) ...[
                        Text(
                          'BEM-VINDO, ${user.name.toUpperCase()}',
                          style: AppTypography.titleMedium(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${user.gender.label} · ${user.age} anos · ${user.country.label}',
                          style: AppTypography.labelSmall().copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(
                          height: 1,
                          color: AppColors.spaceBorder,
                        ),
                        const SizedBox(height: 16),
                      ],
                      Row(
                    children: [
                      Expanded(
                        child: _StatTile(
                          label: 'DETRITOS',
                          value: totalDebris.toString(),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: AppColors.spaceBorder,
                      ),
                      Expanded(
                        child: _StatTile(
                          label: 'MASSA (T)',
                          value: totalMassTons.toStringAsFixed(1),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: AppColors.spaceBorder,
                      ),
                      Expanded(
                        child: _StatTile(
                          label: 'MONITORADOS',
                          value: monitoredCount.toString(),
                          highlight: true,
                        ),
                      ),
                    ],
                  ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                label: 'EXPLORAR CATÁLOGO',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const CatalogScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const AboutScreen(),
                    ),
                  );
                },
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
                  'SOBRE O PROJETO',
                  style: AppTypography.labelLarge().copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  'Sistemas de Informação · FIAP',
                  style: AppTypography.labelSmall().copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final bool highlight;

  const _StatTile({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: AppTypography.displayMedium().copyWith(
            fontSize: 22,
            color: highlight ? AppColors.marsOrange : AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppTypography.labelSmall().copyWith(
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }
}
