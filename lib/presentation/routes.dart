import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_oceantech/presentation/todolist/bloc/todolist_cubit.dart';
import 'package:flutter_oceantech/presentation/todolist/view/todolist_view.dart';

import 'login/bloc/login_cubit.dart';
import 'login/view/login_view.dart';
import 'register/bloc/register_cubit.dart';
import 'register/view/register_view.dart';

class RouteList {
  static const String registerScreen = '/register';
  static const String loginScreen = '/login';

  static const String todolist = '/todolist';
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
      case RouteList.todolist:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TodoListCubit(),
            child: const TodoListScreen(),
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
