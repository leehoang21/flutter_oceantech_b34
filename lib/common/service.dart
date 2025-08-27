import 'package:flutter_oceantech/common/contant.dart';
import 'package:flutter_oceantech/service/todolist_service.dart';

import '../service/auth_service.dart';

class Service {
  late final AuthService authService;
  late final TodolistService todolistService;
  Service() {
    authService = AuthService(firebaseConfig);
    todolistService = TodolistService(firebaseConfig);
  }
}
