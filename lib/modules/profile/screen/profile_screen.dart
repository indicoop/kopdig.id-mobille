import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopdig/ui/component/navigation/bottom_navigation.dart';
import '../../../ui/theme/kopdig_theme.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen ({Key?key}) : super(key: key);
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black,),
        centerTitle: true,
        title: Text("Profile", style: KopdigTheme.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          radius: 60.0,
                        ),
                      ),
                      Container(
                        child: Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hello, Savina \n',
                                style: KopdigTheme.darktitle,
                              ),
                              TextSpan(
                                  text: '@savinasz',
                                  style: KopdigTheme.text
                              ),
                            ]
                        ),
                        ),
                      )
                    ]
                ),
                _buildTitleList('Account'),
                _buildList('Edit Profile'),
                _buildList('Pesanan'),
                _buildList('Bantuan'),
                _buildTitleList('General'),
                _buildList('Keamanan & Kebijakan Privasi'),
                _buildList('Syarat Penggunaan'),
                _buildList('Rate Aplikasi'),
                _buildList('Log Out')
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(isEnabled: true, onPressed: () {}),
    );
  }

  Widget _buildTitleList(String text) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text( text, style: KopdigTheme.title1,
      ),
    );
  }

  Widget _buildList(String text) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, top: 8.0, right: 10.0 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text, style: KopdigTheme.text1,
            ),
            Icon(Icons.keyboard_arrow_right_outlined),
          ]
      ),
    );
  }
}