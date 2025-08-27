import 'package:flutter/foundation.dart';

class DefaultEnvironment {
  static const String environmentHome = 'ocean-tech';
  static const String environment = kDebugMode ? 'develop' : 'release';
  static const String todolist = 'todolist';
}
