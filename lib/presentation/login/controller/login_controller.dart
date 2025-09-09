import 'package:get/get.dart';

import '../../../common/contant.dart';
import '../../../common/controller_mixin.dart';
import '../../routes.dart';

class LoginController extends GetxController with ControllerMixin {
  LoginController();

  Future<void> login(String email, String password) async {
    final result = await serviceApp.authService.signIn(email, password);
    if (result != null) {
      showErrorAlert('login error', () {});
    } else {
      Get.offAndToNamed(RouteList.todolistScreen);
    }
  }
}
