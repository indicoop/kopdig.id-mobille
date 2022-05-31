import 'package:flutter/material.dart';
import 'package:kopdig/modules/store/widget/BuildListProduct.dart';
import 'package:kopdig/modules/store/widget/BuildStoreCard.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16,),
              BuildStoreCard(),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("Mungkin kamu suka", style: KopdigTheme.title1),
              ),
              BuildListProduct(),

              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 18),
                child: Text("Terlaris", style: KopdigTheme.title1),
              ),
              BuildListProduct(),
              const SizedBox(height: 16,),

            ],
          ),
        ),
      ),
    );
  }
}
