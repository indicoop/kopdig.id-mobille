import 'package:flutter/material.dart';
import 'package:kopdig/core/network/response/product/product_response.dart';
import 'package:kopdig/modules/product/bloc/product_bloc.dart';
import 'package:kopdig/modules/product/bloc/product_event.dart';
import 'package:kopdig/modules/product/bloc/product_state.dart';
import 'package:kopdig/modules/product/widgets/market_item.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  TextEditingController? textController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late ProductBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProductBloc();
    _bloc.add(GetProducts());
  }

  Widget blocListener(Widget child) {
    return BlocListener(
      bloc: _bloc,
      listener: (ctx, state) => print("$state"),
      child: child,
    );
  }

  Widget blocBuilder() {
    return BlocBuilder(
      bloc: _bloc,
      builder: (ctx, state) {
        if (state is ShowLoadingProduct) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShowProducts) {
          return _buildProductBody(state.products);
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: const Text("Berdasarkan Kategori Produk",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 8,
              ),
              ListTile(
                leading: Icon(Icons.movie),
                title: Text('Movies'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.tv),
                title: Text('TV Shows'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.save_alt),
                title: Text('Watchlist'),
                onTap: () {},
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.info_outline),
                title: Text('About'),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: blocListener(blocBuilder()),
      ),
    );
  }

  Widget _buildProductBody(List<Product> products){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
            child: Image.asset(
              'assets/kopdig.png',
            ),
          ),
          const SizedBox(height: 18),
          _buildSearchBar(),
          const SizedBox(height: 18),
          InkWell(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Berdasarkan kategori produk"),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          GridView.builder(
            itemCount: products.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 280,
            ),
            itemBuilder: (ctx, index) {
              return MarketItem(product: products[index],);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'cari apa',
                hintStyle: KopdigTheme.bodyText,
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: KopdigTheme.fieldColor,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 16,
                ),
              ),
              style: KopdigTheme.bodyText,
              onChanged: (s) async {
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Icon(Icons.shopping_cart_outlined, color: Colors.grey),
          const SizedBox(
            width: 8,
          ),
          const Icon(
            Icons.chat_bubble_outline,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
