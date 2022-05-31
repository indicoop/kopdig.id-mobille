import 'package:flutter/material.dart';
import 'package:kopdig/modules/product/widgets/market_item.dart';
import 'package:kopdig/modules/store/widget/BuildItemProduct.dart';

class BuildListProduct extends StatelessWidget {
  const BuildListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (e, i) => BuildItemProduct()),
    );
  }
}
