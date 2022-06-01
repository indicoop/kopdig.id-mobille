import 'package:flutter/material.dart';
import 'package:kopdig/modules/transaction/screen/pembayaran_screen.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

import '../../../ui/component/button/button_kopdig_primary.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget produk() {
      return Container(
        width: double.infinity,
        height: 113,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: KopdigTheme.borderColor, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 91,
              height: 91,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/checkout.png'),
                  ),
                  borderRadius: BorderRadius.circular(9)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brownies coklat',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Text(
                        'RP 50.000',
                        style: KopdigTheme.primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      // TEMPAT +1
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget form() {
      return Container();
    }

    Widget detailpesanan() {
      return Flexible(
        child: Container(
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.only(top: 350),
          padding: EdgeInsets.only(
            left: 20,
            top: 20,
            bottom: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Pesanan',
                style: KopdigTheme.primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'x1 ',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Rp. 50.000',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Voucher',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    '-Rp. 50.000',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Biaya Pengiriman',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    '-Rp. 15.000',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '-Rp. 15.000',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),SizedBox(
                height: 12,
              ),
              const SizedBox(height: 22,),
                kopdigPrimaryButton(
                  context: context,
                  text: 'Checkout',
                  isEnabled: true,
                  onPressed: () async {
                    PembayaranScreen();
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
            ],
          ),
        ),
      );
    }

    

    return Scaffold(
      backgroundColor: KopdigTheme.backgroundcheckoutpage,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: () => Navigator.pop(context),
            );
          },
        ),
        centerTitle: true,
        title: Text("Checkout", style: KopdigTheme.title),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            produk(),
            form(),
            detailpesanan(),
          ],
        ),
      ),
    );
  }
}
