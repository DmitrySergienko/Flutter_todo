import 'package:doto_cubit/cubit/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../debounce.dart';
import '../models/todo_model.dart';

class SearchingScreen extends StatelessWidget {
  SearchingScreen({super.key});

  final debounce = Debounce(milleseconds: 1000);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Search tools...',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newSearch) {
            if (newSearch != null) {
              debounce.run(() {
                context.read<TodoSearchCubit>().searchTerm(newSearch);
              });
            }
          },
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(fontSize: 18.0, color: textColor(context, filter)),
      ),
    );
  }
}

Color textColor(BuildContext context, Filter filter) {
  final currentFilter = context.watch<TodoFilterCubit>().state.filter;
  return currentFilter == filter ? Colors.blue : Colors.grey;
}
