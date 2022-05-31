import 'package:flutter/material.dart';
import 'package:kopdig/modules/product/widgets/build_product_description.dart';
import 'package:kopdig/modules/product/widgets/build_product_merchant.dart';
import 'package:kopdig/modules/product/widgets/build_product_ongkir.dart';
import 'package:kopdig/modules/product/widgets/button_product_detail.dart';
import 'package:kopdig/modules/product/widgets/product_rating.dart';
import 'package:kopdig/modules/store/screen/store_screen.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var listImage = [
    "https://media.istockphoto.com/photos/table-top-view-of-spicy-food-picture-id1316145932?b=1&k=20&m=1316145932&s=170667a&w=0&h=feyrNSTglzksHoEDSsnrG47UoY_XX4PtayUPpSMunQI=",
    "http://cdn.cnn.com/cnnnext/dam/assets/160222142959-indonesian-food-indomie-9444-1900px.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/17/f5/39/f7/fooood-at-the-food-department.jpg"
  ];

  int _currentGalleryNumber = 1;
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 240,
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        onPageChanged: (index) {
                          setState(() {
                            _currentGalleryNumber = index + 1;
                          });
                        },
                        itemBuilder: (context, index) {
                          String image = listImage[index];
                          return Image.network(
                            image,
                            fit: BoxFit.cover,
                            height: 240,
                          );
                        }),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.black,
                            ),
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(18)),
                      child: Center(
                        child: Text(
                          "$_currentGalleryNumber / 3",
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                child: Text('Nama',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16),
                child: Text('Rp 10.000', style: KopdigTheme.title),
              ),
              const SizedBox(
                height: 12,
              ),
              buildProductRating(4.5, 180, _isFav, () {
                setState(() {
                  _isFav = !_isFav;
                });
              }),
              const SizedBox(
                height: 12,
              ),
              buildProductOngkir("Rp 10.000"),
              const SizedBox(
                height: 12,
              ),
              buildProductMerchant((){
                Navigator.push(context, MaterialPageRoute(builder: (c) => StoreScreen()));
              }),
              const SizedBox(
                height: 12,
              ),
              BuildProductDescription(),
              const SizedBox(
                height: 40,
              ),
              ButtonProductDetail()
            ],
          ),
        ),
      ),
    );
  }
}
