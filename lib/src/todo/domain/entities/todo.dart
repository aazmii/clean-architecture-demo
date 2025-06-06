// ignore_for_file: public_member_api_docs, sort_constructors_first

class Todo {
  String id;
  String title;
  bool isDone;
  Todo({required this.isDone, required this.id, required this.title});
  Todo copyWith({String? title, bool? isDone}) {
    return Todo(id: id, title: title ?? this.title, isDone: isDone ?? this.isDone);
  }

 
}
