import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopdig/modules/profile/edit_profile/screen/edit_profile.dart';
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
                            backgroundImage: NetworkImage('http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg'),
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
                  SizedBox(height: 10.0,),
                  _buildTitleList('Account'),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfile()),
                        );
                      },
                      child: _buildList('Edit Profile')
                  ),
                  _buildList('Pesanan'),
                  _buildList('Bantuan'),
                  SizedBox(height: 10.0,),
                  _buildTitleList('General'),
                  _buildList('Keamanan & Kebijakan Privasi'),
                  _buildList('Syarat Penggunaan'),
                  _buildList('Rate Aplikasi'),
                  _buildLogout(),
                ]
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleList(String text) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, top: 8.0, right: 10.0),
      child: Text(text, style: KopdigTheme.title1,
      ),
    );
  }

  Widget _buildList(String text) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, top: 8.0, right: 10.0),
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

  Widget _buildLogout(){
    return TextButton(
      onPressed: () =>
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  content: const Text(
                      'Are you sure you want to log out?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'CANCLE'),
                      child: const Text('CANCLE'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'LOGOUT'),
                      child: const Text('LOGOUT'),
                    ),
                  ],
                ),
          ),
      child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Logout',
                  style: TextStyle(
                      fontFamily: poppins,
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ]
          )
      ),
    );
  }
}