// To parse this JSON data, do
//
//     final termsAndConditionResponse = termsAndConditionResponseFromJson(jsonString);

import 'dart:convert';

TermsAndConditionResponse termsAndConditionResponseFromJson(String str) => TermsAndConditionResponse.fromJson(json.decode(str));

String termsAndConditionResponseToJson(TermsAndConditionResponse data) => json.encode(data.toJson());

class TermsAndConditionResponse {
  bool status;
  Data data;
  String message;

  TermsAndConditionResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory TermsAndConditionResponse.fromJson(Map<String, dynamic> json) => TermsAndConditionResponse(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  String hyperlinkText;
  String experianLogo;
  String contentMainHeading;
  String contentSubHeading;
  String contentP;

  Data({
    required this.hyperlinkText,
    required this.experianLogo,
    required this.contentMainHeading,
    required this.contentSubHeading,
    required this.contentP,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    hyperlinkText: json["hyperlink_text"],
    experianLogo: json["experian_logo"],
    contentMainHeading: json["content_main_heading"],
    contentSubHeading: json["content_sub_heading"],
    contentP: json["content_p"],
  );

  Map<String, dynamic> toJson() => {
    "hyperlink_text": hyperlinkText,
    "experian_logo": experianLogo,
    "content_main_heading": contentMainHeading,
    "content_sub_heading": contentSubHeading,
    "content_p": contentP,
  };
}
