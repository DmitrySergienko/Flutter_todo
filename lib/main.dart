import 'package:doto_cubit/cubit/cubits.dart';
import 'package:doto_cubit/screens/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'cubit/filterd_todo/filtered_todo_cubit.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TodoFilterCubit>(
            create: (context) => TodoFilterCubit(),
          ),
          BlocProvider<TodoSearchCubit>(
            create: (context) => TodoSearchCubit(),
          ),
          BlocProvider<TodoListCubit>(
            create: (context) => TodoListCubit(),
          ),
          BlocProvider<ActiveTodoCountCubit>(
            create: (context) => ActiveTodoCountCubit(
              initialActiveCount:
                  context.read<TodoListCubit>().state.todos.length,
            ),
          ),
          BlocProvider<FilteredTodoCubit>(
            create: (context) => FilteredTodoCubit(
              initialTodos: context.read<TodoListCubit>().state.todos,
            ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const TodoPage(),
        ));
  }
}
