import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todo_list/todo_list_cubit.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  _CreateTodoState createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final TextEditingController newTextEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    newTextEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTextEditController,
      decoration: const InputDecoration(labelText: 'What to do?'),
      onSubmitted: (String? todoDescription) {
        if (todoDescription != null && todoDescription.trim().isNotEmpty) {
          context.read<TodoListCubit>().addTodo(todoDescription);
          newTextEditController.clear();
        }
      },
    );
  }
}