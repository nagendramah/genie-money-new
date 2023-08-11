import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices{
  late String hmsg;
  Future <LoginApiResponse> apiCallLogin(Map<String,dynamic>param) async{
    var url = Uri.parse('https://paysprint.in/service-api/api/v1/service/cc-payment/ccpayment/generateotp');
    var response = await http.post(url, headers: {"Content-Type": "application/json",
                                                  "Token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0aW1lc3RhbXAiOjE2NTEyOTkxNDMsInBhcnRuZXJJZCI6IlBTMDA2NzYiLCJyZXFpZCI6IldFVVJZSEdGIn0.3RK_Ws3VkKJGgW8o9h818JwIWLjRpGCd7CZdK_Z0LaE",
                                                  "Authorisedkey":"OGE4NzE4NTk3NzZkZjgzNzA0NDk3MjU0MGFmMjFmMzk="},
                                                  body: json.encode(param));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final int code =  response.statusCode;
    // if(code==200){
    //
    //   Fluttertoast.showToast(
    //       msg:"OTP sent successfuly",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.green,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
    // }
    // else {
    //
    //   Fluttertoast.showToast(
    //       msg:"Something Went Wrong",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );



    var data = jsonDecode(response.body);
 //   print("aaaa:"+data);

      return LoginApiResponse(message: data["message"],
        response_code: data["response_code"],
        status: data["status"],
        mobile: data["lastName"],
        stateresp: (data["stateresp"]));
  }


}

class LoginApiResponse  {

  final String? message;
  final bool? status;
  final int?   response_code;
  final String? mobile;
  final String? stateresp;


  LoginApiResponse({this.message,this.stateresp,this.response_code,this.mobile,this.status});
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
