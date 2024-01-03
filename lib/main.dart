import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/firebase_options.dart';
import 'package:todo_list_app/provider/todos.dart';
import 'package:todo_list_app/screens/login_screen.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  kakao.KakaoSdk.init(nativeAppKey: "3e2e1df325f6d7c9347b299a842985fe");
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
