import 'package:flutter/material.dart';
import 'package:todo_list_app/main.dart';
import 'package:todo_list_app/model/kakao_login_model.dart' as kakao;
import 'package:todo_list_app/model/main_view_model.dart';
import 'package:todo_list_app/widgets/add_todo_dialog_widget.dart';

import '../widgets/completed_list_widget.dart';
import '../widgets/todo_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final viewmodel = MainViewModel(kakao.KakaoLogin());
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      const CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(MyApp.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.fact_check_outlined,
              ),
              label: "Todos"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
              ),
              label: "Completed")
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AddTodoDialogWidget();
          },
        ),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
