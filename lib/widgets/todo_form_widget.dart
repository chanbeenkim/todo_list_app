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
      maxLines: 1,
      initialValue: title,
      onChanged: onChangedTitle,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        labelText: "Title",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildDescription() {
    return TextFormField(
      maxLines: 3,
      initialValue: description,
      onChanged: onChangedDescription,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        labelText: "Description",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.blueGrey[800],
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
