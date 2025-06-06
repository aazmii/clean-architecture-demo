import 'package:test_app/src/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<void> createTodo(Todo title);
  Future<void> deleteTodo(String id);
  Future<void> toggleTodo(String id);
  Future<List<Todo>> getTodos();  
}
