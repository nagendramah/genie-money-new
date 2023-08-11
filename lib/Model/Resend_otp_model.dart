// To parse this JSON data, do
//
//     final otpResendResponse = otpResendResponseFromJson(jsonString);

import 'dart:convert';

OtpResendResponse otpResendResponseFromJson(String str) => OtpResendResponse.fromJson(json.decode(str));

String otpResendResponseToJson(OtpResendResponse data) => json.encode(data.toJson());

class OtpResendResponse {
  bool status;
  dynamic data;
  String message;

  OtpResendResponse({
    required this.status,
    this.data,
    required this.message,
  });

  factory OtpResendResponse.fromJson(Map<String, dynamic> json) => OtpResendResponse(
    status: json["status"],
    data: json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}
