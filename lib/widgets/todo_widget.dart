import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/provider/todos.dart';

import '../model/todo_model.dart';
import '../screens/edit_todo_screen.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        16,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                editTodo(context, todo);
              },
              backgroundColor: Colors.green,
              icon: Icons.edit,
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                deleteTodo(context, todo);
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditTodoScreen(todo: todo),
              ),
            );
          },
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(
              20,
            ),
            child: Row(
              children: [
                Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                  value: todo.isDone,
                  onChanged: (_) {
                    checkTodo(context, todo);
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                        ),
                      ),
                      if (todo.description.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(
                            top: 4,
                          ),
                          child: Text(
                            todo.description,
                            style: const TextStyle(
                              fontSize: 20,
                              height: 1.5,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTodoScreen(
          todo: todo,
        ),
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, "Deleted the task");
  }

  void checkTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    final isDone = provider.toggleTodoStatus(todo);

    Utils.showSnackBar(
        context, isDone ? "Task completed" : "Task marked incompleted");
  }
}
