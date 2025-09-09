import 'package:flutter_oceantech_b34/common/contant.dart';
import 'package:flutter_oceantech_b34/common/get_di.dart';

init() async {
  await firebaseConfig.init();
  GetDi.init();
}
