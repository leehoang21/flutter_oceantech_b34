import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_oceantech/common/contant.dart';

import 'login/bloc/login_cubit.dart';
import 'login/view/login_view.dart';
import 'main/bloc/main_cubit.dart';
import 'main/view/main_view.dart';
import 'register/bloc/register_cubit.dart';
import 'register/view/register_view.dart';

class RouteList {
  static const String registerScreen = '/register';
  static const String loginScreen = '/login';

  static const String main = '/main';
}

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // final _argument = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case RouteList.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterScreen(),
          ),
        );
      case RouteList.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );
      case RouteList.main:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TabMangerCubit(),
            child: Container(
              child: Text(
                'main screen\n${currentUser?.email}',
              ),
            ),
          ),
        );

      default:
        return _emptyRoute(settings);
    }
  }

  static MaterialPageRoute _emptyRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }
}
