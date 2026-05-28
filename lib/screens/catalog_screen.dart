import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../widgets/debris_card.dart';
import '../widgets/filter_chips_row.dart';
import 'detail_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final debrisList = context.watch<AppState>().filteredDebris;

    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      appBar: AppBar(
        backgroundColor: AppColors.spaceBlack,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: Text(
          'CATÁLOGO ORBITAL',
          style: AppTypography.headlineSmall(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.filter_alt_outlined,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const FilterChipsRow(),
          Expanded(
            child: debrisList.isEmpty
                ? const _EmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                    itemCount: debrisList.length,
                    itemBuilder: (context, index) {
                      final debris = debrisList[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == debrisList.length - 1 ? 0 : 12,
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
        padding: const EdgeInsets.all(24),
        child: Text(
          'Nenhum detrito neste nível de risco.',
          textAlign: TextAlign.center,
          style: AppTypography.bodyLarge().copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
