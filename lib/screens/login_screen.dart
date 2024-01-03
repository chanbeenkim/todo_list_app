import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/model/kakao_login.dart';
import 'package:todo_list_app/model/main_view_model.dart';
import 'package:todo_list_app/screens/home_screen.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              TextFormField(
                onTap: () => loginTap(),
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter Email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                  ),
                  child: const Icon(
                    Icons.forward,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: () async {
                  await viewModel.login();
                  setState(
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "카카오 로그인",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginTap() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        Get.offAll(() => const HomeScreen());
      } on FirebaseAuthException catch (e) {
        logger.e(e);
        String message = "";

        if (e.code == "user-not-found") {
          message = "사용자가 존재하지 않습니다.";
        } else if (e.code == "wrong-password") {
          message = "비밀번호를 확인하세요.";
        } else if (e.code == "invalid-email") {
          message = "이메일을 확인하세요.";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.black,
          ),
        );
      }
    }
  }
}
