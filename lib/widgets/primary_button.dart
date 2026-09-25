import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.color = AppColors.orange,
    this.textColor = Colors.white,
    this.borderColor,
    this.fullWidth = true,
    this.height = 48,
    this.radius = 8,
    this.horizontalPadding = 20,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final bool fullWidth;
  final double height;
  final double radius;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          disabledBackgroundColor: color,
          foregroundColor: textColor,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: borderColor == null ? BorderSide.none : BorderSide(color: borderColor!),
          ),
        ),
        child: loading
            ? SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2, color: textColor),
              )
            : Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                  letterSpacing: 0,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
