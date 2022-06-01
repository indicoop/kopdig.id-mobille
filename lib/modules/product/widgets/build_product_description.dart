import 'package:flutter/material.dart';

class BuildProductDescription extends StatelessWidget {
  final stok, masaPenyimpanan;
  final String address, description;

  const BuildProductDescription(
      {Key? key,
      required this.stok,
      required this.masaPenyimpanan,
      required this.address,
      required this.description})
      : super(key: key);

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
              Text("$stok"),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(
                width: 200,
                child: Text("Masa Penyimpanan"),
              ),
              Text("$masaPenyimpanan Minggu"),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(
                width: 200,
                child: Text("Dikirim dari"),
              ),
              Text("$address"),
            ],
          ),
          const SizedBox(height: 12,),
          const Text("Deskripsi"),
          const SizedBox(height: 12,),
          Text(description),

        ],
      ),
    );
  }
}
