import 'package:bloc/bloc.dart';
import 'package:doto_cubit/debounce.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_state.dart';

class TodoSearchCubit extends Cubit<TodoSearchState> {

  TodoSearchCubit() : super(TodoSearchState.initial());

  void searchTerm(String newSearchTerm) {
    emit(state.copyWith(searchTerm: newSearchTerm));
    }
}
