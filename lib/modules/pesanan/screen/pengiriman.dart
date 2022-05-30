import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class Pengiriman extends StatefulWidget{
const Pengiriman ({Key? key}) : super(key: key);
_Pengiriman createState() => _Pengiriman();
}

class _Pengiriman extends State<Pengiriman> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Colors.black,),
          title: Text("Pengiriman", style: KopdigTheme.title),
        ),
        body:SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              margin: EdgeInsets.only(
                bottom: 10.0,
              ),
              padding: EdgeInsets.only(
                top: 10.0,
                left: 15.0,
                bottom: 10.0
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.directions_bus, size: 30.0,),
                        SizedBox(width: 10.0,),
                        Text("Status Pengiriman", style: KopdigTheme.title1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  timelineRow("Order Confirmed", ''),
                  timelineRow("Order Inprocess", ''),
                  timelineRow("Order Processed", ""),
                  timelineRow("Order Shipped", ""),
                  timelineLastRow("Order Delivered", ""),
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget timelineRow(String title, String subTile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 18,
                height: 18,
                decoration: new BoxDecoration(
                  color: KopdigTheme.primaryColorDarker,
                  shape: BoxShape.circle,
                ),
                child: Text(""),
              ),
              Container(
                width: 3,
                height: 50,
                decoration: new BoxDecoration(
                  color: KopdigTheme.primaryColor,
                  shape: BoxShape.rectangle,
                ),
                child: Text(""),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.0,),
        Expanded(
          flex: 9,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${title}\n ${subTile}',
                  style: TextStyle(
                      fontFamily: poppins,
                      fontSize: 16,
                      color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }

  Widget timelineLastRow(String title, String subTile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 18,
                height: 18,
                decoration: new BoxDecoration(
                  color: KopdigTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Text(""),
              ),
              Container(
                width: 3,
                height: 20,
                decoration: new BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                ),
                child: Text(""),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.0,),
        Expanded(
          flex: 9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${title}\n ${subTile}',
                  style: TextStyle(
                      fontFamily: poppins,
                      fontSize: 16,
                      color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }

}
