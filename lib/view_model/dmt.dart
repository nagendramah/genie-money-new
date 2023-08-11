import 'package:flutter/material.dart';
import 'package:genie_money/Model/dmt/AddBeneficiaryModel.dart';
import 'package:genie_money/Model/dmt/BeneficiaryListModel.dart';
import 'package:genie_money/Model/dmt/QueryRemitterModel.dart';
import 'package:genie_money/data/remote/response/ApiResponse.dart';
import 'package:genie_money/repository/dmt/DmtRepoImp.dart';

import '../Model/dmt/RegisterRemitterModel.dart';

class QueryRemitterVM extends ChangeNotifier{
  final _queryRemitterRepo = QueryRemitterRepoImp();

  //ApiResponse<QueryRemitterModel> remitterModel = ApiResponse.loading();

  ApiResponse<QueryRemitterModel> remitterModel = ApiResponse.init();

  void _setQueryRemitter(ApiResponse<QueryRemitterModel> response){
    remitterModel = response;
    notifyListeners();
  }

  Future<void> fetchRemitter(String mobileNumber,)async{
    _setQueryRemitter(ApiResponse.loading());
    _queryRemitterRepo.getQueryRemitter(mobileNumber)
        .then((value) => _setQueryRemitter(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setQueryRemitter(ApiResponse.error(error.toString())));
  }
}

class RegisterRemitterVM extends ChangeNotifier{
  final _registerRemitterRepo = RegisterRemitterRepoImp();
  ApiResponse<RegisterRemitterModel> registerResponse = ApiResponse.init();

  void _setRegisterRemitter(ApiResponse<RegisterRemitterModel> response){
    registerResponse = response;
    notifyListeners();
  }

  Future<void> register(String mobilenumber,
      String fname,
      String lname,
      String address,
      String otp,
      String pincode,
      String stateresp,
      String dob,
      String gstState)async{
    _setRegisterRemitter(ApiResponse.loading());
    _registerRemitterRepo.registerRemitter(mobilenumber, fname, lname, address, otp,
        pincode, stateresp, dob, gstState)
        .then((value) => _setRegisterRemitter(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setRegisterRemitter(ApiResponse.error(error.toString())));
  }
}

class AddBeneficiaryVM extends ChangeNotifier{
  final _addBeneficaryRepo = AddBeneficiaryRepoImp();
  ApiResponse<AddBeneficiaryModel> beneficiaryResponse = ApiResponse.init();

  void _setAddBeneficiary(ApiResponse<AddBeneficiaryModel> response){
    beneficiaryResponse = response;
    notifyListeners();
  }

  Future<void> addBenificiary(String mobileNumber,
      String beneficiaryName,
      String bankid,
      String accountNo,
      String ifsccode,
      String varified,
      String state,
      String dob,
      String address,
      String pincode)async{
      _setAddBeneficiary(ApiResponse.loading());
      _addBeneficaryRepo.addBeneficiary(mobileNumber,
          beneficiaryName,
          bankid,
          accountNo,
          ifsccode, varified, state, dob, address, pincode)
          .then((value) => _setAddBeneficiary(ApiResponse.completed(value)))
          .onError((error, stackTrace) => _setAddBeneficiary(ApiResponse.error(error.toString())));
  }

}

class BeneficiaryListVM extends ChangeNotifier{

  final _beneficiaryListRepo = BeneficiaryListRepoImp();

  ApiResponse<BeneficiaryListModel> beneficiaryModel = ApiResponse.init();

  void _setBeneficiary(ApiResponse<BeneficiaryListModel> response){
    beneficiaryModel = response;
    notifyListeners();
  }

  Future<void> fetchBeneficiary(String mobileNumber,)async{
    _setBeneficiary(ApiResponse.loading());
    _beneficiaryListRepo.getBeneficiaryList(mobileNumber)
        .then((value) => _setBeneficiary(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setBeneficiary(ApiResponse.error(error.toString())));
  }
}