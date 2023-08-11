import 'package:flutter/material.dart';

import 'package:genie_money/data/remote/response/ApiResponse.dart';
import 'package:genie_money/repository/recharge/RechargeRepoImp.dart';

import '../Model/utility/OperatorModel.dart';

class OperatorListVM extends ChangeNotifier{
  final _operatorListRepo = OperatorListRepoImp();

  ApiResponse<OperatorModel> operatorModel = ApiResponse.loading();

  void _setOperater(ApiResponse<OperatorModel> response){
    operatorModel = response;
    notifyListeners();
  }

  Future<void> fetchOperator()async{
    _setOperater(ApiResponse.loading());
    _operatorListRepo.getOperatorList()
        .then((value) => _setOperater(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setOperater(ApiResponse.error(error.toString())));
  }
}