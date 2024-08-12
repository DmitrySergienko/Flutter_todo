part of 'todo_filter_cubit.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  const TodoFilterState({required this.filter});

  @override
  List<Object?> get props => [filter];

  @override
  String toString() {
    return 'TodoFilterState{filter: $filter}';
  }

  factory TodoFilterState.initial() {
    return const TodoFilterState(filter: Filter.all);
  }

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filter': filter.index,  // Сохраняем индекс перечисления
    };
  }

  factory TodoFilterState.fromMap(Map<String, dynamic> map) {
    return TodoFilterState(
      filter: Filter.values[map['filter'] ?? 0],  // Восстанавливаем перечисление по индексу
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoFilterState.fromJson(String source) =>
      TodoFilterState.fromMap(json.decode(source));
}
