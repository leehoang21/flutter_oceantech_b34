import 'package:flutter/material.dart';
import 'package:flutter_oceantech/common/firebase_config.dart';
import 'package:flutter_oceantech/models/user_model.dart';
import 'service.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
final Service serviceApp = Service();
final FirebaseConfig firebaseConfig = FirebaseConfig();
UserModel? currentUser;
