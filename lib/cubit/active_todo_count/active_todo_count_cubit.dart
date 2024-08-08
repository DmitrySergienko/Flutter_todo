import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final int initialActiveCount;

  ActiveTodoCountCubit({
    required this.initialActiveCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveCount));
  void calculateActiveTodoCount(int todoCount){
    emit(state.copyWith(activeTodoCount: todoCount));
  }

}
