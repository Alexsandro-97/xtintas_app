import 'package:dio/dio.dart';

import '/repositories/client/i_client_repository.dart';
import '/repositories/errors/errors.dart';
import '/utils/constants/url_constant.dart';

class SignOutService {
  final IClient client;

  SignOutService(this.client);

  Future<dynamic> signOutUser() async {
    try {
      final Response response = await client.get(UrlsAndRoutes.signOutRoute);
      return response.data;
    } on DioError catch (e) {
      int? statusCode = e.response!.statusCode;
      if (statusCode == 404) {
        throw ExceptionNotFound();
      }
      throw e.error();
    }
  }
}
