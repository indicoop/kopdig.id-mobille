import 'package:kopdig/core/network/network_service.dart';
import 'package:kopdig/core/network/response/product/product_response.dart';

class ProductRepository extends NetworkService {
  ProductRepository();

  ProductRepository._privateConstructor();

  static final ProductRepository _instance = ProductRepository
      ._privateConstructor();

  static ProductRepository get instance => _instance;

  Map<String, String> header = {};
  final String contentType = "Content-Type";
  final String applicationJson = "application/json; charset=UTF-8";
  final String token = "token";

  Future<List<Product>> getProducts(String token) async {
    var header = {contentType: applicationJson, 'Authorization': token};
    var map = await getMethod("$BASE_URL/api/all-products", header);

    return ProductResponse.fromJson(map).data?.first.products ?? [];
  }

}