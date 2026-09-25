import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_assignment/utils/app_colors.dart';
import 'package:flutter_assignment/utils/app_spacing.dart';
import 'package:flutter_assignment/utils/app_text_styles.dart';
import 'package:flutter_assignment/utils/font_manager.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.label, required this.icon});

  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Get.snackbar(
          'Sign in',
          'Please sign in with email and password.',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(12),
        );
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 22, height: 22),
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: getMediumStyle(fontSize: MyFonts.size14, color: AppColors.text).copyWith(
                height: 1,
                letterSpacing: 0,
              ),
            ),
          ),
          padding22,
        ],
      ),
    );
  }
}
