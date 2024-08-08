import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilerState> {
  TodoFilterCubit() : super(TodoFilerState.initial());

  void changeFilter(Filter newFilter){
    emit(state.copyWith(filter: newFilter));
  }
}
