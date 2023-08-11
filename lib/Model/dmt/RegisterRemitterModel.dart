class RegisterRemitterModel{
 bool status;
 int reponseCode;
 String message;

 RegisterRemitterModel({required this.status,required this.reponseCode, required this.message});

 factory RegisterRemitterModel.fromJson(dynamic json){
   return RegisterRemitterModel(
     status: json['status'],
     reponseCode: json['response_code'],
     message: json['message']
   );
 }
}