import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String address;
  final String uid;

  UserModel({
    required this.email,
    required this.address,
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
        address: json["address"] ?? '',
        uid: json["uid"] ?? '',
      );

  factory UserModel.empty() => UserModel(
        email: '',
        address: '',
        uid: '',
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "address": address,
      };

  @override
  String toString() {
    return 'UserModel{email: $email,  address: $address}';
  }

  UserModel copyWith({
    String? email,
    String? address,
  }) {
    return UserModel(
      email: email ?? this.email,
      address: address ?? this.address,
      uid: uid,
    );
  }
}
