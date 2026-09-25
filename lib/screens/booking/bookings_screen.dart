import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_assignment/controllers/auth_controller.dart';
import 'package:flutter_assignment/widgets/app_header.dart';
import 'package:flutter_assignment/screens/booking/widgets/empty_bookings.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return Column(
      children: [
        const AppHeader(),
        Expanded(
          child: Obx(
            () => EmptyBookings(
              loggedIn: auth.isLoggedIn.value,
              message: '',
            ),
          ),
        ),
      ],
    );
  }
}
