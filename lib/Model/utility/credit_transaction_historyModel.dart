import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TransactionApiServices{
  late String hmsg;
  Future <TransactionApiResponse> apitarnsactions(Map<String,dynamic>paramsss) async{
    var url = Uri.parse('https://geniemoneyy.com/genie_money/public/index.php/creditcardstore');
    var response = await http.post(url,
        body: (paramsss));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final int code =  response.statusCode;




   var data = jsonDecode(response.body);
    //   print("aaaa:"+data);

    return TransactionApiResponse(holder_name: data["holder_name"],
        userid: data["userid"],

        /*response_code: data["response_code"],
        status: data["status"],
        ackno: data["ackno"]*/);
  }


}

class TransactionApiResponse  {

  final String? holder_name;
  final String? userid;
  // final bool? status;
  // final int?   response_code;
  // final String? ackno;
  // final String? stateresp;


  TransactionApiResponse({this.holder_name,this.userid});
}

class Status{

  final int StatusCode;
  final String? Message;

  Status({required this.StatusCode,this.Message});


  factory Status.fromjson(dynamic json){
    return Status(
        StatusCode: json["statusCode"],
        Message: json["message"]
    );
  }
}

