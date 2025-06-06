  
import 'package:test_app/src/todo/domain/entities/todo.dart';
import 'package:test_app/src/todo/domain/repositories.dart';

class GetTodos {
  final TodoRepository repository;

  GetTodos(this.repository);

  Future<List<Todo>> call() => repository.getTodos();
}
