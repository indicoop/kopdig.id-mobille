import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildProductOngkir(String ongkir) {
  return SizedBox(
    height: 60,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icon_gratis_ongkir.svg'),
              const Text("Gratis Ongkir")
            ],
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              SvgPicture.asset('assets/icon_gratis_ongkir.svg'),
              Text("Ongkos Kirim : $ongkir"),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ],
      ),
    ),
  );
}
