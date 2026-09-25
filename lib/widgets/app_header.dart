import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/app_colors.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/widgets/venuze_logo.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: const Stack(
        children: [
          Positioned(
            left: 15,
            top: 27,
            child: VenuzeLogo(width: 39, height: 26),
          ),
          Positioned(
            right: 23,
            top: 27,
            child: _NotificationButton(),
          ),
        ],
      ),
    );
  }
}

class _NotificationBadge extends StatelessWidget {
  const _NotificationBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: const Text(
        '3',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 10,
          height: 1,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            color: AppColors.orange,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Image.asset(
            AppConstants.notificationIcon,
            width: 18,
            height: 18,
            color: Colors.white,
          ),
        ),
        const Positioned(
          top: -9,
          right: -8,
          child: _NotificationBadge(),
        ),
      ],
    );
  }
}
