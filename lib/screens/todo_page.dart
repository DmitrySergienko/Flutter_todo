import 'package:doto_cubit/cubit/cubits.dart';
import 'package:doto_cubit/screens/searching_screen.dart';
import 'package:doto_cubit/screens/show_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';
import 'create_todo.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const TodoHeader(),
              const CreateTodo(),
              const SizedBox(
                height: 20,
              ),
              SearchingScreen(),
              const ShowTodoScreen(),
            ]),
          ),
        ),
      ),
    );
  }
}

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 40.0, color: Colors.black),
        ),
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            final int activateTodoCount = state.todos
                .where((Todo todo) => !todo.completed)
                .toList()
                .length;
            context
                .read<ActiveTodoCountCubit>()
                .calculateActiveTodoCount(activateTodoCount);
          },
          child: Text(
            '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left',
            style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
          ),
        )
      ],
    );
  }
}
