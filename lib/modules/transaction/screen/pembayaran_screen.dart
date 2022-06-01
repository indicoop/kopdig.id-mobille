import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class PembayaranScreen extends StatelessWidget {
  const PembayaranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget check() {
      return Container(
        margin: EdgeInsets.only(top: 41),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 104,
                height: 104,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: KopdigTheme.backgroundcheckoutpage,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/Success.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Berhasil',
                style: KopdigTheme.primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Uang Anda berhasil ditransfer',
                style: KopdigTheme.bodyText.copyWith(
                  fontWeight: regular,
                ),
              ),
              Container(
                width: 220,
                height: 55,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: KopdigTheme.backgroundcheckoutpage,
                    borderRadius: BorderRadius.circular(9)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text(
                    'Rp 40.000',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: bold,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      );
    }

    Widget detailsuccess() {
      return Flexible(
        child: Container(
          width: double.infinity,
          height: 250,
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
                    'Tanggal',
                    style: KopdigTheme.bodyText.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Jam',
                    style: KopdigTheme.bodyText.copyWith(
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
                    '20 Januari 2022',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '11.45 AM',
                    style: KopdigTheme.primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '20 Januari 2022',
                style: KopdigTheme.bodyText.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              Text(
                'Bank Account **2576',
                style: KopdigTheme.primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget btnselesai(){
      return Center(
        child: Container(
                    width: 220,
                    height: 55,
                    margin: EdgeInsets.only(top: 600, bottom: 70),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/market_screen');
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: KopdigTheme.primaryColorLighter,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text(
                        'Selesai',
                        style: KopdigTheme.primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text("Pembayaran", style: KopdigTheme.title),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            check(),
            detailsuccess(),
            btnselesai(),
          ],
        ),
      ),
    );
  }
}
