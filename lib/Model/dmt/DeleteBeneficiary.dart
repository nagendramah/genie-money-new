class DeleteBeneficiaryModel{
  bool status;
  int reponseCode;
  String? message;

  DeleteBeneficiaryModel({required this.status,required this.reponseCode, required this.message});

  factory DeleteBeneficiaryModel.fromJson(dynamic json){
    return DeleteBeneficiaryModel(
        status: json['status'],
        reponseCode: json['response_code'],
        message: json['message']
    );
  }
}