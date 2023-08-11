abstract class BaseApiServicePaySprint{
  final String baseUrl = "https://paysprint.in/service-api/api/v1/service/";

  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url,Map<String, dynamic> jsonBody);
}