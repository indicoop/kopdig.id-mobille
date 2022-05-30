import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

Widget buildProductRating(double rating, int ratingCount, bool isFav, Function() onTap) {
  return Row(
    children: [
      const SizedBox(
        width: 16,
      ),
      const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      Text('$rating'),
      const SizedBox(
        width: 12,
      ),
      Text('$ratingCount Terjual'),
      const Spacer(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Penilaian Produk',
            style: KopdigTheme.bodyText,
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: onTap,
            child: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.redAccent : Colors.grey,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      )
    ],
  );
}
