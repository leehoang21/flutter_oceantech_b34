part of 'todolist_cubit.dart';

sealed class TodoListState extends Equatable {
  final List<TodolistModel> list;
  const TodoListState(this.list);
}

final class TodoListInitial extends TodoListState {
  const TodoListInitial() : super(const []);

  @override
  List<Object> get props => [];
}

final class TodoListLoaded extends TodoListState {
  const TodoListLoaded(super.list);

  @override
  List<Object> get props => [list];
}
