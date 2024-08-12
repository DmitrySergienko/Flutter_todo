import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'todo_search_state.dart';

class TodoSearchCubit extends HydratedCubit<TodoSearchState> {

  TodoSearchCubit() : super(TodoSearchState.initial());

  void searchTerm(String newSearchTerm) {
    emit(state.copyWith(searchTerm: newSearchTerm));
    }

  @override
  TodoSearchState? fromJson(Map<String, dynamic> json) {
    return TodoSearchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoSearchState state) {
    return state.toMap();
  }
}
