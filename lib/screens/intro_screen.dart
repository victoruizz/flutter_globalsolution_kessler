import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroPage {
  final IconData icon;
  final String title;
  final String description;

  const _IntroPage({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  static const List<_IntroPage> _pages = [
    _IntroPage(
      icon: Icons.public,
      title: '36 MIL OBJETOS',
      description:
          'Mais de 36 mil detritos perigosos orbitam a Terra a 28 mil km/h. A maioria das pessoas nem sabe que eles existem.',
    ),
    _IntroPage(
      icon: Icons.warning_amber_rounded,
      title: 'SÍNDROME DE KESSLER',
      description:
          'Cada colisão gera novos fragmentos, que causam novas colisões. Uma reação em cascata pode tornar órbitas inteiras inutilizáveis.',
    ),
    _IntroPage(
      icon: Icons.travel_explore,
      title: 'ACOMPANHE E AJUDE',
      description:
          'O Kessler cataloga os principais detritos, conta a história de cada um e permite que você apoie sua remoção.',
    ),
  ];

  void _goToHome() {
    Navigator.of(context).maybePop();
  }

  void _onAdvance() {
    if (_currentPage == _pages.length - 1) {
      _goToHome();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _onBack() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentPage == _pages.length - 1;
    final isFirst = _currentPage == 0;

    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: TextButton(
                  onPressed: _goToHome,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                  ),
                  child: Text(
                    'PULAR',
                    style: AppTypography.labelLarge().copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          page.icon,
                          size: 72,
                          color: AppColors.marsOrange,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: AppTypography.displayMedium(),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodyLarge().copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pages.length, (index) {
                  final isActive = index == _currentPage;
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.marsOrange
                          : AppColors.spaceBorder,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Row(
                children: [
                  Expanded(
                    child: Opacity(
                      opacity: isFirst ? 0 : 1,
                      child: IgnorePointer(
                        ignoring: isFirst,
                        child: TextButton(
                          onPressed: _onBack,
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.textSecondary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'VOLTAR',
                            style: AppTypography.labelLarge().copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _onAdvance,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.marsOrange,
                        foregroundColor: AppColors.spaceBlack,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                      child: Text(
                        isLast ? 'COMEÇAR' : 'AVANÇAR',
                        style: AppTypography.labelLarge().copyWith(
                          color: AppColors.spaceBlack,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
