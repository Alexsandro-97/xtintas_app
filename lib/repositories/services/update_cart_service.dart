import 'package:dio/dio.dart';

import '/repositories/client/i_client_repository.dart';
import '../errors/errors.dart';

class UpdateCartService {
  final IClient client;

  UpdateCartService(this.client);

  Future updateCart() async {
    try {} on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        throw ExceptionNotFound();
      }
      throw e.error();
    }
  }
}
