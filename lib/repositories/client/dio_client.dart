import 'package:dio/dio.dart';
import '/repositories/client/i_client_repository.dart';
import '/utils/constants/url_constant.dart';

class DioClient implements IClient {
  final dio = Dio();

  @override
  Future<Response> delete(String route, {dynamic data}) async {
    dio.options.headers['Content-Type'] = 'application/json';
    final Response response =
        await dio.delete(UrlsAndRoutes.baseUrl + route, data: data);
    return response;
  }

  @override
  Future<Response> get(String route) async {
    dio.options.headers['Content-Type'] = 'application/json';
    final Response response = await dio.get(UrlsAndRoutes.baseUrl + route);
    return response;
  }

  @override
  Future<Response> post(String route, {dynamic data}) async {
    dio.options.headers['Content-Type'] = 'application/json';
    final Response response =
        await dio.post(UrlsAndRoutes.baseUrl + route, data: data);
    return response;
  }

  @override
  Future<Response> put(String route, {dynamic data}) async {
    dio.options.headers['Content-Type'] = 'application/json';
    final Response response =
        await dio.put(UrlsAndRoutes.baseUrl + route, data: data);
    return response;
  }
}
