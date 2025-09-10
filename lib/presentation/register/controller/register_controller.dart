import 'package:get/get.dart';

import '../../../common/contant.dart';
import '../../../common/controller_mixin.dart';
import '../../../models/user_model.dart';
import '../../routes.dart';

class RegisterController extends GetxController
    with ControllerMixin
    implements GetxService {
  RegisterController();

  Future<void> register(String email, String password) async {
    final user = UserModel(
      email: email,
      uid: '',
    );
    final result = await serviceApp.authService.signUp(user, password);
    if (result != null) {
      showErrorAlert('Register error', () {});
    } else {
      Get.offAndToNamed(RouteList.todolistScreen);
    }
  }
}
