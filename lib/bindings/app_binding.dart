import 'package:get/get.dart';
import 'package:flutter_assignment/controllers/auth_controller.dart';
import 'package:flutter_assignment/controllers/nav_controller.dart';
import 'package:flutter_assignment/services/api_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService(), permanent: true);
    Get.put(AuthController(), permanent: true);
    Get.put(NavController(), permanent: true);
  }
}
