import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'filtered_todo_state.dart';

class FilteredTodoCubit extends Cubit<FilteredTodoState> {
  final List<Todo> initialTodos;

  FilteredTodoCubit({
    required this.initialTodos,
  }) : super(FilteredTodoState(filteredTodos: initialTodos));

  void setFilterTodos(Filter filter, List<Todo> todos, String searchTerm) {
    List<Todo> _filteredTodos;
//обновлеям список
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
}
