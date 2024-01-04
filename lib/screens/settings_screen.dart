import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const AboutListTile(
          applicationName: "Todo List",
          applicationLegalese: "All rights reseverd. Please don't copy me.",
          applicationVersion: "1.0",
        ));
  }
}
