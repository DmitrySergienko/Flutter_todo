part of 'todo_list_bloc.dart';

class TodoListState extends Equatable{
  final List<Todo> todos;

  @override
  List<Object?> get props => [todos];

  const TodoListState({required this.todos});

  @override
  String toString() {
    return 'TodoListState{todos: $todos}';
  }

  factory TodoListState.initial(){
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Clean the room'),
      Todo(id: '2', desc: 'Wash the dish'),
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
}
