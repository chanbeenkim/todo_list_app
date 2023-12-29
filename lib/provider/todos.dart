import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: "Buy Food", description: """- Eggs
- milk
- Bread
- Water"""),
    Todo(
      createdTime: DateTime.now(),
      title: "Plan family trip to Korea",
      description: """- Rent some hotels
- Rent a car
- Pack suitcase""",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Walk the Dog",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Plan Jacobs birthday party",
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
}
