import 'package:test_app/src/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({required super.id, required super.title, required super.isDone});

  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(id: todo.id, title: todo.title, isDone: todo.isDone);
  }
  Todo toEntity() {
    return this;
  }

  static TodoModel fromJson(Map<String, dynamic> json) =>
      TodoModel(id: json['id'], title: json['title'], isDone: json['isDone']);

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'isDone': isDone};
}
