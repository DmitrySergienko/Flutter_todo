import 'package:doto_cubit/cubit/cubits.dart';
import 'package:doto_cubit/cubit/filterd_todo/filtered_todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';

class ShowTodoScreen extends StatelessWidget {
  const ShowTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<FilteredTodoCubit>().state.filteredTodos;
    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListCubit, TodoListState>(
            listener: (context, state){
              context.read<FilteredTodoCubit>().setFilterTodos(
                  context.read<TodoFilterCubit>().state.filter,
                  state.todos,
                context.read<TodoSearchCubit>().state.searchTerm,
              );
            }
        ),
        BlocListener<TodoFilterCubit, TodoFilerState>(
            listener: (context, state){
              context.read<FilteredTodoCubit>().setFilterTodos(
                state.filter,
                context.read<TodoListCubit>().state.todos,
                context.read<TodoSearchCubit>().state.searchTerm,
              );
            }
        ),
        BlocListener<TodoSearchCubit, TodoSearchState>(
            listener: (context, state){
              context.read<FilteredTodoCubit>().setFilterTodos(
                context.read<TodoFilterCubit>().state.filter,
                context.read<TodoListCubit>().state.todos,
                state.searchTerm
              );
            }
        ),
      ],
      child:
      ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: ValueKey(items[index].id),
              background: showBackground(0),
              secondaryBackground: showBackground(1),
              onDismissed: (_) {
                context.read<TodoListCubit>().removeTodo(items[index]);
              },
              confirmDismiss: (_) {
                return showConfirmationDialog(context);
              },
              child: TodoItem(
                todo: items[index],
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.grey,
          );
        },
        itemCount: items.length,
      ),
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }

  Future<bool?> showConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure!'),
          content: const Text('Do you really want to delete?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('NO'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('YES'),
            ),
          ],
        );
      },
    );
  }
}

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  _TodoItemState createState() {
    return _TodoItemState();
  }
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              bool _error = false;
              textController.text = widget.todo.desc;
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  title: const Text('Edit todo'),
                  content: TextField(
                    controller: textController,
                    autofocus: true,
                    decoration: InputDecoration(
                      errorText: _error ? 'Value can not be empty' : null,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _error = textController.text.isEmpty ? true : false;
                          if (!_error) {
                            Navigator.pop(context);
                            context.read<TodoListCubit>().editTodo(widget.todo.id, textController.text);
                          }
                        });
                      },
                      child: const Text('EDIT'),
                    )
                  ],
                );
              });
            });
      },
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: (bool? checked) {
          context.read<TodoListCubit>().toggleTodo(widget.todo.id);
        },
      ),
      title: Text(widget.todo.desc),
    );
  }
}
