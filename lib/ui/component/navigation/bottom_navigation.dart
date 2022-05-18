import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

Widget BottomNavigation ({
  required bool isEnabled,
  required Function() onPressed,
})
{
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
      BottomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded), label: 'Notifikasi'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Pesanan'),
      BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil')
      ],
      selectedItemColor: KopdigTheme.primaryColorDarker,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
  );
}