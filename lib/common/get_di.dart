import 'package:flutter_oceantech_b34/presentation/login/controller/login_controller.dart';
import 'package:flutter_oceantech_b34/presentation/register/controller/register_controller.dart';
import 'package:flutter_oceantech_b34/presentation/todolist/controller/todolist_controller.dart';
import 'package:get/get.dart';

class GetDi {
  static Future<Map<String, Map<String, String>>> init() async {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => TodolistController());
    return {};
  }
}
