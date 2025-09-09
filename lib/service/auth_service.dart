import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_oceantech_b34/common/firebase_config.dart';

import '../common/contant.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseConfig config;

  AuthService(this.config);

  Future<String?> signUp(UserModel user, String password) async {
    try {
      await config.auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> signIn(String email, String password) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await config.auth.signInWithCredential(credential);
      final user = UserModel(
        email: email,
        uid: config.auth.currentUser?.uid ?? '',
      );
      currentUser = user;
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }
}
