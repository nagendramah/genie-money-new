import 'dart:convert';

ResendCreditScoreOtp resendCreditScoreOtpFromJson(String str) =>
    ResendCreditScoreOtp.fromJson(json.decode(str));

String resendCreditScoreOtpToJson(ResendCreditScoreOtp data) =>
    json.encode(data.toJson());

class ResendCreditScoreOtp {
  bool status;
  Data data;
  String message;

  ResendCreditScoreOtp({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ResendCreditScoreOtp.fromJson(Map<String, dynamic> json) =>
      ResendCreditScoreOtp(
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
  String? stageOneId;
  String? stageTwoId;
  String? otpGenerationStatus;
  String isMasked;
  String customerId;
  String categoryId;

  Data({
    this.stageOneId,
    this.stageTwoId,
    this.otpGenerationStatus,
    required this.isMasked,
    required this.customerId,
    required this.categoryId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    stageOneId: json["stage_one_id"],
    stageTwoId: json["stage_two_id"],
    otpGenerationStatus: json["otpGenerationStatus"],
    isMasked: json["is_masked"],
    customerId: json["customer_id"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "stage_one_id": stageOneId,
    "stage_two_id": stageTwoId,
    "otpGenerationStatus": otpGenerationStatus,
    "is_masked": isMasked,
    "customer_id": customerId,
    "category_id": categoryId,
  };
}