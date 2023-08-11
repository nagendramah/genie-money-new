import 'package:genie_money/Model/dmt/AddBeneficiaryModel.dart';
import 'package:genie_money/Model/dmt/BeneficiaryListModel.dart';
import 'package:genie_money/Model/dmt/QueryRemitterModel.dart';
import 'package:genie_money/Model/dmt/RegisterRemitterModel.dart';
import 'package:genie_money/data/remote/network/ApiEndPointsPaySprint.dart';
import 'package:genie_money/data/remote/network/BaseApiServicePaySprint.dart';
import 'package:genie_money/data/remote/network/NetworkApiServicePaySprint.dart';
import 'package:genie_money/repository/dmt/DmtRepo.dart';

BaseApiServicePaySprint _apiService = NetworkApiServicePaySprint();
class QueryRemitterRepoImp implements QueryRemitterRepo{
  String LOG = "QueryRemitterRepoImp";
  //BaseApiServicePaySprint _apiService = NetworkApiServicePaySprint();
  @override
  Future<QueryRemitterModel?> getQueryRemitter(String mobileNumber) async{
    try{
      Map<String,String> jsonbody = {"mobile":mobileNumber,"bank3_flag":"no"};
      dynamic reponse = await _apiService.postResponse(ApiEndPointsPaySprint().queryRemitter, jsonbody);
      print(LOG+" : "+reponse.toString());
      final jsonData = QueryRemitterModel.fromJson(reponse);
      return jsonData;
    }catch(e){
      print(LOG+" : "+e.toString());
      throw e;
    }
  }

}

class RegisterRemitterRepoImp implements RegisterRemitterRepo{
  String LOG = "RegisterRemitterRepoImp";
  //BaseApiServicePaySprint _apiService = NetworkApiServicePaySprint();

  @override
  Future<RegisterRemitterModel?> registerRemitter(String mobilenumber, String fname, String lname,
      String address, String otp, String pincode, String stateresp, String dob, String gstState) async{
   try{
     Map<String,String> jsonbody = {
       "mobile":mobilenumber,
       "firstname":fname,
       "lastname":lname,
       "address":address,
       "otp":otp,
       "pincode":pincode,
       "stateresp":stateresp,
       "bank3_flag":"yes",
       "dob":dob,
       "gst_state":gstState
     };
     dynamic reponse = await _apiService.postResponse(ApiEndPointsPaySprint().registerRemitter, jsonbody);
     print(LOG+" : "+reponse.toString());
     final jsonData = RegisterRemitterModel.fromJson(reponse);
     return jsonData;
   }catch(e){
     print(LOG+" : "+e.toString());
     throw e;
   }
  }
}

class AddBeneficiaryRepoImp implements AddBeneficiaryRepo{
  String LOG = "AddBeneficiaryRepoImp";
  @override
  Future<AddBeneficiaryModel?> addBeneficiary(String mobileNumber, String beneficiaryName,
      String bankid, String accountNo, String ifsccode, String varified,
      String state, String dob, String address, String pincode)async {
    try{
      Map<String,String> jsonbody = {
        "mobile":mobileNumber,
        "benename":beneficiaryName,
        "bankid":bankid,
        "accno":accountNo,
        "ifsccode":ifsccode,
        "verified":varified,
        "gst_state":state,
        "dob":dob,
        "address":address,
        "pincode":pincode
      };
      dynamic reponse = await _apiService.postResponse(ApiEndPointsPaySprint().addBeneficiary, jsonbody);
      print(LOG+" : "+reponse.toString());
      final jsonData = AddBeneficiaryModel.fromJson(reponse);
      return jsonData;
    }catch(e){
      print(LOG+e.toString());
      throw e;
    }
  }
}

class BeneficiaryListRepoImp implements BeneficiaryListRepo{
  String LOG = "BeneficiaryListRepoImp";

  @override
  Future<BeneficiaryListModel?> getBeneficiaryList(String mobileNumber) async{
    try{
      Map<String,String> jsonbody = {
        "mobile":mobileNumber,
      };
      dynamic reponse = await _apiService.postResponse(ApiEndPointsPaySprint().fetchBeneficiary, jsonbody);
      print(LOG+" : "+reponse.toString());
      final jsonData = BeneficiaryListModel.fromJson(reponse);
      return jsonData;
    }catch(e){
      print(LOG+e.toString());
      throw e;
    }
  }

}