import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/app_colors.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/app_spacing.dart';

class RobotCheck extends StatelessWidget {
  const RobotCheck({super.key, required this.checked, required this.onTap});

  final bool checked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC5C5C5), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: checked ? AppColors.green : Colors.white,
                border: Border.all(color: checked ? AppColors.green : const Color(0xFFC7C7CC)),
              ),
              child: checked ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
            ),
          ),
          padding10,
          const Expanded(
            child: Text(
              'I’m not a robot',
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 13,
                height: 1,
                letterSpacing: 0,
                color: Color(0xFF333333),
              ),
            ),
          ),
          Image.asset(AppConstants.recaptchaIcon, width: 28, height: 28),
        ],
      ),
    );
  }
}
