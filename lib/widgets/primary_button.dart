import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.marsOrange,
          foregroundColor: AppColors.spaceBlack,
          disabledBackgroundColor: AppColors.spaceSurfaceElevated,
          disabledForegroundColor: AppColors.textTertiary,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        child: Text(
          label,
          style: AppTypography.labelLarge().copyWith(
            color: isEnabled
                ? AppColors.spaceBlack
                : AppColors.textTertiary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
