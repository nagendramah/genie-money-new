import 'package:genie_money/Model/dmt/AddBeneficiaryModel.dart';
import 'package:genie_money/Model/dmt/BeneficiaryListModel.dart';
import 'package:genie_money/Model/dmt/QueryRemitterModel.dart';
import 'package:genie_money/Model/dmt/RegisterRemitterModel.dart';

class QueryRemitterRepo{
  Future<QueryRemitterModel?> getQueryRemitter(String mobileNumber)async{}
}

class RegisterRemitterRepo{
  Future<RegisterRemitterModel?> registerRemitter(
      String mobilenumber,
      String fname,
      String lname,
      String address,
      String otp,
      String pincode,
      String stateresp,
      String dob,
      String gstState
      )async{}
}
class AddBeneficiaryRepo{
  Future<AddBeneficiaryModel?> addBeneficiary(
      String mobileNumber,
      String beneficiaryName,
      String bankid,
      String accountNo,
      String ifsccode,
      String varified,
      String state,
      String dob,
      String address,
      String pincode
      )async{}
}

class BeneficiaryListRepo{
  Future<BeneficiaryListModel?> getBeneficiaryList(
        String mobileNumber
      )async{}
}