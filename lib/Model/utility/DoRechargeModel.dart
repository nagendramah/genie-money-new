class DoRechargeModel{
  bool status;
  int responseCode;
  String message;
  String? operatorId;
  int? ackno;
  String? referenceId;

  DoRechargeModel({required this.status, required this.responseCode,required this.message,
      this.operatorId, this.ackno, this.referenceId});

  factory DoRechargeModel.fromJson(dynamic json){
    return DoRechargeModel(
      status: json['status'],
      responseCode: json['response_code'],
      message: json['message'],
      operatorId: json['operatorid'],
      ackno: json['ackno'],
      referenceId: json['refid']
    );
  }

}