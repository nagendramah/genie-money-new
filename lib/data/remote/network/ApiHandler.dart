import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie_money/Model/CreditScoreOTPResponse.dart';
import 'package:genie_money/Model/CreditScoreOtpValidation.dart';
import 'package:genie_money/Model/DematModel.dart';
import 'package:genie_money/Model/OTPvalidation_model_class.dart';
import 'package:genie_money/Model/Resend_otp_model.dart';
import 'package:genie_money/Model/check_customer_exists_model.dart';
import 'package:genie_money/Model/creditLineEligible.dart';
import 'package:genie_money/Model/creditcard_model.dart';
import 'package:genie_money/Model/customer_exist.dart';
import 'package:genie_money/Model/eligibleProductModel.dart';
import 'package:genie_money/Model/lead_model_class.dart';
import 'package:genie_money/Model/newuser_response.dart';
import 'package:genie_money/Model/occupation_response.dart';
import 'package:genie_money/Model/personalLoan_productsModelclass.dart';
import 'package:genie_money/Model/pincode_response.dart';
import 'package:genie_money/Model/product_by_category_model.dart';
import 'package:genie_money/Model/resend_creditscoreOtp.dart';
import 'package:genie_money/Model/search_comapny.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:http/http.dart' as http;

import '../../../Model/term_condition.dart';

class ApiHandler {
  static final shared = ApiHandler();
  static final ApiHandler _instance = ApiHandler._internal();

  ApiHandler._internal() {
    // initialization logic
  }

