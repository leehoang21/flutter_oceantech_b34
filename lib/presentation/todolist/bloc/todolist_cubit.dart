import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_oceantech/common/extension.dart';
import 'package:flutter_oceantech/common/utils.dart';
import 'package:flutter_oceantech/models/todolist_model.dart';

import '../../../common/base_bloc.dart';
import '../../../common/contant.dart';

part 'todolist_state.dart';

class TodoListCubit extends BaseBloc<TodoListState> {
  TodoListCubit() : super(const TodoListInitial());
  StreamSubscription? _subscription;

  @override
  onInit() {
    getAll();
  }

  Future<void> add(String title, String content) async {
    final result = await serviceApp.todolistService.save(
      TodolistModel(title: title, content: content),
    );
    if (result != null) {
      showSnackbar('TodoList error');
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
          showSnackbar('get todolist error');
        } else {
          emit(TodoListLoaded(event.$1));
        }
      },
    );
  }
}
