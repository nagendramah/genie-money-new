class AddBeneficiaryModel{
  bool status;
  int reponseCode;
  String message;

  AddBeneficiaryModel({required this.status,required this.reponseCode, required this.message});

  factory AddBeneficiaryModel.fromJson(dynamic json){
    return AddBeneficiaryModel(
        status: json['status'],
        reponseCode: json['response_code'],
        message: json['message']
    );
  }
}