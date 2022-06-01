import 'package:flutter/material.dart';
import 'package:kopdig/core/network/response/product/product_response.dart';
import 'package:kopdig/modules/product/screen/product_detail_screen.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';
import 'package:kopdig/utils/currency_formatter.dart';

class MarketItem extends StatelessWidget {
  final Product product;
  const MarketItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => ProductDetailScreen(product: product),
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
                product.thumbnail,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: KopdigTheme.subTitle,
                    ),
                    Text('*Koperasi Jiwa',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: KopdigTheme.bodyText),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.location_on,
                    //       color: Colors.redAccent,
                    //     ),
                    //     Text('Bondowoso', style: KopdigTheme.bodyText),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.star,
                    //       color: Colors.amber,
                    //     ),
                    //     Text('5.0', style: KopdigTheme.bodyText),
                    //   ],
                    // ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text('${stringtoRupiah(product.price.toInt())}', style: KopdigTheme.subTitle)),
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
