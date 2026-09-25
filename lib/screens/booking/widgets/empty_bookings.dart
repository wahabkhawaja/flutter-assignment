import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/auth/login_screen.dart';
import 'package:flutter_assignment/utils/app_spacing.dart';
import 'package:flutter_assignment/utils/app_text_styles.dart';
import 'package:flutter_assignment/utils/navigation_functions.dart';
import 'package:flutter_assignment/widgets/primary_button.dart';

class EmptyBookings extends StatelessWidget {
  const EmptyBookings({super.key, required this.loggedIn, required this.message});

  final bool loggedIn;
  final String message;

  @override
  Widget build(BuildContext context) {
    final subtitle = message.isNotEmpty ? message : 'Log in or sign up to begin your journey.';

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(16, 0),
              child: Image.asset(
                'assets/icons/no_bookings.png',
                width: 168,
                height: 168,
                fit: BoxFit.contain,
              ),
            ),
            padding8,
            Text(
              'No bookings found',
              textAlign: TextAlign.center,
              style: emptyTitleStyle(),
            ),
            padding8,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: emptyMessageStyle(),
            ),
            if (!loggedIn) ...[
              padding18,
              PrimaryButton(
                label: 'Sign in',
                fullWidth: false,
                onPressed: () => replaceCupertinoNavigation(const LoginScreen()),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
