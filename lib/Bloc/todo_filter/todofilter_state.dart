part of 'todofilter_bloc.dart';

class TodoFilerState extends Equatable {
  final Filter filter;

  const TodoFilerState({required this.filter});

  @override
  List<Object?> get props => [filter];

  @override
  String toString() {
    return 'TodoState{filter: $filter}';
  }

  factory TodoFilerState.initial() {
    return const TodoFilerState(filter: Filter.all);
  }

  TodoFilerState copyWith({
    Filter? filter,
  }) {
    return TodoFilerState(
      filter: filter ?? this.filter,
    );
  }
}
