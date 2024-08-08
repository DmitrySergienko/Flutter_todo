import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/todo_model.dart';
import '../todo_filter/todofilter_bloc.dart';

part 'filtred_todos_event.dart';
part 'filtred_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  final List<Todo> initialTodos;

  FilteredTodosBloc({
    required this.initialTodos,
  }) : super(FilteredTodosState(filteredTodos: initialTodos)) {
    on<CalculateFilteredTodosEvent>((event, emit) {
      emit(state.copyWith(filteredTodos: event.filteredTodos));
    });
  }
}
