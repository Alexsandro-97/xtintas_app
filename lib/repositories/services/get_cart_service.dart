import 'package:dio/dio.dart';
import 'package:xtintas_app/models/cart_model.dart';

import '/repositories/client/i_client_repository.dart';
import '/utils/constants/url_constant.dart';
import '../errors/errors.dart';

class GetCartService {
  final IClient client;

  GetCartService(this.client);

  Future<List<Cart>> fetchCart() async {
    try {
      final Response response = await client.get(UrlsAndRoutes.cartRoute);
      List jsonResponse = response.data;
      final carts = jsonResponse.map((json) => Cart.fromJson(json)).toList();
      return carts;
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        throw ExceptionNotFound();
      }
      throw e.error();
    }
  }
}
