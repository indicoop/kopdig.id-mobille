import 'package:flutter/material.dart';

class BuildProductDescription extends StatelessWidget {
  const BuildProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding:  EdgeInsets.symmetric(vertical: 16.0),
            child: Text("Rincian Produk", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
          ),
          Row(
            children: [
              const SizedBox(
                width: 200,
                child: Text("Stok"),
              ),
              Text("Stok"),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(
                width: 200,
                child: Text("Masa Penyimpanan"),
              ),
              Text("3 Minggu"),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(
                width: 200,
                child: Text("Dikirim dari"),
              ),
              Text("Kota Bandung"),
            ],
          ),
          const SizedBox(height: 12,),
          const Text("Deskripsi"),
          const SizedBox(height: 12,),
          Text("Beli roti lembut yang dibuat dengan 100% teknik Jepang. Roti tawar vegan ini pakai ube, ada rasa manis natural dengan warna yang gemas. Diolah tanpa telur, susu, dan butter. Kita menggunakan soy milk dan olive oil untuk adonan roti vegan. Jika pesan setelah jam 15.00, akan diproses keesokan harinya."),

        ],
      ),
    );
  }
}
