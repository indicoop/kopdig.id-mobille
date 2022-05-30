import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';
import 'package:kopdig/widgets/keranjang_card.dart';

class Keranjang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // butuh API
    // CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: Colors.white10,
        centerTitle: true,
        title: Text(
          'Keranjang',
          style: KopdigTheme.title,
        ),
        elevation: 0,
      );
    }

    Widget keranjangKosong() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_empty_cart.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Upss! Keranjangmu kosong',
              style: KopdigTheme.title1.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Temukan barang favoritmu',
              style: KopdigTheme.text1,
            ),
            Container(
              width: 154,
              height: 44,
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: KopdigTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Cari barang',
                  style: KopdigTheme.title1.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: cartProvider.carts // bingung API
            .map(
              (cart) => KeranjangCard(cart),
            )
            .toList(),
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: KopdigTheme.primaryTextStyle,
                  ),
                  Text(
                    '\$${cartProvider.totalPrice()}', // bingung API
                    style: KopdigTheme.priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 0.3,
              color: KopdigTheme.greydark,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                  backgroundColor: KopdigTheme.primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Checkout',
                      style: KopdigTheme.primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: KopdigTheme.primaryColor,
      appBar: header(),
      body: cartProvider.carts.length == 0
          ? keranjangKosong()
          : content(), // bingung API
      bottomNavigationBar: cartProvider.carts.length == 0
          ? SizedBox()
          : customBottomNav(), // bingung API
    );
  }
}
