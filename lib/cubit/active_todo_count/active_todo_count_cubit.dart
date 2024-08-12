import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends HydratedCubit<ActiveTodoCountState> {
  final int initialActiveCount;

  ActiveTodoCountCubit({
    required this.initialActiveCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveCount));
  void calculateActiveTodoCount(int todoCount){
    emit(state.copyWith(activeTodoCount: todoCount));
  }

  @override
  ActiveTodoCountState? fromJson(Map<String, dynamic> json) {
    return ActiveTodoCountState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ActiveTodoCountState state) {
    return state.toMap();
  }

}
