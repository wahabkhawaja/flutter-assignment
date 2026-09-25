import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_assignment/controllers/auth_controller.dart';
import 'package:flutter_assignment/utils/app_colors.dart';
import 'package:flutter_assignment/utils/app_spacing.dart';
import 'package:flutter_assignment/utils/app_text_styles.dart';
import 'package:flutter_assignment/utils/font_manager.dart';
import 'package:flutter_assignment/screens/auth/widgets/auth_text_field.dart';
import 'package:flutter_assignment/screens/auth/widgets/robot_check.dart';
import 'package:flutter_assignment/screens/auth/widgets/social_button.dart';
import 'package:flutter_assignment/screens/bottom_nav_bar.dart';
import 'package:flutter_assignment/utils/navigation_functions.dart';
import 'package:flutter_assignment/utils/show_toast.dart';
import 'package:flutter_assignment/widgets/primary_button.dart';
import 'package:flutter_assignment/widgets/venuze_logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = Get.find<AuthController>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  bool notRobot = false;

  @override
  void initState() {
    super.initState();
    openSavedSession();
  }

  Future<void> openSavedSession() async {
    await auth.checkSavedLogin();
    if (!mounted || !auth.isLoggedIn.value) return;
    replaceCupertinoNavigation(const BottomNavBar());
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> onLoginTap() async {
    final email = emailCtrl.text.trim();
    if (!email.contains('@') || !email.contains('.')) {
      ShowToast.error(context, 'Enter a valid email address.');
      return;
    }
    if (passwordCtrl.text.isEmpty) {
      ShowToast.error(context, 'Enter your password.');
      return;
    }
    if (!notRobot) {
      ShowToast.error(context, "Please confirm you are not a robot.");
      return;
    }

    final ok = await auth.login(email, passwordCtrl.text);
    if (!mounted) return;
    if (!ok) {
      ShowToast.error(context, auth.errorMessage.value);
      return;
    }
    ShowToast.success(context, 'Logged in successfully.');
    replaceCupertinoNavigation(const BottomNavBar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(35, 24, 35, 12),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: const VenuzeLogo(
                      width: 48,
                      height: 32,
                    ),
                  ),
                ),
                padding28,
                Text(
                  'Log in',
                  style: getSemiBoldStyle(fontSize: MyFonts.size26, color: const Color(0xFF000000)).copyWith(
                    height: 1.08,
                    letterSpacing: 0,
                  ),
                ),
                padding8,
                Text.rich(
                  TextSpan(
                    text: 'Don’t have account Yet? ',
                    style: getRegularStyle(fontSize: MyFonts.size14, color: AppColors.gray).copyWith(
                      height: 1.5,
                      letterSpacing: 0,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: getMediumStyle(fontSize: MyFonts.size14, color: AppColors.orange).copyWith(
                          height: 1.5,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                padding22,
                AuthTextField(
                  controller: emailCtrl,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                padding20,
                AuthTextField(controller: passwordCtrl, hint: 'Password', obscure: true),
                padding6,
                const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 12),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 1,
                        letterSpacing: 0,
                        color: AppColors.orange,
                      ),
                    ),
                  ),
                ),
                padding6,
                RobotCheck(checked: notRobot, onTap: () => setState(() => notRobot = !notRobot)),
                padding30,
                Obx(
                  () => ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 84, maxWidth: 480),
                    child: PrimaryButton(
                      label: 'Login',
                      loading: auth.isLoading.value,
                      onPressed: onLoginTap,
                      height: 44,
                      radius: 10,
                      horizontalPadding: 20,
                    ),
                  ),
                ),
                padding30,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Positioned(
                        left: 0,
                        right: 0,
                        child: Divider(color: AppColors.border, thickness: 1, height: 1),
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'or continue with',
                          textAlign: TextAlign.center,
                          style: getRegularStyle(fontSize: MyFonts.size14, color: AppColors.gray).copyWith(
                            height: 1.5,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ],
                    ),
                  ),
                ),
                padding22,
                const SocialButton(label: 'Log in with Facebook', icon: 'assets/icons/facebook.png'),
                padding10,
                const SocialButton(label: 'Log in with Google', icon: 'assets/icons/google.png'),
                padding10,
                const SocialButton(label: 'Log in with Apple', icon: 'assets/icons/apple.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