  factory ApiHandler() {
    return _instance;
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('GenieMoneyy' ,style: TextStyle(color: navyBlueColor),),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK',style: TextStyle(color: navyBlueColor), ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }


  Map<String, String> headers = {
    "x-api-key": "QkN5cGZFRWl4S1Mrb0g5V0dyWFlKNGJseW1sd3haTWhZUWVqOUxlek5qVT0",
    "IV": "YUp4OVJQam13Q0NnbUNTSFZPT0ZFUT09"
  };

  Future<ProductByCategory?> getProductbyCategory(String apiName) async{
    http.Response responseJson;
    ProductByCategory? productByCategory;
    try{
      var uri = Uri.parse(apiName);
      final response = await http.get(uri,headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      productByCategory = productByCategoryFromJson(body);
    }on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return productByCategory;
  }

  Future<OccupationResponse> getOccupation(String apiName) async {
    http.Response responseJson;
    OccupationResponse? occupationResponse;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.get(uri, headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      occupationResponse = occupationResponseFromJson(body);
    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return occupationResponse;
  }

  Future<SearchResponse> getSearch(String apiName) async {
    http.Response responseJson;
    SearchResponse? searchResponse;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.get(uri, headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      searchResponse = searchResponseFromJson(body);
    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return searchResponse;
  }

  Future<PincodeResponse> getPincode(String apiName) async {
    http.Response responseJson;
    PincodeResponse? pincodeResponse;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.get(uri, headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      pincodeResponse = pincodeResponseFromJson(body);
    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return pincodeResponse;
  }

  Future<CheckCustomerExistResponse> getCustomerExist(String apiName) async {
    http.Response responseJson;
    CheckCustomerExistResponse checkCustomerExistResponse;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.get(uri, headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      checkCustomerExistResponse = checkCustomerExistResponseFromJson(body);
    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return checkCustomerExistResponse;
  }

  Future<dynamic> getResendOtp(String apiName) async {
    http.Response responseJson;
    dynamic otpResendResponse;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.get(uri, headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      otpResendResponse = otpResendResponseFromJson(body);
    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return otpResendResponse;
  }

  Future<TermsAndConditionResponse> getTermsAndCondition(String apiName) async {
    http.Response responseJson;
    TermsAndConditionResponse termsAndConditionResponse;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.get(uri, headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      termsAndConditionResponse = termsAndConditionResponseFromJson(body);
    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return termsAndConditionResponse;
  }

  Future<OtpValidationResponse> getOTP(
      String apiName, Map<String, dynamic> param) async {
    http.Response responseJson;
    OtpValidationResponse otpValidationResponse;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.post(uri, body: param, headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      otpValidationResponse = otpValidationResponseFromJson(body);
    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return otpValidationResponse;
  }

  Future<CreditScoreOtpResponse> postCreditScoreOTP(
      String apiName, Map<String, dynamic> param) async {
    http.Response responseJson;
    CreditScoreOtpResponse creditScoreOtpResponse;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.post(uri, body: param, headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      creditScoreOtpResponse = creditScoreOtpResponseFromJson(body);
    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return creditScoreOtpResponse;
  }

  Future<CreditScoreOtpValidation> postCreditScoreOtpValidation(
      String apiName, Map<String, dynamic> param) async {
    http.Response responseJson;
    CreditScoreOtpValidation creditScoreOtpValidation;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.post(uri, body: param, headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      creditScoreOtpValidation = creditScoreOtpValidationFromJson(body);
    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return creditScoreOtpValidation;
  }

  Future<CreateLeadProfile> postCreateLead(
      String apiName, Map<String, dynamic> param) async {
    http.Response responseJson;
    CreateLeadProfile? createLeadProfile;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.post(uri, body: param, headers: headers);
      responseJson = _response(response);
      String body = responseJson.body;
      createLeadProfile = createLeadProfileFromJson(body);
    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return createLeadProfile;
  }

  Future<ResendCreditScoreOtp> postCreditScoreResendOtp(String apiName,Map<String,dynamic> param) async {
    http.Response responesJson;
    ResendCreditScoreOtp resendCreditScoreOtp;
    try{
      var uri = Uri.parse(apiName);
      final response = await http.post(uri, body: param,headers: headers);
      responesJson = _response(response);
      String body = responesJson.body;
      resendCreditScoreOtp = resendCreditScoreOtpFromJson(body);
    }on SocketException{
      throw throw FetchDataException("No Internet connection");
    }
return resendCreditScoreOtp;
  }

  Future<EligibleProductResponse> postEligibleProduct(String apiName,Map<String,dynamic> param) async{
   http.Response responseJson;
   EligibleProductResponse eligibleProductResponse;
   try{
     var uri = Uri.parse(apiName);
     final response =await http.post(uri,body: param,headers: headers);
      responseJson= _response(response);
      String body = responseJson.body;
eligibleProductResponse = eligibleProductResponseFromJson(body);
   }on SocketException{
     throw throw FetchDataException("No Internet connection");
   }
    return eligibleProductResponse;
  }

  Future<PersonalProductByCategory> getPersonalEligible(String apiName,Map<String,dynamic> param) async{
    http.Response responseJson;
    PersonalProductByCategory personalProductByCategory;
    try{
      var uri = Uri.parse(apiName);
      final response =await http.post(uri,body: param,headers: headers);
      responseJson= _response(response);
      String body = responseJson.body;
      personalProductByCategory = personalProductByCategoryFromJson(body);
    }on SocketException{
      throw throw FetchDataException("No Internet connection");
    }
    return personalProductByCategory;
  }

  Future<CreditLineResponse> getCreditLineEligible(String apiName,Map<String,dynamic> param) async {
    http.Response responseJson;
     CreditLineResponse creditLineResponse;
    try{
      var uri = Uri.parse(apiName);
      final response =await http.post(uri,body: param,headers: headers);
      responseJson= _response(response);
      String body = responseJson.body;
      creditLineResponse = creditLineResponseFromJson(body);
    }on SocketException{
      throw throw FetchDataException("No Internet connection");
    }
    return creditLineResponse;
  }

  Future<DematResponse> getDematEligible(String apiName,Map<String,dynamic> param) async {
    http.Response responseJson;
    DematResponse dematResponse ;
    try{
      var uri = Uri.parse(apiName);
      final response =await http.post(uri,body: param,headers: headers);
      responseJson= _response(response);
      String body = responseJson.body;
      dematResponse = dematResponseFromJson(body);
    }on SocketException{
      throw throw FetchDataException("No Internet connection");
    }
    return dematResponse;
  }

  Future<CreditCardProductByCategory> getCreditCardEligible(String apiName,Map<String,dynamic> param) async{
    http.Response responseJson;
    CreditCardProductByCategory creditCardProductByCategory;
    try{
      var uri = Uri.parse(apiName);
      final response =await http.post(uri,body: param,headers: headers);
      responseJson= _response(response);
      String body = responseJson.body;
      creditCardProductByCategory = creditCardProductByCategoryFromJson(body);
    }on SocketException{
      throw throw FetchDataException("No Internet connection");
    }
    return creditCardProductByCategory;
  }

  Future<LeadResponse> postLead(String apiName,Map<String,dynamic> param) async {
   http.Response responseJson;
   LeadResponse leadResponse;
   try {
     var uri = Uri.parse(apiName);
     final response = await http.post(uri, body: param,headers: headers);
     responseJson = _response(response);
     String body = responseJson.body;
     leadResponse = leadResponseFromJson(body);
   }on SocketException{
     throw throw FetchDataException("No Internet connection");
   }
    return leadResponse;
  }

  http.Response _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        return response;
      case 401:
      case 422:
        return response;
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        return response;
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode');
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class InvalidRequest extends CustomException {
  InvalidRequest([String? message]) : super(message, "Invalid Request");
}

/*  Future<CustomerExistsResponse> getCustomerId() async{
     CustomerExistsResponse? customerExistsResponse;
    var headers = {
      'x-api-key': ' U042VVRFTjhESnZVeFVlbjgrRVlGZ3BnWTJ2Nnk3UlZPSkE4ckZ3UTZzMD0=',
      'IV': ' OStGaWg3ZnpFV3lvSERZRHo2SnpLUT09',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('https://leadapi.banksathi.com/api/b2b/checkCustomerExists'));
    request.body = json.encode({
      "pan": "AYRPJ9427L",
      "category_id": "13",
      "mobile_no": "9855667789",
      "is_user_validated": "1",
      "is_pan_validated": "1"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      customerExistsResponse = customerExistsResponseFromJson(await response.stream.bytesToString());

    }
    else {
      print(response.reasonPhrase);
    }
     return customerExistsResponse!;
  }*/

/* Future<ApiResponse<T>> getMethod<T extends ISerializable>(T t,String apiName,
      Map<String, String> headers) async {
    http.Response responseJson;
    ApiResponse<T>? objectResponse = null;
    try {
      var uri = Uri.parse(apiName);
      final response = await http.get(uri, headers: headers);
       responseJson = _response(response);
      String body =
          responseJson.body;
      final jsonResponse = jsonDecode(body);
        objectResponse = ApiResponse<T>.fromJson(
            jsonResponse,
                (payload) =>
                t.fromJson(payload! as Map<String, dynamic>)
        );

    } on SocketException {
      throw throw FetchDataException('No Internet connection');
    }
    return objectResponse;
  }

  Future<ApiResponse<T>> postApi<T extends ISerializable>(T t,
      String apiName, Map<String, dynamic> params,
      Map<String, String> headers) async {
    http.Response responseJson;
    ApiResponse<T>? objectResponse = null; // Initialize to null
    try {
      var uri = Uri.parse(apiName);
      final response = await http.post(
          uri, body: params, headers: headers);
      responseJson = _response(response);
      String body =
      responseJson.body;
      final jsonResponse = jsonDecode(body);
      objectResponse = ApiResponse<T>.fromJson(
          jsonResponse,
              (payload) =>
              t.fromJson(payload! as Map<String, dynamic>)
      );
    } on SocketException {
      throw FetchDataException(
          'No Internet connection'); // Remove extra "throw" keyword
    }
    return objectResponse; // Return outside of try block
  }*/
