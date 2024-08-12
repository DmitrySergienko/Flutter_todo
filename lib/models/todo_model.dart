import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

enum Filter { all, active, completed }

class Todo extends Equatable {
  final String id;
  final String desc;
  final bool completed;

  Todo({
    String? id,
    required this.desc,
    this.completed = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object?> get props => [id, desc, completed];

  @override
  String toString() {
    return 'Todo{id: $id, desc: $desc, completed: $completed}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'desc': desc,
      'completed': completed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] ?? '',
      desc: map['desc'] ?? '',
      completed: map['completed'] ?? false,
    );
  }
  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
