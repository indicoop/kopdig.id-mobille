import 'package:flutter/material.dart';
import 'package:kopdig/modules/auth/login/screen/LoginScreen.dart';
import 'package:kopdig/modules/chat/detail_chat/detail_chat.dart';
import 'package:kopdig/modules/chat/room_chat/room_chat.dart';
import 'package:kopdig/modules/notification/screen/notif_screen.dart';
import 'package:kopdig/modules/pesanan/screen/pengiriman.dart';
import 'package:kopdig/modules/profile/edit_profile/screen/edit_profile.dart';
import 'package:kopdig/modules/profile/edit_profile/screen/ubah_password.dart';
import 'package:kopdig/modules/profile/rate_app/screen/rate_app.dart';
import 'package:kopdig/modules/profile/rate_app/screen/ulasan.dart';
import 'package:kopdig/modules/profile/screen/profile_screen.dart';

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
      home: const Pengiriman()
    );
  }
}
