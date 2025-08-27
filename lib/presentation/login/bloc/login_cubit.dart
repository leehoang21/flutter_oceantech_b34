import 'package:equatable/equatable.dart';
import 'package:flutter_oceantech/common/extension.dart';

import '../../../common/base_bloc.dart';
import '../../../common/contant.dart';
import '../../routes.dart';

part 'login_state.dart';

class LoginCubit extends BaseBloc<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String name, String pass) async {
    final result = await serviceApp.authService.signIn(name, pass);
    if (result != null) {
      showSnackbar('login error');
    } else {
      pushAndRemoveUntil(RouteList.main);
    }
  }
}
