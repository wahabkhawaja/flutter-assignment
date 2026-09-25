import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:flutter_assignment/bindings/app_binding.dart';
import 'package:flutter_assignment/screens/auth/login_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VenuzeApp());
}

class VenuzeApp extends StatelessWidget {
  const VenuzeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialBinding: AppBinding(),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF5037)),
      ),
      home: const LoginScreen(),
      // home: const BottomNavBar(),
    );
  }
}
