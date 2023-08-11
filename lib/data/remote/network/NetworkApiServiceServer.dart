import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../AppException.dart';

class NetworkApiServiceServer{
  String baseUrl="https://geniemoneyy.com/genie_money/public/index.php/";
  Future getResponse(String url)async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse("https://geniemoneyy.com/genie_money/public/index.php/getcreditcarddata?userid=25"));
      responseJson = jsonDecode(response.body);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


  Future postResponse(String url, Map<String, dynamic>? jsonBody,) async{
    dynamic responseJson;

    try {

      final response = await http.post(Uri.parse(baseUrl + url),body: jsonEncode(jsonBody));
      print("MVVM response : "+response.body);
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