import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopdig/modules/notification/screen/notif_screen.dart';
import 'package:kopdig/modules/pesanan/screen/pengiriman.dart';
import 'package:kopdig/modules/product/screen/market_screen.dart';
import 'package:kopdig/modules/profile/screen/profile_screen.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class BottomNavigation extends StatefulWidget{
  const BottomNavigation ({Key? key}) : super(key: key);
  _BottomNavigation createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _screenList = <Widget>[
    MarketScreen(),
    NotifScreen(),
    Pengiriman(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none_rounded),
                label: 'Notifikasi'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'Pesanan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profil')
          ],
          selectedItemColor: KopdigTheme.primaryColorDarker,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}