import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateApp extends StatefulWidget{
  const RateApp ({Key? key}) : super(key: key);
  _RateApp createState() => _RateApp();
}

class _RateApp extends State<RateApp> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Colors.black,),
          centerTitle: true,
          title: Text("Rate Aplikasi", style: KopdigTheme.title),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                text: "Beri rating aplikasi ini \n",
                                style: KopdigTheme.title1,
                              ),
                              TextSpan(
                                text: "Sampaikan pendapat anda",
                                style: KopdigTheme.text1,
                              )
                            ],
                          )),
                          RatingBar(
                              ratingWidget: RatingWidget(
                                  full: Icon(Icons.star),
                                  half: Icon(Icons.star_half),
                                  empty: Icon(Icons.star_outline)
                              ),
                              onRatingUpdate: (rating){
                                print(rating);
                              },
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
                            direction: Axis.horizontal,
                            itemSize: 45.0,
                              ),
                          Text('Tulis Ulasan \n'),
                          Text('Rating dan Ulasan', style: KopdigTheme.title1,),
                          _buildRating(),
                          SizedBox(height: 20.0,),
                          _buildUlasan(),
                          SizedBox(height: 20.0,),
                          _buildUlasan()
                        ]
                    )
                )
            )
        )
    );
  }

  Widget _buildRating(){
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20.0, top: 10.0),
            child: Text('5.0\n', style: TextStyle(fontSize: 50.0)),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              chartRow(context, '5', 100),
              chartRow(context, '4', 8),
              chartRow(context, '3', 2),
              chartRow(context, '4', 1),
              chartRow(context, '1', 0),
              SizedBox(height: 8),
            ],
          ),
        ),
      ]
    );
  }

  Widget chartRow(BuildContext context, String label, int pct) {
    return Row(
      children: [
        Text(label, style: KopdigTheme.text1),
        SizedBox(width: 8),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
          child:
          Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: KopdigTheme.primaryColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(''),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * (pct/100) * 0.5,
                  decoration: BoxDecoration(
                      color: KopdigTheme.primaryColorDarker,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(''),
                ),
              ]
          ),
        ),
      ],
    );
  }

  Widget _buildUlasan(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 35.0,
            ),
            SizedBox(width: 10.0,),
            Text('Savina', style: KopdigTheme.title1,)
          ]
        ),
        SizedBox(height: 15.0,),
        Text('Salah satu aplikasi koperasi terbaik ')
      ],
    );
  }
}
