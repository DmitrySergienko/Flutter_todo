import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/todo_model.dart';

part 'filtered_todo_state.dart';

class FilteredTodoCubit extends HydratedCubit<FilteredTodoState> {
  final List<Todo> initialTodos;

  FilteredTodoCubit({
    required this.initialTodos,
  }) : super(FilteredTodoState(filteredTodos: initialTodos));

  void setFilterTodos(Filter filter, List<Todo> todos, String searchTerm) {
    List<Todo> _filteredTodos;

    switch (filter) {
      case Filter.active:
        _filteredTodos = todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos = todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todos;
    }

    if (searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) => todo.desc.toLowerCase().contains(searchTerm))
          .toList();
    }

    emit(state.copyWith(filteredTodos: _filteredTodos));
  }

  @override
  FilteredTodoState? fromJson(Map<String, dynamic> json) {
    return FilteredTodoState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(FilteredTodoState state) {
    return state.toMap();
  }
}
