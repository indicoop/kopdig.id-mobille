import 'package:flutter/material.dart';
import 'package:kopdig/modules/store/widget/BuildStoreCard.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16,),
            BuildStoreCard()
          ],
        ),
      ),
    );
  }
}
