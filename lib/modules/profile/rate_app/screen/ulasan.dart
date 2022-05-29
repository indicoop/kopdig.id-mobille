import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class UlasanScreen extends StatefulWidget{
  const UlasanScreen ({Key?key}) : super(key: key);
  _UlasanScreenState createState() => _UlasanScreenState();
}

class _UlasanScreenState extends State<UlasanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Colors.black,),
          title: Text("Posting", style: KopdigTheme.text1),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 40.0,),
                              SizedBox(width: 20.0,),
                              Text.rich(TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Savina \n',
                                    style: KopdigTheme.title1,
                                  ),
                                  TextSpan(
                                    text: 'Beri rating aplikasi ini',
                                    style: KopdigTheme.text1,
                                  )
                                ]
                              ))
                            ],
                          ),
                          SizedBox(height: 20.0,),
                          _buildRatingBar(),
                          _buildTextInput(),
                        ]
                    )
                )
            )
        )
    );
  }

  Widget _buildRatingBar() {
    return RatingBar(
      ratingWidget: RatingWidget(
          full: Icon(Icons.star),
          half: Icon(Icons.star_half),
          empty: Icon(Icons.star_outline)
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
      direction: Axis.horizontal,
      itemSize: 60.0,
    );
  }

  Widget _buildTextInput(){
    var _namaController;
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
      child: TextField(
        showCursor: true,
        controller: _namaController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black45,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black45,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
      ),
    );
  }
}