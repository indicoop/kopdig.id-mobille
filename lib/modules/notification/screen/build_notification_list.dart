import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class NotificationList extends StatefulWidget{
  String title;
  String subtitle;
  String imageUrl;
  String time;
  NotificationList({required this.title,required this.subtitle,required this.imageUrl,required this.time,});
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: KopdigTheme.whitegrey,
        ),
        child: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(right: 10.0),
                child: Image(image: NetworkImage(
                    widget.imageUrl),
                  height: 70.0,
                  width: 70.0,
                  fit: BoxFit.cover,)
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: KopdigTheme.smalltitle,),
                    Text(widget.subtitle),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.star_outline, color: KopdigTheme.yellowStar,),
                        Icon(Icons.star_outline, color: KopdigTheme.yellowStar,),
                        Icon(Icons.star_outline, color: KopdigTheme.yellowStar,),
                        Icon(Icons.star_outline, color: KopdigTheme.yellowStar,),
                        Icon(Icons.star_outline, color: KopdigTheme.yellowStar,),
                      ],
                    ),
                    Text(widget.time,style: TextStyle(fontSize: 12),),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}



