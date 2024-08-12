part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;

  const TodoSearchState({required this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];

  @override
  String toString() {
    return 'TodoState{filter: $searchTerm}';
  }

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchTerm: '');
  }

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'searchTerm': searchTerm,
    };
  }

  factory TodoSearchState.fromMap(Map<String, dynamic> map) {
    return TodoSearchState(
      searchTerm: map['searchTerm'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoSearchState.fromJson(String source) =>
      TodoSearchState.fromMap(json.decode(source));
}