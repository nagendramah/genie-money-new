import 'dart:convert';
import 'dart:io';

import 'package:genie_money/data/remote/AppException.dart';
import 'package:genie_money/data/remote/network/BaseApiServicePaySprint.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class NetworkApiServicePaySprint extends BaseApiServicePaySprint{
  @override
  Future getResponse(String url)async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postResponse(String url, Map<String, dynamic>? jsonBody,) async{
    dynamic responseJson;

    try {
      Map<String,String> header={
        'content-type': 'application/json',
        "Token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0aW1lc3RhbXAiOjE2NTEyOTkxNDMsInBhcnRuZXJJZCI6IlBTMDA2NzYiLCJyZXFpZCI6IldFVVJZSEdGIn0.3RK_Ws3VkKJGgW8o9h818JwIWLjRpGCd7CZdK_Z0LaE",
        "Authorisedkey":"OGE4NzE4NTk3NzZkZjgzNzA0NDk3MjU0MGFmMjFmMzk="
      };

      //print("MVVM resquest : "+jsonEncode(jsonBody));
      log("Url :"+baseUrl + url);

      log("Resquest : "+jsonEncode(jsonBody));
      final response = await http.post(Uri.parse(baseUrl + url),headers:header,body: jsonEncode(jsonBody));

      log("Response : "+response.body);
      //print("MVVM response : "+response.body);
      responseJson = jsonDecode(response.body);
      //responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 406:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
        case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
  
}