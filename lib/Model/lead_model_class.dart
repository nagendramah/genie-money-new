import 'dart:convert';

LeadResponse leadResponseFromJson(String str) =>
    LeadResponse.fromJson(json.decode(str));

String leadResponseToJson(LeadResponse data) => json.encode(data.toJson());

class LeadResponse {
  bool status;
  dynamic data;
  String message;

  LeadResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory LeadResponse.fromJson(Map<String, dynamic> json) => LeadResponse(
    status: json["status"],
    data: json['data'] is List ? [] : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data is List ? [] : (data as Data).toJson(),
    "message": message,
  };
}

class Data {
  String leadCode;
  String campaignUrl;

  Data({
    required this.leadCode,
    required this.campaignUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    leadCode: json["lead_code"],
    campaignUrl: json["campaign_url"],
  );

  Map<String, dynamic> toJson() => {
    "lead_code": leadCode,
    "campaign_url": campaignUrl,
  };
}