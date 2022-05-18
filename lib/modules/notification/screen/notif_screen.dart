import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopdig/ui/component/navigation/bottom_navigation.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class NotifScreen extends StatefulWidget{
  const NotifScreen ({Key?key}) : super(key: key);
  _NotifScreenState createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: KopdigTheme.primaryColorDarker),),
        backgroundColor: Colors.white10, elevation: 0, ),
      body: SafeArea(
        child: Padding( padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                _buildNotif(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(isEnabled: true, onPressed: (){}),
    );
  }

  Widget _buildNotif(){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container (
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 17.0),
                child: Image.asset('assets/f.png', height: 70,),
              ),
              Container(
                child: Expanded(
                  child: Text('Pesananmu siap'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}