  
import 'package:test_app/src/todo/domain/repositories.dart';

class ToggleTodo {
  final TodoRepository repository;

  ToggleTodo(this.repository);

  Future<void> call(String id) => repository.toggleTodo(id);
}
