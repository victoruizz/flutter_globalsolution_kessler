import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/debris.dart';
import '../data/repositories/debris_repository.dart';
import '../state/app_state.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../widgets/debris_card.dart';
import 'catalog_screen.dart';
import 'detail_screen.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final monitoredIds = context.watch<AppState>().monitoredIds;
    final List<Debris> saved = DebrisRepository.all
        .where((d) => monitoredIds.contains(d.id))
        .toList(growable: false);

    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      appBar: AppBar(
        backgroundColor: AppColors.spaceBlack,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: Text(
          'MEUS DETRITOS',
          style: AppTypography.headlineSmall(),
        ),
      ),
      body: saved.isEmpty
          ? const _EmptyState()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Row(
                    children: [
                      Text(
                        '${saved.length} ${saved.length == 1 ? "DETRITO" : "DETRITOS"} MONITORADOS',
                        style: AppTypography.labelSmall().copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                    itemCount: saved.length,
                    itemBuilder: (context, index) {
                      final debris = saved[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == saved.length - 1 ? 0 : 12,
                        ),
                        child: DebrisCard(
                          debris: debris,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) =>
                                    DetailScreen(debris: debris),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bookmark_border,
              size: 64,
              color: AppColors.marsOrange,
            ),
            const SizedBox(height: 24),
            Text(
              'NENHUM DETRITO SALVO',
              textAlign: TextAlign.center,
              style: AppTypography.headlineSmall().copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Abra o catálogo, escolha um detrito e toque em MONITORAR para salvá-lo aqui.',
              textAlign: TextAlign.center,
              style: AppTypography.bodyLarge().copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const CatalogScreen(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textPrimary,
                side: const BorderSide(
                  color: AppColors.spaceBorder,
                  width: 1,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              child: Text(
                'EXPLORAR CATÁLOGO',
                style: AppTypography.labelLarge().copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
