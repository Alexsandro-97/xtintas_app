import 'package:dio/dio.dart';
import '/repositories/client/i_client_repository.dart';
import '/utils/constants/url_constant.dart';

import '../../models/paint_model.dart';
import '../errors/errors.dart';

class PaintService {
  final IClient client;

  PaintService(this.client);

  Future<List<Paint>> fetchPaints() async {
    try {
      final Response response = await client.get(UrlsAndRoutes.paintsRoute);
      List jsonResponse = response.data["data"];
      final paints = jsonResponse.map((json) => Paint.fromJson(json)).toList();
      return paints;
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        throw ExceptionNotFound();
      }
      throw e.error();
    }
  }
}
