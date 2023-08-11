import 'package:genie_money/data/remote/network/ApiEndPointsPaySprint.dart';
import 'package:genie_money/data/remote/network/BaseApiServicePaySprint.dart';
import 'package:genie_money/data/remote/network/NetworkApiServicePaySprint.dart';
import 'package:genie_money/repository/recharge/RechargeRepo.dart';

import '../../Model/utility/OperatorModel.dart';

class OperatorListRepoImp implements OperatorListRepo{
  String LOG = "RechargeRepoImp";
  BaseApiServicePaySprint _apiService = NetworkApiServicePaySprint();
  @override
  Future<OperatorModel?> getOperatorList() async{
    try{
      Map<String,String> jsonbody = {};
      dynamic reponse = await _apiService.postResponse(ApiEndPointsPaySprint().getOperatorList, jsonbody);
      print(LOG+" : "+reponse.toString());
      final jsonData = OperatorModel.fromJson(reponse);
      return jsonData;
    }catch(e){
      print(LOG+" : "+e.toString());
      throw e;
    }
  }

}