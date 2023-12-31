import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/provider/todos.dart';
import 'package:todo_list_app/screens/login_screen.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = "Todo App";

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primaryColor: Colors.amber,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const LoginScreen(),
        ),
      );
}
