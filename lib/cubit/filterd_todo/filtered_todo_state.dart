part of 'filtered_todo_cubit.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filteredTodos;

  const FilteredTodoState({required this.filteredTodos});

  @override
  String toString() {
    return 'FilteredTodoState{filteredTodos: $filteredTodos}';
  }

  @override
  List<Object?> get props => [filteredTodos];

  factory FilteredTodoState.initial() {
    return const FilteredTodoState(filteredTodos: []);
  }

  FilteredTodoState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodoState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filteredTodos': filteredTodos.map((todo) => todo.toMap()).toList(),
    };
  }

  factory FilteredTodoState.fromMap(Map<String, dynamic> map) {
    return FilteredTodoState(
      filteredTodos: List<Todo>.from(
          map['filteredTodos']?.map((item) => Todo.fromMap(item)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory FilteredTodoState.fromJson(String source) =>
      FilteredTodoState.fromMap(json.decode(source));
}
