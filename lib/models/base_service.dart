abstract class BaseService {
  final String apiURL = "localhost";

  Future<dynamic> getResponse(String url);
}