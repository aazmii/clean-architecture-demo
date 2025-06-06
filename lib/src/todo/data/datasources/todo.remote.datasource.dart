import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/src/todo/data/models/todo.model.dart';


abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> fetchTodos();
  Future<void> addTodo(TodoModel todo);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final http.Client client;

  TodoRemoteDataSourceImpl(this.client);

  @override
  Future<List<TodoModel>> fetchTodos() async {
    final response = await client.get(Uri.parse('https://api.example.com/todos'));

    if (response.statusCode == 200) {
      final List decoded = jsonDecode(response.body) as List;
      return decoded.map((e) => TodoModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    await client.post(
      Uri.parse('https://api.example.com/todos'),
      body: jsonEncode(todo.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
