import 'package:equatable/equatable.dart';
import 'package:flutter_oceantech/common/extension.dart';
import 'package:flutter_oceantech/models/user_model.dart';
import '../../../common/base_bloc.dart';
import '../../../common/contant.dart';
import '../../routes.dart';

part 'register_state.dart';

class RegisterCubit extends BaseBloc<RegisterState> {
  RegisterCubit() : super(LoginInitial());

  Future<void> register(String email, String pass, String address) async {
    final user = UserModel(
      email: email,
      address: address,
      uid: '',
    );
    final result = await serviceApp.authService.signUp(user, pass);
    if (result != null) {
      showSnackbar('sign up error');
    } else {
      pushAndRemoveUntil(RouteList.loginScreen);
    }
  }
}
