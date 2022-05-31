import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

String image =
    "https://awsimages.detik.net.id/community/media/visual/2022/03/15/kenapa-logo-halal-diganti-ada-perpindahan-wewenang-dari-mui-ke-kemenag.jpeg?w=650&q=80";

class BuildStoreCard extends StatelessWidget {
  const BuildStoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12,),
          _buildHeadSection(),
          SizedBox(height: 12,),
          _buildMerchantRatingSection(),
          SizedBox(height: 12,),
        ],
      ),
    );
  }
}


Widget _buildHeadSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      children: [
        SizedBox(
          height: 55,
          width: 55,
          child: Image.network(image),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Koperasi Jaya"),
            Text(
              "Aktif 40 menit lalu",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        const Spacer(),
        _buildFollowMerchant(),
        const SizedBox(width: 8,),
        _buildChatMerchant()
        // ElevatedButton(onPressed: () {}, child: Text("Kunjungi Toko"))
      ],
    ),
  );
}

Widget _buildMerchantRatingSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      children: [
        Text(
          "220",
          style: TextStyle(
              color: KopdigTheme.primaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4,),
        const Text(
          "Produk",
        ),
        const SizedBox(width: 16,),
        Text(
          "5.0",
          style: TextStyle(
              color: KopdigTheme.primaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4,),
        const Text(
          "Penilaian",
        ),
        const SizedBox(width: 16,),
        Text(
          "90%",
          style: TextStyle(
              color: KopdigTheme.primaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4,),
        const Text(
          "Chat dibalas",
        ),
      ],
    ),
  );
}

Widget _buildChatMerchant(){
  return InkWell(
    onTap: (){},
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: KopdigTheme.primaryColorDarker,
          borderRadius: BorderRadius.circular(18)),
      child: const Center(
        child: Text(
          "Chat Toko",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget _buildFollowMerchant(){
  return InkWell(
    onTap: (){},
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: KopdigTheme.primaryColorDarker,
          borderRadius: BorderRadius.circular(18)),
      child: const Center(
        child: Text(
          "Ikuti",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
