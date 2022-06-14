import 'package:dio/dio.dart';
import '/repositories/client/i_client_repository.dart';
import '/repositories/errors/errors.dart';
import '/utils/constants/url_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final IClient client;

  UserService(this.client);

  Future<bool> signInUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      final Response response = await client.get(UrlsAndRoutes.loginRoute);
      final accessToken = response.data['access-token'];
      await sharedPreferences.setString('access-token', '$accessToken');
      return true;
    } on DioError catch (e) {
      int? statusCode = e.response!.statusCode;
      if (statusCode == 404) {
        throw ExceptionNotFound();
      }
      throw e.error();
    }
  }

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

  Future<Map<String, dynamic>> fetchProfile() async {
    try {
      final Response response = await client.get(UrlsAndRoutes.profileRoute);
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
