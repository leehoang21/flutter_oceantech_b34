import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_oceantech/common/default_environment.dart';
import 'package:flutter_oceantech/common/firebase_config.dart';
import 'package:flutter_oceantech/common/utils.dart';
import 'package:flutter_oceantech/models/todolist_model.dart';

class TodolistService {
  final FirebaseConfig config;

  TodolistService(this.config);

  CollectionReference<Map<String, dynamic>> get _collection =>
      config.userDoc.collection(DefaultEnvironment.todolist);

  Future<(TodolistModel?, String)?> save(TodolistModel model) async {
    try {
      if (isNullEmpty(model.uid)) {
        final doc = _collection.add(model.toJson());
        return (model.copyWith(uid: (await doc).id), '');
      } else {
        await _collection.doc(model.uid).update(model.toJson());
        return (model, '');
      }
    } on Exception catch (e) {
      return (null, e.toString());
    }
  }

  Future<String?> delete(String uid) async {
    try {
      await _collection.doc(uid).delete();
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }

  Stream<(List<TodolistModel>, String)> getAll() {
    final result =
        _collection.snapshots().map<(List<TodolistModel>, String)>((event) {
      try {
        final list =
            event.docs.map((e) => TodolistModel.fromReference(e)).toList();
        return (list, '');
      } catch (e) {
        return ([], e.toString());
      }
    });
    return result;
  }
}
