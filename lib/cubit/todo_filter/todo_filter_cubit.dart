import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/todo_model.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends HydratedCubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.initial());

  void changeFilter(Filter newFilter) {
    emit(state.copyWith(filter: newFilter));
  }

  @override
  TodoFilterState? fromJson(Map<String, dynamic> json) {
    return TodoFilterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoFilterState state) {
    return state.toMap();
  }
}
