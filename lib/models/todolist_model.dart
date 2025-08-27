import 'package:cloud_firestore/cloud_firestore.dart';

class TodolistModel {
  final String title;
  final String content;
  final String uid;

  TodolistModel({
    required this.title,
    required this.content,
    this.uid = '',
  });

  factory TodolistModel.fromReference(DocumentSnapshot snapshot) {
    if (snapshot.data() == null) {
      throw Exception;
    }
    final data = snapshot.data() as Map<String, dynamic>;

    return TodolistModel._fromJson(
      {
        ...data,
        "uid": snapshot.id,
      },
    );
  }

  factory TodolistModel._fromJson(Map<String, dynamic> json) => TodolistModel(
        title: json["title"] ?? '',
        content: json["content"] ?? '',
        uid: json["uid"] ?? '',
      );

  factory TodolistModel.empty() => TodolistModel(
        title: '',
        content: '',
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };

  @override
  String toString() {
    return 'TodolistModel{title: $title,  content: $content}';
  }

  TodolistModel copyWith({
    String? title,
    String? content,
    String? uid,
  }) {
    return TodolistModel(
        title: title ?? this.title,
        content: content ?? this.content,
        uid: uid ?? this.uid);
  }
}
