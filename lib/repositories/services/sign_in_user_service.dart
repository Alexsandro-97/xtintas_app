import 'package:dio/dio.dart';

import '/repositories/client/i_client_repository.dart';
import '/repositories/errors/errors.dart';
import '/utils/constants/url_constant.dart';

class SignInService {
  final IClient client;

  SignInService(this.client);

  Future<String?> signInUser() async {
    try {
      final Response response = await client.get(UrlsAndRoutes.signInRoute);
      final accessToken = response.data['access-token'];
      return accessToken;
    } on DioError catch (e) {
      int? statusCode = e.response!.statusCode;
      if (statusCode == 404) {
        throw ExceptionNotFound();
      }
      throw e.error();
    }
  }
}
