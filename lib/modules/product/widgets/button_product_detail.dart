import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class ButtonProductDetail extends StatelessWidget {
  final Function() onTapBuyNow;
  const ButtonProductDetail({Key? key, required this.onTapBuyNow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0),
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: const Icon(Icons.chat_bubble_outline_rounded, size: 35, color: KopdigTheme.primaryColorLighter),
            ),
            InkWell(onTap: () {}, child: const Icon(Icons.shopping_cart_outlined, size: 35, color: KopdigTheme.primaryColorLighter,)),
            InkWell(
              onTap: onTapBuyNow,
              child: Container(
                height: 70,
                width: 180,
                color: KopdigTheme.primaryColorLighter,
                child: const Center(child: Text("Beli Sekarang", style: TextStyle(fontWeight: FontWeight.w600),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
