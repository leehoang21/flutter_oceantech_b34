import 'package:get/get.dart';

import 'login/view/login_view.dart';

import 'register/view/register_view.dart';
import 'todolist/view/todolist_view.dart';

class RouteList {
  static const String registerScreen = '/register';
  static const String loginScreen = '/login';

  static const String todolistScreen = '/todolist';
}

class Routes {
  static List<GetPage> routes = [
    GetPage(name: RouteList.registerScreen, page: () => const RegisterScreen()),
    GetPage(name: RouteList.loginScreen, page: () => const LoginScreen()),
    GetPage(name: RouteList.todolistScreen, page: () => const TodoListScreen()),
  ];
}
