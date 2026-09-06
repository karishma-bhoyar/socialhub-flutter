import 'package:flutter/material.dart';
import 'package:flutter_application_socialhub/core/constants/app_enums.dart';
import 'package:flutter_application_socialhub/core/theme/app_color.dart';
import 'package:flutter_application_socialhub/core/theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;
  final AppButtonType type;
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.type = AppButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOutline = type == AppButtonType.outlined;
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutline ? AppColors.surface : AppColors.primary,
          foregroundColor: isOutline ? AppColors.textPrimary : Colors.white,
          disabledBackgroundColor: isOutline
              ? AppColors.surface
              : AppColors.primary.withValues(alpha: 0.6),
          disabledForegroundColor: isOutline
              ? AppColors.textSecondary
              : Colors.white,
          elevation: 0,
          side: isOutline ? BorderSide(color: AppColors.border) : null,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: AppTextStyle.button.copyWith(
            color: isOutline ? AppColors.textPrimary : Colors.white,
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: isOutline ? AppColors.primary : Colors.white,
                ),
              )
            : icon ?? SizedBox.shrink(),
        label: Text(isLoading ? 'please wait..' : text),
      ),
    );
  }
}
