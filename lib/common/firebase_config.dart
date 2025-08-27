import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options.dart';
import 'default_environment.dart';

class FirebaseConfig {
  late FirebaseApp app;
  late DocumentReference userDoc;
  late FirebaseAuth auth;

  Future init() async {
    app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    auth = FirebaseAuth.instance;
    userDoc = FirebaseFirestore.instance
        .collection(DefaultEnvironment.environmentHome)
        .doc(DefaultEnvironment.environment);
  }
}
