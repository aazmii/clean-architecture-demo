import 'package:test_app/src/todo/domain/repositories.dart';

import '../../domain/entities/todo.dart';
 
class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<void> call(Todo todo) => repository.createTodo(todo);
}
