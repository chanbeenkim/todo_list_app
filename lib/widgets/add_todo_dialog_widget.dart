import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/model/todo_model.dart';
import 'package:todo_list_app/provider/todos.dart';
import 'package:todo_list_app/widgets/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({super.key});

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: _formKey,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Todo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TodoFormWidget(
            onChangedTitle: (title) => setState(() {
              this.title = title;
            }),
            onChangedDescription: (description) => setState(() {
              this.description = description;
            }),
            onSavedTodo: addTodo,
          ),
        ],
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState;

    if (isValid != null && !isValid.validate()) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        createdTime: DateTime.now(),
        title: title,
        description: description,
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
