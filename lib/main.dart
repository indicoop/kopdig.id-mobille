import 'package:flutter/material.dart';
import 'package:kopdig/modules/auth/login/screen/LoginScreen.dart';
import 'package:kopdig/modules/product/screen/market_screen.dart';
import 'package:kopdig/modules/notification/screen/notif_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MarketScreen()
    );
  }
}
