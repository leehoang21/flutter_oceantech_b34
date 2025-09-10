import 'dart:async';

import 'package:get/get.dart';

import '../../../common/contant.dart';
import '../../../common/controller_mixin.dart';
import '../../../common/utils.dart';
import '../../../models/todolist_model.dart';

class TodolistController extends GetxController
    with ControllerMixin
    implements GetxService {
  TodolistController();

  StreamSubscription? _subscription;
  final List<TodolistModel> _list = [];
  List<TodolistModel> get list => _list;

  @override
  onInit() {
    getAll();
    super.onInit();
  }

  Future<void> add(String title, String content) async {
    final result = await serviceApp.todolistService.save(
      TodolistModel(title: title, content: content),
    );
    if (!isNullEmpty(result?.$2)) {
      showErrorAlert('TodoList error', () {});
    }
  }

  void delete(String uid) {
    serviceApp.todolistService.delete(uid);
  }

  void edit(TodolistModel model) {
    serviceApp.todolistService.save(model);
  }

  void getAll() async {
    _subscription?.cancel();
    _subscription = serviceApp.todolistService.getAll().listen(
      (event) {
        if (!isNullEmpty(event.$2)) {
          showErrorAlert('get todolist error', () {});
        } else {
          _list.clear();
          _list.addAll(event.$1);
          update();
        }
      },
    );
  }
}
