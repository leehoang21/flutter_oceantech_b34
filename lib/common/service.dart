import 'package:flutter_oceantech_b34/common/contant.dart';
import 'package:flutter_oceantech_b34/service/todolist_service.dart';

import '../service/auth_service.dart';

class Service {
  late final AuthService authService;
  late final TodolistService todolistService;
  Service() {
    authService = AuthService(firebaseConfig);
    todolistService = TodolistService(firebaseConfig);
  }
}
