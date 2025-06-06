import 'package:test_app/src/todo/domain/entities/todo.dart';
import 'package:test_app/src/todo/domain/repositories.dart';

class TodoRespositoryImpl implements TodoRepository {
  final List<Todo> _todos = [];
  @override
  Future<void> createTodo(Todo todo) async {
    _todos.add(todo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(isDone: !_todos[index].isDone);
    }
  }

  @override
  Future<void> toggleTodo(String id) async {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(isDone: !_todos[index].isDone);
    }
    return Future.value();
  }

  @override
  Future<List<Todo>> getTodos() async => _todos;
}
