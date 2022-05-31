import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kopdig/modules/notification/screen/build_notification_list.dart';
import 'package:kopdig/ui/component/navigation/bottom_navigation.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class NotifScreen extends StatefulWidget{
  const NotifScreen ({Key?key}) : super(key: key);
  _NotifScreenState createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  List<Notification> Notif = [
    Notification(
        title: "Jane Russel",
        subtitle: "Awesome Setup",
        imageURL: 'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg',
        time: "Now"),
    Notification(
        title: "Glady's Murphy",
        subtitle: "That's Great",
        imageURL: 'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg',
        time: "Yesterday"),
    Notification(
        title: "Jorge Henry",
        subtitle: "Hey where are you?",
        imageURL: 'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg',
        time: "31 Mar"),
    Notification(
        title: "Philip Fox",
        subtitle: "Busy! Call me in 20 mins",
        imageURL: 'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg',
        time: "28 Mar"),
    Notification(
        title: "Debra Hawkins",
        subtitle: "Thankyou, It's awesome",
        imageURL: 'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg',
        time: "23 Mar"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi',
            style: KopdigTheme.title),
        backgroundColor: Colors.white10, elevation: 0, ),
      body: SafeArea(
        child: Padding( padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: Notif.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NotificationList(
                        title: Notif[index].title,
                        subtitle: Notif[index].subtitle,
                        imageUrl: Notif[index].imageURL,
                        time: Notif[index].time,
                      );
                    },
                  ),
                )
            )
        ),
      ),
    );
  }
}

class Notification{
  String title;
  String subtitle;
  String imageURL;
  String time;
  Notification({required this.title,required this.subtitle,required this.imageURL,required this.time});
}