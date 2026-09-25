import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_assignment/controllers/auth_controller.dart';
import 'package:flutter_assignment/screens/auth/login_screen.dart';
import 'package:flutter_assignment/utils/app_spacing.dart';
import 'package:flutter_assignment/utils/app_text_styles.dart';
import 'package:flutter_assignment/utils/navigation_functions.dart';
import 'package:flutter_assignment/widgets/app_header.dart';
import 'package:flutter_assignment/widgets/primary_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return Column(
      children: [
        const AppHeader(),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Profile', textAlign: TextAlign.center, style: emptyTitleStyle()),
                  padding8,
                  Text(
                    'Your profile will appear here.',
                    textAlign: TextAlign.center,
                    style: emptyMessageStyle(),
                  ),
                  padding18,
                  Obx(() {
                    if (!auth.isLoggedIn.value) {
                      return PrimaryButton(
                        label: 'Sign in',
                        fullWidth: false,
                        onPressed: () => replaceCupertinoNavigation(const LoginScreen()),
                      );
                    }

                    return PrimaryButton(
                      label: 'Log out',
                      fullWidth: false,
                      onPressed: () async {
                        await auth.logout();
                        replaceCupertinoNavigation(const LoginScreen());
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
