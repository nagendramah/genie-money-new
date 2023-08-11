// To parse this JSON data, do
//
//     final saveInfo = saveInfoFromJson(jsonString);

import 'dart:convert';

SaveInfo saveInfoFromJson(String str) => SaveInfo.fromJson(json.decode(str));

String saveInfoToJson(SaveInfo data) => json.encode(data.toJson());

class SaveInfo {
  SaveInfo({
    required this.messages,
    required this.url,
    required this.clientCode,
    required this.encData,
  });

  Messages messages;
  String url;
  String clientCode;
  String encData;

  factory SaveInfo.fromJson(Map<String, dynamic> json) => SaveInfo(
    messages: Messages.fromJson(json["messages"]),
    url: json["url"],
    clientCode: json["clientCode"],
    encData: json["encData"],
  );

  Map<String, dynamic> toJson() => {
    "messages": messages.toJson(),
    "url": url,
    "clientCode": clientCode,
    "encData": encData,
  };
}

class Messages {
  Messages({
    required this.status,
    required this.success,
  });

  int status;
  String success;

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
    status: json["status"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
  };
}