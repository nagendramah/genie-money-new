import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/dmt/BeneficiaryDetailsModel.dart';
import 'package:genie_money/Model/dmt/DeleteBeneficiary.dart';
import 'package:genie_money/Model/dmt/TranscationModel.dart';
import 'package:genie_money/Model/dmt/VerifyBeneficiaryModel.dart';
import 'package:genie_money/utils/reference_id.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/remote/network/ApiEndPointsPaySprint.dart';
import '../data/remote/network/NetworkApiServicePaySprint.dart';

class BeneficiaryDetailsScreen extends StatefulWidget {
  String benefname;
  String benefid;
  BeneficiaryDetailsModel beneficiarydetails;


  BeneficiaryDetailsScreen({required this.benefname,required this.benefid, required this.beneficiarydetails});

  @override
  _BeneficiaryDetailsScreenState createState() => _BeneficiaryDetailsScreenState();
}

class _BeneficiaryDetailsScreenState extends State<BeneficiaryDetailsScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController purposeController = TextEditingController();

  Future<bool> onBackpress()async{
    Navigator.pop(context,false);
    return true;
  }

  String inwordtext = "";
  ReferenceId referenceId = ReferenceId();
  bool isProgessBarVisible = false;
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: onBackpress,
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: Text(
            "Money Transfer",
            style: const TextStyle(
              color: Color(0xFFFFAE00),
            ),
          ),
          actions: [
            IconButton(
                onPressed: ()async{

                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          backgroundColor: Color(0xFFFFAE00),
                          title: new Text("Delete Beneficiary"),
                          actions: [
                            ElevatedButton(
                                onPressed: ()async{
                                  SharedPreferences pref = await SharedPreferences.getInstance();
                                  var mobilenumber = pref.getString("mobileNumber")??"";
                                  var benefId = widget.benefid;
                                  var isdel = await deletedBeneficiary(mobilenumber,benefId);
                                  if(isdel){
                                    Navigator.pop(context,true);
                                  }
                                  Navigator.pop(context,true);
                                },
                                child: Text("Confirm")
                            ),
                            ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context,true);
                                },
                                child: Text("Cancel")
                            )
                          ],
                        );
                      }
                  );

                },
                icon: Icon(Icons.delete,color: Colors.white,)
            )
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFFFFAE00),
            ),
            onPressed: () => onBackpress(),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top:10,right: 10,bottom: 10,left: 10),
                        child: Text(
                          "Beneficiary Details",
                          style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ),
                     Container(
                       margin: EdgeInsets.only(top: 10,bottom: 10),
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                           color: const Color(0xFF3A3A3A),
                           borderRadius: BorderRadius.all(Radius.circular(10))
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             "Beneficiary Name",
                             style: TextStyle(
                                 color: Color(0xFFFFAE00),
                                 fontWeight: FontWeight.bold,

                             ),
                           ),
                           Text(
                             widget.beneficiarydetails.name,
                             style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,))
                         ],
                       ),
                     ),
                      Container(
                       //margin: EdgeInsets.only(bottom: 10),
                       padding: EdgeInsets.only(right: 10,left: 10),
                       child: Text("Account Details",
                         style: TextStyle(
                           color: Color(0xFFFFAE00),
                           fontWeight: FontWeight.bold,
                          fontSize: 18
                         ),
                       ),
                     ),
                      Container(
                       margin: EdgeInsets.only(top: 10,bottom: 10),
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                           color: const Color(0xFF3A3A3A),
                           borderRadius: BorderRadius.all(Radius.circular(10))
                       ),
                       child: Column(
                         children: [
                            Container(
                            padding: EdgeInsets.only(top: 2,bottom: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Bank name",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      widget.beneficiarydetails.bankName,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,)),
                                )
                              ],
                            ),
                          ),

                           Container(
                             padding: EdgeInsets.only(top: 2,bottom: 2),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   "Account no.",
                                   style: TextStyle(
                                     color: Color(0xFFFFAE00),
                                     fontWeight: FontWeight.bold,

                                   ),
                                 ),
                                 Text(
                                     widget.beneficiarydetails.accno,
                                     style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,))
                               ],
                             ),
                           ),

                           Container(
                             padding: EdgeInsets.only(top: 2,bottom: 2),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   "IFSC code",
                                   style: TextStyle(
                                     color: Color(0xFFFFAE00),
                                     fontWeight: FontWeight.bold,

                                   ),
                                 ),
                                 Text(
                                     widget.beneficiarydetails.ifsc,
                                     style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,))
                               ],
                             ),
                           )

                         ],
                       ),
                     ),
                      Container(
                        //margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.only(right: 10,left: 10),
                        child: Text("Transfer Money",
                          style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color(0xFF3A3A3A),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                              controller: amountController,
                              onChanged: (data){
                                getNumberToString(amountController.text);
                              },
                              style: const TextStyle(color: Color(0xFFFFAE00)),
                              cursorColor: const Color(0xFFFFAE00),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                                // hintText: 'Email / Mobile No.',
                                labelText: 'Enter amount',
                                isDense: true,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(4),
                                child: Text(inwordtext,style: TextStyle(color: Colors.white),)
                            ),
                            SizedBox(height: 10,),

                            TextFormField(
                              controller: purposeController,
                              style: const TextStyle(color: Color(0xFFFFAE00)),
                              cursorColor: const Color(0xFFFFAE00),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                                // hintText: 'Email / Mobile No.',
                                labelText: 'Enter purpose',
                                isDense: true,
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 40,
                              child: ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    //containerVisible = false;
                                    if(amountController.text.isNotEmpty){
                                      transferMoney(widget.benefname,widget.benefid,amountController.text,purposeController.text);
                                    }else{
                                      Fluttertoast.showToast(msg: "Please enter amount");
                                    }

                                  });
                                },
                                child: const Text(
                                  "Transfer Money",
                                  style: TextStyle(
                                      color: Color(0xFF111111),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFFFAE00),
                                  shadowColor: const Color(0xFFFFAE00),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              buildShowDialog(context)
            ],
          ),
        ),
      ),
    );
  }

  loadProgress(){
    if(isProgessBarVisible == true){
      setState(() {
        isProgessBarVisible = false;
      });
    }
    else{
      setState(() {
        isProgessBarVisible = true;
      });
    }

  }

  buildShowDialog(BuildContext context) {
    return
      Visibility(
          visible: isProgessBarVisible,
          child:
          Center(
              child: CircularProgressIndicator(
                color: Color(0xFFF7941D),
              )
          )
      );

  }

  Future getAccountNumber()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String account = pref.getString("registerAccount")??"";

  }

  String getNumberToString(String number){
    if(number.isEmpty){
      setState(() {
        inwordtext="";
      });
      return "";
    }else{
      int value = int.parse(number);
      String val = NumberToWord().convert('en-in', value);
      setState(() {
        inwordtext= "Rs "+val.toUpperCase()+" Only";
      });
      return val;
    }

  }

  Future<bool> deletedBeneficiary(String mobilenumber, String bebeficiaryID)async{
    bool isDeleted = false;
    var network =  NetworkApiServicePaySprint();
    try{
      Map<String,String> jsonbody = {
        "mobile":mobilenumber,
        "bene_id":bebeficiaryID,
      };
      var res = await network.postResponse(ApiEndPointsPaySprint().deleteBeneficiary, jsonbody);
      print(res);
      Map<String, dynamic> jsonres = res;
      var model = DeleteBeneficiaryModel.fromJson(jsonres);
      if(model.status){
        isDeleted = true;
      }else{
        Fluttertoast.showToast(msg: "Beneficiary not deleted! please try again");
        isDeleted = false;
      }
    }catch(e){
      print(e);
    }



    return isDeleted;
  }

  Future transferMoney(String benefname,String benefId,String amount,String purpose)async{

    var network =  NetworkApiServicePaySprint();
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{
      loadProgress();
      String mob = pref.getString("mobileNumber").toString();
      String accno=pref.getString("registerAccount").toString();
      String bankid=pref.getString("bankid").toString();
      String firstname = pref.getString("firstname")??"";
      String lastname = pref.getString("lastname")??"";
      DateTime date = DateTime.now();
      String datetoString = DateFormat('dd-MM-yyyy kk:mm').format(date);
      String referenceid=generateReferenceId().toString();
      print("reference id "+referenceid);


      String val = "mobile : "+mob+" account : "+accno+" bankid : "+bankid+" referenceid : "+referenceid;
      //Fluttertoast.showToast(msg: val);

      Map<String,dynamic>? jsonbody =

      {
        "mobile":mob,
        "referenceid":referenceid,
        "pipe":"bank1",
        "pincode":"401107",
        "address":"null",
        "dob":"null",
        "gst_state":"07",
        "bene_id":benefId,
        "txntype":"NEFT",
        "amount":amount
      };


      //Fluttertoast.showToast(msg: jsonbody.toString());
      //var res = await network.postResponse(ApiEndPointsPaySprint().pannyDrop, jsonbody);
      var res = await network.postResponse(ApiEndPointsPaySprint().transact, jsonbody);

      Map<String, dynamic> jsonres = res;
      //var model = VerifyBeneficiary.fromJson(jsonres);
      var model = TranscationModel.fromJson(jsonres);

      if(model.status){
        //isDeleted = true;
        Fluttertoast.showToast(msg: "Money transfered successfully");
        showTransactDailog(referenceid,
            accno,
            firstname+" "+lastname,
            widget.beneficiarydetails.accno,
            widget.beneficiarydetails.name,
            datetoString,
            purpose,
            referenceid,
            amount,
            model.utr);

        referenceId.setReferenceId();
        loadProgress();
      }else{
        if(model.message!=null){
          Fluttertoast.showToast(msg: "Money not transfered"+model.message!);
        }else{
          Fluttertoast.showToast(msg: "Money not transfered");
        }
        //referenceId.setReferenceId();
        //isDeleted = false;
        loadProgress();
      }
    }catch(e){
      loadProgress();
      Fluttertoast.showToast(msg: e.toString());
      print(e);
    }
  }

  int generateReferenceId(){
    int id = DateTime.now().millisecondsSinceEpoch;
    print(""+id.toString());
    return id;
  }

  showTransactDailog(String referenceId,
      String fromAccount,
      String fromAccountName,
      String toAccount,
      String toAccountName,
      String date,
      String remark,
      String network,
      String amount,
      String? utr){
    Dialog changeAddBeneficiarydDialog = Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        backgroundColor: Color(0xFF3A3A3A),
        //this right here
        child: StatefulBuilder(builder: (context, setState) {
          return Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            "Transction Details",
                            style: TextStyle(fontSize: 18,color: Color(0xFFFFAE00),fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      IconButton(
                        icon:Icon(Icons.clear,color: Color(0xFFFFAE00)),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                        "Payment of Rs "+amount+" to "+toAccountName+" successfull",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reference ID",
                          style: TextStyle(color: Color(0xFFFFAE00)),
                        ),
                        Text(
                          referenceId,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "From Account Name",
                          style: TextStyle(color: Color(0xFFFFAE00)),
                        ),
                        Text(
                          fromAccountName,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "From Account number",
                          style: TextStyle(color: Color(0xFFFFAE00)),
                        ),
                        Text(
                          fromAccount,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "To Account Name",
                          style: TextStyle(color: Color(0xFFFFAE00)),
                        ),
                        Text(
                          toAccountName,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "To Account Number",
                          style: TextStyle(color: Color(0xFFFFAE00)),
                        ),
                        Text(
                          toAccount,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment Date",
                          style: TextStyle(color: Color(0xFFFFAE00)),
                        ),
                        Text(
                          date,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Remark",
                          style: TextStyle(color: Color(0xFFFFAE00)),
                        ),
                        Text(
                          remark.isNotEmpty?remark:"",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "UTR Number",
                          style: TextStyle(color: Color(0xFFFFAE00)),
                        ),
                        Text(
                          utr!=null?utr:"",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: ()async{},
                      child: Text(
                        "Print/Save",
                        style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFFFAE00),
                        shadowColor: const Color(0xFFFFAE00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
          );
        }),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => changeAddBeneficiarydDialog);

  }

}
