part of 'filtered_todo_cubit.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filteredTodos;

  const FilteredTodoState({required this.filteredTodos});

  @override
  String toString() {
    return 'FilteredTodoState{filteredTodos: $filteredTodos}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [filteredTodos];

  factory FilteredTodoState.initial() {
    return  FilteredTodoState(filteredTodos: []);
  }

  FilteredTodoState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodoState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
