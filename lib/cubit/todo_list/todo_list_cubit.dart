import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends HydratedCubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoDesc) {
    final newTodo = Todo(id: DateTime.now().toString(), desc: todoDesc);
    final newTodos = [...state.todos, newTodo];

    emit(state.copyWith(todos: newTodos));
    print(state);
  }

  void editTodo(String id, String todoDescription) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(id: id, desc: todoDescription, completed: todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(id: id, desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(Todo todo) {
    final newTodos = state.todos.where((Todo t) => t.id != todo.id).toList();

    emit(state.copyWith(todos: newTodos));
  }

  @override
  TodoListState? fromJson(Map<String, dynamic> json) {
    return TodoListState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoListState state) {
    return state.toMap();
  }
}
