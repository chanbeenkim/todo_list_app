import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget(
      {super.key,
      this.title = "",
      this.description = "",
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          const SizedBox(
            height: 8,
          ),
          buildDescription(),
          const SizedBox(
            height: 32,
          ),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return TextFormField(
      maxLength: 1,
      initialValue: title,
      onChanged: onChangedTitle,
      validator: (title) {
        if (title!.isEmpty) {
          return "The title cannot be empty";
        }
        return null;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "Title",
      ),
    );
  }

  Widget buildDescription() {
    return TextFormField(
      maxLength: 3,
      initialValue: description,
      onChanged: onChangedDescription,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "Description",
      ),
    );
  }

  Widget buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.black,
          ),
        ),
        onPressed: onSavedTodo,
        child: const Text(
          "Save",
        ),
      ),
    );
  }
}
