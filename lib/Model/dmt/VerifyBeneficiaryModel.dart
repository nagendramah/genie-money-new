class VerifyBeneficiary{
  bool status;
  int reponseCode;
  String? message;
  String? utr;

  VerifyBeneficiary({required this.status,required this.reponseCode, required this.message, this.utr});

  factory VerifyBeneficiary.fromJson(dynamic json){
    return VerifyBeneficiary(
        status: json['status'],
        reponseCode: json['response_code'],
        message: json['message'],
        utr: json['utr']
    );
  }
}