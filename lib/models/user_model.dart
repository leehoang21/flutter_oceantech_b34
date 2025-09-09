import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;

  UserModel({
    required this.email,
    required this.uid,
  });

  factory UserModel.fromReference(DocumentSnapshot snapshot) {
    if (snapshot.data() == null) {
      throw Exception;
    }
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel._fromJson(
      {
        ...data,
        "uid": snapshot.id,
      },
    );
  }

  factory UserModel._fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"] ?? '',
        uid: json["uid"] ?? '',
      );

  factory UserModel.empty() => UserModel(
        email: '',
        uid: '',
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };

  @override
  String toString() {
    return 'UserModel{email: $email}';
  }

  UserModel copyWith({
    String? email,
    String? address,
  }) {
    return UserModel(
      email: email ?? this.email,
      uid: uid,
    );
  }
}
