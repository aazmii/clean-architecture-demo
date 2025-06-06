import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/src/todo/application/usecases/add.todo.dart';
import 'package:test_app/src/todo/application/usecases/get.todos.dart';
import 'package:test_app/src/todo/application/usecases/toggle.todo.dart';
import 'package:test_app/src/todo/data/todo.repository.imp.dart';
import 'package:test_app/src/todo/domain/entities/todo.dart';

final _repositoryProvider = Provider((ref) => TodoRespositoryImpl());

final _getTodosProvider = Provider((ref) => GetTodos(ref.read(_repositoryProvider)));
final _addTodoProvider = Provider((ref) => AddTodo(ref.read(_repositoryProvider)));
final _toggleTodoProvider = Provider((ref) => ToggleTodo(ref.read(_repositoryProvider)));

final todoListProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  final getTodos = ref.read(_getTodosProvider);
  final addTodo = ref.read(_addTodoProvider);
  final toggleTodo = ref.read(_toggleTodoProvider);
  return TodoNotifier(getTodos, addTodo, toggleTodo);
});

class TodoNotifier extends StateNotifier<List<Todo>> {
  final GetTodos _getTodos;
  final AddTodo _addTodo;
  final ToggleTodo _toggleTodo;

  TodoNotifier(this._getTodos, this._addTodo, this._toggleTodo) : super([]) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    state = await _getTodos();
  }

  Future<void> add(String title) async {
    final todo = Todo(id: DateTime.now().toString(), title: title, isDone: false);
    await _addTodo(todo);
    await loadTodos();
  }

  Future<void> toggle(String id) async {
    await _toggleTodo(id);
    await loadTodos();
  }
}
