import 'package:flutter/material.dart';
import 'package:kopdig/core/network/response/product/product_response.dart';
import 'package:kopdig/modules/product/widgets/build_product_description.dart';
import 'package:kopdig/modules/product/widgets/build_product_merchant.dart';
import 'package:kopdig/modules/product/widgets/build_product_ongkir.dart';
import 'package:kopdig/modules/product/widgets/button_product_detail.dart';
import 'package:kopdig/modules/product/widgets/product_rating.dart';
import 'package:kopdig/modules/store/screen/store_screen.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';
import 'package:kopdig/utils/currency_formatter.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product? product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with TickerProviderStateMixin {
  var listImage = [
    "https://media.istockphoto.com/photos/table-top-view-of-spicy-food-picture-id1316145932?b=1&k=20&m=1316145932&s=170667a&w=0&h=feyrNSTglzksHoEDSsnrG47UoY_XX4PtayUPpSMunQI=",
    "http://cdn.cnn.com/cnnnext/dam/assets/160222142959-indonesian-food-indomie-9444-1900px.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/17/f5/39/f7/fooood-at-the-food-department.jpg"
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late PersistentBottomSheetController _controller;
  late AnimationController controller;
  int _currentGalleryNumber = 1;
  bool _isFav = false;
  int _quantity = 0;

  void initController() {
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 500);
    controller.reverseDuration = const Duration(milliseconds: 500);
  }

  @override
  initState() {
    super.initState();
    initController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                child: Text(widget.product?.name ?? "Nama Produk",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16),
                child: Text(
                    stringtoRupiah(widget.product?.price.toInt() ?? 0),
                    style: KopdigTheme.title),
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
              buildProductMerchant(() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => StoreScreen()));
              }),
              const SizedBox(
                height: 12,
              ),
              BuildProductDescription(
                stok: widget.product?.stock ?? 0,
                masaPenyimpanan: 3,
                address: "Kota Bandung",
                description: widget.product?.description ?? "",
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonProductDetail(
                onTapBuyNow: () => showModalBottomSheet(
                        transitionAnimationController: controller,
                        isScrollControlled: true,
                        enableDrag: false,
                        context: context,
                        builder: (builder) => _buildBottomModalContent())
                    .whenComplete(() => initController()),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomModalContent() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter mystate) {
        return SizedBox(
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      stringtoRupiah(widget.product?.price.toInt() ?? 0),
                    style: KopdigTheme.title1,
                  ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close)),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text("Stok : 160"),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Jumlah",
                      style: KopdigTheme.title1,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        mystate(() {
                          if (_quantity > 0) {
                            _quantity--;
                          }
                        });
                      },
                      child: const Icon(Icons.remove_circle, size: 32)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "$_quantity",
                      style: KopdigTheme.title1,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        mystate(() {
                          _quantity++;
                        });
                      },
                      child: Icon(Icons.add_circle, size: 32)),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                height: 55,
                decoration: BoxDecoration(
                    color: KopdigTheme.primaryColorLighter,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    "Beli Sekarang",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
