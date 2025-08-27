import 'package:flutter/material.dart';
import 'package:flutter_oceantech/common/init.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
