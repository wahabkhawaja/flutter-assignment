import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_assignment/controllers/nav_controller.dart';
import 'package:flutter_assignment/utils/app_colors.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/screens/booking/bookings_screen.dart';
import 'package:flutter_assignment/screens/explore/explore_screen.dart';
import 'package:flutter_assignment/screens/home/home_screen.dart';
import 'package:flutter_assignment/screens/profile/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  Widget _navIcon(String asset, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 2, bottom: 6),
      child: Image.asset(asset, width: 20, height: 20, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    final pages = const [
      HomeScreen(),
      ExploreScreen(),
      BookingsScreen(),
      ProfileScreen(),
    ];

    return Obx(
      () => Scaffold(
        body: SafeArea(child: pages[nav.currentIndex.value]),
        bottomNavigationBar: Container(
          height: 75,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Color(0x26000000),
                offset: Offset(0, -15),
                blurRadius: 40,
              ),
            ],
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).removePadding(removeBottom: true).removeViewPadding(removeBottom: true),
            child: BottomNavigationBar(
          currentIndex: nav.currentIndex.value,
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.orange,
          unselectedItemColor: AppColors.navInactive,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 10,
            height: 1,
            letterSpacing: 0,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 10,
            height: 1,
            letterSpacing: 0,
          ),
          onTap: nav.changeTab,
          items: [
            BottomNavigationBarItem(
              icon: _navIcon('assets/icons/home.png', AppColors.navInactive),
              activeIcon: _navIcon('assets/icons/home.png', AppColors.orange),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _navIcon(AppConstants.exploreIcon, AppColors.navInactive),
              activeIcon: _navIcon(AppConstants.exploreIcon, AppColors.orange),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: _navIcon(AppConstants.bookingsIcon, AppColors.navInactive),
              activeIcon: _navIcon(AppConstants.bookingsIcon, AppColors.orange),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: _navIcon('assets/icons/profile.png', AppColors.navInactive),
              activeIcon: _navIcon('assets/icons/profile.png', AppColors.orange),
              label: 'Profile',
            ),
          ],
            ),
          ),
        ),
      ),
    );
  }
}
