abstract class BaseService {
  final String baseUrl = "https://api.thedogapi.com/v1";

  Future<dynamic> getResponse(String url);

}