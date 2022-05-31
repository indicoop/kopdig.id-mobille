

import 'package:flutter/material.dart';
import 'package:kopdig/modules/product/screen/product_detail_screen.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class BuildItemProduct extends StatelessWidget {
  const BuildItemProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => ProductDetailScreen(),
            ),
          );
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: const Color(0xFFEEF3D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://ekrutassets.s3.ap-southeast-1.amazonaws.com/blogs/images/000/004/998/original/H1.jpg',
                fit: BoxFit.cover,
                width: 180,
                height: 120,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'nama Produk',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: KopdigTheme.subTitle,
                    ),
                    Text('*nama Koperasi',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: KopdigTheme.bodyText),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                        ),
                        Text('Bondowoso', style: KopdigTheme.bodyText),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text('5.0', style: KopdigTheme.bodyText),
                      ],
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text('Rp 2000', style: KopdigTheme.subTitle)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}