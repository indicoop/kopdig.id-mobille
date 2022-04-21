import 'package:flutter/material.dart';
import 'package:kopdig/modules/login/screen/LoginScreen.dart';
import 'package:kopdig/modules/register/screen/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginScreen()
    );
  }
}
