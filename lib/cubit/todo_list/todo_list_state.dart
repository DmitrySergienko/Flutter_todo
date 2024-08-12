part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  @override
  List<Object?> get props => [todos];

  const TodoListState({required this.todos});

  @override
  String toString() {
    return 'TodoListState{todos: $todos}';
  }

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Clean the room'),
      Todo(id: '2', desc: 'Wash the dishes'),
      Todo(id: '3', desc: 'Do homework'),
    ]);
  }

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'todos': todos.map((todo) => todo.toMap()).toList(),
    };
  }

  factory TodoListState.fromMap(Map<String, dynamic> map) {
    return TodoListState(
      todos: List<Todo>.from(map['todos']?.map((item) => Todo.fromMap(item)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoListState.fromJson(String source) =>
      TodoListState.fromMap(json.decode(source));
}

