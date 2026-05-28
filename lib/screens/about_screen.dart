import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../widgets/orbital_decoration.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      appBar: AppBar(
        backgroundColor: AppColors.spaceBlack,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: Text(
          'SOBRE O PROJETO',
          style: AppTypography.headlineSmall(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: OrbitalDecoration(size: 140)),
            const SizedBox(height: 32),
            Center(
              child: Text(
                'PROJETO KESSLER',
                style: AppTypography.displayMedium(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'O Kessler é um catálogo mobile que documenta os principais detritos espaciais em órbita da Terra. Inspirado na Síndrome de Kessler, cenário teorizado em 1978 por Donald J. Kessler em que colisões orbitais geram uma reação em cascata capaz de inutilizar faixas inteiras do espaço, o app reúne origem, missão, altitude e nível de risco de cada fragmento, e permite que qualquer pessoa acompanhe e apoie simbolicamente a remoção desses objetos.',
              style: AppTypography.bodyLarge().copyWith(
                color: AppColors.textSecondary,
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ODS RELACIONADOS',
                      style: AppTypography.labelLarge().copyWith(
                        color: AppColors.marsOrange,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const _OdsRow(
                      icon: Icons.precision_manufacturing_outlined,
                      number: 'ODS 9',
                      label:
                          'Indústria, inovação e infraestrutura espacial sustentável.',
                    ),
                    const SizedBox(height: 12),
                    const _OdsRow(
                      icon: Icons.eco_outlined,
                      number: 'ODS 13',
                      label:
                          'Ação contra a mudança global do clima, incluindo o ambiente orbital.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'FIAP · Global Solution 2026.1',
              style: AppTypography.labelSmall().copyWith(
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Sistemas de Informação · 3º ano',
              style: AppTypography.labelSmall().copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OdsRow extends StatelessWidget {
  final IconData icon;
  final String number;
  final String label;

  const _OdsRow({
    required this.icon,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.marsOrange, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: AppTypography.titleMedium(),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: AppTypography.bodyMedium().copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
