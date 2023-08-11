import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServicess{
  late String hmsg;
  Future <PaybillApiResponse> apiPaybills(Map<String,dynamic>params) async{
    var url = Uri.parse('https://paysprint.in/service-api/api/v1/service/cc-payment/ccpayment/paybill');
    var response = await http.post(url, headers: {"Content-Type": "application/json",
                                                  "Token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0aW1lc3RhbXAiOjE2NTEyOTkxNDMsInBhcnRuZXJJZCI6IlBTMDA2NzYiLCJyZXFpZCI6IldFVVJZSEdGIn0.3RK_Ws3VkKJGgW8o9h818JwIWLjRpGCd7CZdK_Z0LaE",
                                                      "Authorisedkey":"OGE4NzE4NTk3NzZkZjgzNzA0NDk3MjU0MGFmMjFmMzk="},
        body: json.encode(params));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final int code =  response.statusCode;




    var data = jsonDecode(response.body);
    //   print("aaaa:"+data);

    return PaybillApiResponse(message: data["message"],
        response_code: data["response_code"],
        status: data["status"]);
     //   ackno: data["ackno"]);
  }


}

class PaybillApiResponse  {

  final String? message;
  final bool? status;
  final int?   response_code;
  final String? ackno;
 // final String? stateresp;


  PaybillApiResponse({this.message,this.response_code,this.ackno,this.status});
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

