abstract class IClient {
  Future<dynamic> get(String route);
  Future<dynamic> post(String route, {dynamic data});
  Future<dynamic> put(String route, {dynamic data});
  Future<dynamic> delete(String route, {dynamic data});
}
