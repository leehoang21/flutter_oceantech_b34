import 'package:flutter_oceantech/common/contant.dart';

import '../service/auth_service.dart';

class Service {
  late final AuthService authService;
  Service() {
    authService = AuthService(firebaseConfig);
  }
}
