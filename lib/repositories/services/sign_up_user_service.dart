import 'package:dio/dio.dart';

import '/repositories/client/i_client_repository.dart';
import '/repositories/errors/errors.dart';
import '/utils/constants/url_constant.dart';

class SignUpService {
  final IClient client;

  SignUpService(this.client);

  Future<Map<String, dynamic>> signUpUser(Map<String, dynamic> user) async {
    try {
      final Response response =
          await client.post(UrlsAndRoutes.signUpRoute, data: user);
      return response.data;
    } on DioError catch (e) {
      int? statusCode = e.response!.statusCode;
      if (statusCode == 409) {
        throw ExceptionUserAlreadyExists();
      } else if (statusCode == 404) {
        throw ExceptionNotFound();
      }
      throw e.error();
    }
  }
}
