part of 'todofilter_bloc.dart';

@immutable
sealed class TodofilterEvent extends Equatable {
  const TodofilterEvent();

  @override
  List<Object> get props =>[];


}
final class ChangeFilterEvent extends TodofilterEvent{
  final Filter newFilter;
  const ChangeFilterEvent({required this.newFilter});

  @override
  List<Object> get props =>[];
}

