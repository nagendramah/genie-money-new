import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/dmt/AddBeneficiaryModel.dart';
import 'package:genie_money/Model/dmt/BankListModel.dart';
import 'package:genie_money/Model/dmt/BeneficiaryDetailsModel.dart';
import 'package:genie_money/Model/dmt/BeneficiaryListModel.dart';
import 'package:genie_money/Model/dmt/GSTStateCodeModel.dart';
import 'package:genie_money/Model/dmt/QueryRemitterModel.dart';
import 'package:genie_money/Screens/beneficiary_details_screen.dart';
import 'package:genie_money/Screens/transcation_history.dart';
import 'package:genie_money/data/remote/network/ApiEndPointsPaySprint.dart';
import 'package:genie_money/data/remote/network/NetworkApiServicePaySprint.dart';
import 'package:genie_money/data/remote/response/Status.dart';
import 'package:genie_money/view_model/dmt.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoneyTransferScreen extends StatefulWidget{

  @override
  _MoneyTransferScreen createState() {
    // TODO: implement createState
    return _MoneyTransferScreen();
  }

}
class _MoneyTransferScreen extends State<MoneyTransferScreen>{
  TextEditingController _mobile_controller = TextEditingController();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  TextEditingController _benefNameController = TextEditingController();
  TextEditingController _benefAccountConroller = TextEditingController();
  TextEditingController _benefIFSCController = TextEditingController();
  TextEditingController _benefDOBController = TextEditingController();
  TextEditingController _benefAddressController = TextEditingController();
  TextEditingController _benefPincodeController = TextEditingController();
  TextEditingController _registerAccountController = TextEditingController();
  TextEditingController _registerIFSCController = TextEditingController();

  bool containerVisible = false;
  QueryRemitterVM _queryRemitterVM = QueryRemitterVM();
  RegisterRemitterVM _registerRemitterVM = RegisterRemitterVM();
  AddBeneficiaryVM _addBeneficiaryVM = AddBeneficiaryVM();
  BeneficiaryListVM _beneficiaryListVM = BeneficiaryListVM();
  DateTime selectedDate = DateTime.now();

  List<GSTStateCodeModel> stateList= [];
  List<BankModel>? bankList = [];
  List<BankModel>? tempBankList = [];
  GSTStateCodeModel? selectedState=null;
  late BankModel selectedBank;
  String buildvariable="UAT";
  bool registerVisibility = true;
  bool addbeneficiaryVisibity = true;
  String registerNumber = "";
  bool beneficiaVisibility = true;
  bool isNumberRgistered = false;
  bool isAccountAdded = false;
  String firstname = "";
  String lastname = "";
  String accountno="";
  String bankname="";
  String bankid="";
  String ifsccode="";
  List<BeneficiaryDetailsModel> beneficiaryList = [];
  double width=0;
  double height=0;

  BankModel? selectedBankModelp;
  String selectedBankNamep ="Selecte Bank";

  @override
  void initState() {
    //stateList.add(GSTStateCodeModel(name: "Select state",code: "ZZ", id: "0"));
    setState(() {
      // stateList.add(GSTStateCodeModel(name: "Select state",code: "ZZ", id: "0"));
      // selectedState = stateList.first;
    });

    checkNumberIsRegister();
    getStateList();
    getBankList();
    _otpController.text="222111";

    super.initState();
  }

  checkNumberIsRegister()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userid = pref.getString("userid")??"";
    print("userid : "+userid);
    isNumberRgistered=pref.getBool("isRegisteredPay")??false;
    isAccountAdded=pref.getBool("isAccountAdded")??false;
    //isNumberRgistered = false;
    print("is account added : "+isAccountAdded.toString());
    if(isNumberRgistered){
      accountno=pref.getString("registerAccount")??"";
      bankname=pref.getString("bankname")??"";
      ifsccode=pref.getString("ifsc")??"";
      bankid=pref.getString("bankid")??"";
      isNumberRgistered = true;
    }else{
      isNumberRgistered = false;
    }

    if(isNumberRgistered){
      setState(() {
        beneficiaVisibility = true;
        firstname = pref.getString("firstname")??"";
        lastname = pref.getString("lastname")??"";
        registerNumber = pref.getString("mobileNumber")??"";
        getBeneficiary(registerNumber);
        //_beneficiaryListVM.fetchBeneficiary(registerNumber);
      });
    }else{
     setState(() {
       beneficiaVisibility = false;
     });

    }
  }

  bool isProgessBarVisible = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //beneficiaryList  = Provider.of<BeneficiaryListModel>(context).data;

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "Bank A/c to bank A/c",
          style: const TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFAE00),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TranscationHistory()));
              },
              icon: Icon(Icons.history,color: Color(0xFFFFAE00),))
        ],
      ),
      body: SafeArea(
      child:  Stack(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                /*SizedBox(height: 10,),*/
                Expanded(
                  child: ListView(
                    children: [
                        //registion VM
                        Visibility(
                            visible: !beneficiaVisibility,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Enter your mobile to register",style: TextStyle(color: Color(0xFFFFAE00)),),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 5,
                                        right: 5
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                                      maxLength: 10,
                                      controller: _mobile_controller,
                                      onChanged: (content){
                                        if(content.length==10) {
                                          _queryRemitterVM.fetchRemitter(content);
                                          if (!containerVisible) {
                                            setVisibility(true);
                                          }
                                        }else{
                                          if(containerVisible){
                                            setVisibility(false);
                                          }
                                        }
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
                                        labelText: 'Sender Mobile number',
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: ChangeNotifierProvider<QueryRemitterVM>(
                                      create: (context)=>_queryRemitterVM,
                                      child: Consumer<QueryRemitterVM>(builder: (context,_queryRemitterVM,_){
                                        switch(_queryRemitterVM.remitterModel.status){
                                          case Status.INIT:
                                            print("Operator :: INIT");
                                            return Text("");
                                          case Status.LOADING:
                                            print("Operator :: LOADING");
                                            return Text("Loading..",style: TextStyle(color: Color(0xFFFFAE00)),);
                                          case Status.ERROR:
                                            print("Operator :: ERROR");
                                            return Text(_queryRemitterVM.remitterModel.message ?? "NA");
                                          case Status.COMPLETED:
                                            print("Operator :: COMPLETED");

                                            if(_queryRemitterVM.remitterModel.data!.status==true){
                                              setRegisterData(
                                                _queryRemitterVM.remitterModel.data!.data!.fname,
                                                _queryRemitterVM.remitterModel.data!.data!.lname,
                                                _queryRemitterVM.remitterModel.data!.data!.mobile,
                                              );
                                            }

                                            return _queryRemitterVM.remitterModel.data!.status==true?
                                            Text("Mobile number is registered"):
                                            _queryRemitterVM.remitterModel.data!.stateresp==null?Text(
                                                _queryRemitterVM.remitterModel.data!.message??"",style: TextStyle(color: Color(0xFFFFAE00)),):
                                            _getRegisterContainer(width,_queryRemitterVM.remitterModel.data!.stateresp!);
                                        //return _getOperatorListView(_operatorListVM.operatorModel.data?.operatorList);
                                          default:
                                        }
                                        return Container();
                                      },

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),

                        //beneficiary list
                        Visibility(
                          visible: beneficiaVisibility,
                          child: Container(
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.stretch,
                            children: [
                              /*Container(
                                child: Text(
                                  "Your Account Details ",
                                  style: TextStyle(
                                      color: Color(0xFFFFAE00),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),*/
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
                                    Row(
                                      children: [
                                        Text(
                                          firstname,
                                          style: TextStyle(
                                              color: Color(0xFFFFAE00),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          lastname,
                                          style: TextStyle(
                                              color: Color(0xFFFFAE00),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      registerNumber,
                                      style: TextStyle(color: Colors.white)
                                      ,)
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: isAccountAdded,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "Your Account Detail",
                                                  style: const TextStyle(
                                                      color: Color(0xFFFFAE00),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                textAlign: TextAlign.left,
                                              ),

                                              Visibility(
                                                visible: isAccountAdded,
                                                child: Container(
                                                  /*decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(color: Color(0xFFFFAE00),width: 2)
                                                  ),*/
                                                  child: IconButton(
                                                    padding: EdgeInsets.zero,
                                                    constraints: BoxConstraints(),
                                                    icon: Icon(Icons.edit,color: Color(0xFFFFAE00),size: 24,),
                                                    onPressed: () {
                                                      setState(() {
                                                        print("bankid : "+bankid);
                                                        selectedBankNamep=bankname;
                                                        selectedBankModelp = bankList![bankList!.indexWhere((element) => element.bankid==int.parse(bankid))];
                                                        _registerAccountController.text=accountno;
                                                        _registerIFSCController.text=ifsccode;

                                                        isAccountAdded= false;
                                                      });
                                                      //buildAddBeneficiarDialog(context);
                                                    },),
                                                ),
                                              )

                                            ],
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
                                                    Text(
                                                        bankname,
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
                                                      "Account no.",
                                                      style: TextStyle(
                                                        color: Color(0xFFFFAE00),
                                                        fontWeight: FontWeight.bold,

                                                      ),
                                                    ),
                                                    Text(
                                                        accountno,
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
                                                        ifsccode,
                                                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,))
                                                  ],
                                                ),
                                              )

                                            ],
                                          ),
                                        ),
                                      ],
                                  ),
                                ),
                              ),

                              Visibility(
                                visible: !isAccountAdded,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10,bottom: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF3A3A3A),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                "Account details",
                                              style: const TextStyle(
                                                  color: Color(0xFFFFAE00),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 20,
                                          ),
                                          child: TextFormField(
                                            controller: _registerAccountController,
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
                                              labelText: 'Account number',
                                              isDense: true,
                                            ),
                                          ),
                                        ),
                                        getBankListDropDown(),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 5,
                                          ),
                                          child: TextFormField(
                                            controller: _registerIFSCController,
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
                                              labelText: 'IFSC code',
                                              isDense: true,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: ElevatedButton(
                                            onPressed: ()async{
                                              if(_registerAccountController.text.isEmpty){
                                                Fluttertoast.showToast(msg: "Please enter IFSC");
                                              }else if(selectedBank.bankid==0){
                                                Fluttertoast.showToast(msg: "Please select bank");
                                              }else{
                                                SharedPreferences pref = await SharedPreferences.getInstance();
                                                setState((){
                                                //containerVisible = false;
                                                    print("bankid : "+selectedBankModelp!.bankid.toString());
                                                    pref.setBool("isAccountAdded",true);
                                                    pref.setString("registerAccount", _registerAccountController.text);
                                                    pref.setString("ifsc", _registerIFSCController.text);
                                                    pref.setString("bankname", selectedBankModelp!.bankName);
                                                    pref.setString("bankid", selectedBankModelp!.bankid.toString());
                                                            //dsDsd
                                                    accountno = _registerAccountController.text;
                                                    bankname = selectedBankModelp!.bankName;
                                                    ifsccode = _registerIFSCController.text;
                                                    bankid = selectedBankModelp!.bankid.toString();

                                                    isAccountAdded = true;
                                                });

                                              }

                                            },
                                            child: const Text(
                                              "Save Details",
                                              style: TextStyle(
                                                  color: Color(0xFF111111),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(width, 40.0),
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
                                  )
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Beneficiary",
                                      style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Color(0xFFFFAE00),width: 2)
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        icon: Icon(Icons.add,color: Color(0xFFFFAE00),size: 24,),
                                        onPressed: () {
                                          buildAddBeneficiarDialog(context);
                                        },),
                                    )

                                  ],
                                ),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: beneficiaryList.length,
                                  //physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index ){
                                    return GestureDetector(
                                      onTap: ()async{
                                       var result =await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BeneficiaryDetailsScreen(
                                                      benefname:beneficiaryList[index].name,
                                                      benefid:beneficiaryList[index].beneficiaryId,
                                                      beneficiarydetails: beneficiaryList[index],)));
                                       if(result){
                                          setState(() {
                                            beneficiaryList.removeAt(index);
                                          });
                                       }

                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            border: Border.all(color: Color(0xFFFFAE00),width: 2)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("Name",style: TextStyle(color: Color(0xFFFFAE00)),),
                                                            Text("Bank",style: TextStyle(color: Color(0xFFFFAE00))),
                                                          ],
                                                        ),
                                                        SizedBox(width: 5,),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(beneficiaryList[index].name,style: TextStyle(color: Colors.white)),
                                                            Text(beneficiaryList[index].bankName,style: TextStyle(color: Colors.white))
                                                            /*Text(_beneficiaryListVM.beneficiaryModel.data!.data![index].name,style: TextStyle(color: Colors.white)),
                                                            Text(_beneficiaryListVM.beneficiaryModel.data!.data![index].bankName,style: TextStyle(color: Colors.white))*/
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                /*IconButton(
                                                    onPressed: (){
                                                      Fluttertoast.showToast(msg: "Deleted Beneficiary");
                                                    },
                                                    icon: Icon(Icons.delete,color: Colors.white,)
                                                ),*/
                                                Icon(Icons.arrow_forward_ios_sharp, color: Color(0xFFFFAE00),),
                                              ],
                                            )
                                          ],
                                        ),


                                      ),
                                    );
                                  }
                              )

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                )

              ],
              ),
            ),
          buildShowDialog(context)
        ],
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

  Future setRegisterData(String fname, String lname,String mobilenumber)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isRegisteredPay", true);
    pref.setString("firstname",fname);
    pref.setString("lastname",lname);
    pref.setString("mobileNumber", mobilenumber);

    setState(() {
      beneficiaVisibility = true;
      firstname = fname;
      lastname = lname;
      registerNumber = mobilenumber;
      getBeneficiary(registerNumber);
      //_beneficiaryListVM.fetchBeneficiary(registerNumber);
    });
  }

  Future setAccountNumber(String dob,String pincode,String address,String gstState)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    //pref.setString("registerAccount", account);
    //pref.setInt("bankid", bankid);
    pref.setString("pincode", pincode);
    pref.setString("address", address);
    pref.setString("dob", dob);
    pref.setString("gstState",gstState);
  }

  Widget setRegistrtionVisibility(bool visibility){
    registerVisibility = visibility;
    if(visibility){
      Fluttertoast.showToast(msg: "User not registered! Please try again");
    }else{
      _queryRemitterVM.fetchRemitter(_mobile_controller.text);
    }
    return Container();
  }

  Widget _getRegisterContainer(double width,String stateresp){
    return Visibility(
      visible: registerVisibility,
      child: Container(
                    child: Column(
                      children: [
                        Text(
                            "Mobile number not register!",
                          style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            "Please register",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Container(
                              margin: EdgeInsets.only(
                                top: 20,
                              ),
                              child: TextFormField(
                                controller: _fnameController,
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
                                  labelText: 'Sender first name',
                                  isDense: true,
                                ),
                              ),
                            ),
                        Container(
                              margin: EdgeInsets.only(
                                top: 20,
                              ),
                              child: TextField(
                                controller: _lnameController,
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
                                  labelText: 'Sender last name',
                                  isDense: true,
                                ),
                              ),
                            ),

                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            bottom: 20
                          ),
                          child: TextFormField(
                            controller: _addressController,
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
                              labelText: 'Sender address',
                              isDense: true,
                            ),
                          ),
                        ),
                        getStateListDropDown(),

                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: TextFormField(
                                    controller: _dateController,
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
                                      labelText: 'Sender DOB',
                                      isDense: true,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: IconButton(
                                      onPressed: ()async{
                                       await _selectDate(context);
                                      },
                                      icon: Icon(Icons.calendar_today,color: Colors.white,)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextFormField(
                            controller: _pincodeController,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
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
                              labelText: 'Sender pincode',
                              isDense: true,
                            ),
                          ),
                        ),

                        Container(
                          /*margin: EdgeInsets.only(
                            top: 20,
                          ),*/
                          child: TextFormField(
                            controller: _otpController,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
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
                              labelText: 'Enter OTP',
                              isDense: true,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),

                        ElevatedButton(
                            onPressed: (){
                              registerMobileNumber(stateresp);
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 40.0),
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),

                      ],
                    ),
              ),
    );
  }

  registerMobileNumber(String stateresp)async{
    if(_mobile_controller.text.isEmpty || _mobile_controller.text.length<10){
      Fluttertoast.showToast(msg: "Enter mobile number");
    }else if(_fnameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Enter first name");
    }else if(_lnameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Enter last name");
    }/*else if(_registerAccountController.text.isEmpty){
      Fluttertoast.showToast(msg: "Enter Account Number");
    }*/ else if(_addressController.text.isEmpty){
      Fluttertoast.showToast(msg: "Enter address");
    }else if(_dateController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please select DOB");
    }else if(_pincodeController.text.isEmpty){
      Fluttertoast.showToast(msg: "Enter pincode");
    }else if(selectedState!.id=="00") {
      Fluttertoast.showToast(msg: "Please select State");
    }/*else if(_registerAccountController.text.isEmpty){
      Fluttertoast.showToast(msg: "Enter account number");
    }else if(selectedBank.bankid==00){
      Fluttertoast.showToast(msg: "Please select bank");
    }*/else{
      var network =  NetworkApiServicePaySprint();
      Map<String,String> jsonbody = {
        "mobile":_mobile_controller.text,
        "firstname":_fnameController.text,
        "lastname":_lnameController.text,
        "address":_addressController.text,
        "otp":"222111",
        "pincode":_pincodeController.text,
        "stateresp":stateresp,
        "bank3_flag":"yes",
        "dob":_dateController.text,
        "gst_state":selectedState!.id
      };
      var res = await network.postResponse(ApiEndPointsPaySprint().registerRemitter, jsonbody);
      print(res);
      Map<String, dynamic> jsonres = res;
      var model = AddBeneficiaryModel.fromJson(jsonres);
      if(model.status){
        _benefNameController.clear();
        setState((){
          selectedBank = bankList!.first;
          selectedBankModelp = bankList!.first;
          selectedState = stateList.first;
        });

        await setRegisterData(_fnameController.text
            ,_lnameController.text,
            _mobile_controller.text,);
        await setAccountNumber(
            _dateController.text,
            _pincodeController.text,
            _addressController.text,
            selectedState!.id);

        _benefAccountConroller.clear();
        _benefIFSCController.clear();
        _benefDOBController.clear();
        _benefAddressController.clear();
        _benefPincodeController.clear();
        setState(() {
          beneficiaVisibility = true;
        });

        getBeneficiary(_mobile_controller.text);
        //_beneficiaryListVM.fetchBeneficiary(registerNumber);
        
      }else{
        Fluttertoast.showToast(msg: "Beneficiary not added! please try again");
      }

    }
  }

  Widget getStateListDropDown(){

    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 5),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Color(0xFFFFAE00))
      ),
      child: DropdownButtonHideUnderline(

        child: DropdownButton<GSTStateCodeModel>(
          dropdownColor: const Color(0xFF3A3A3A),
          isExpanded: true,
          value: selectedState,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          //style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (data) {
            setState(() {
              selectedState = data!;
              print("selected state "+selectedState!.name);
              //prepaid_operator = data.;
            });
          },
          items: stateList.map((value) => DropdownMenuItem(
            child: Text(
              value.name.toString().trim(),
              overflow: TextOverflow.visible,
              maxLines: 2,
              style: TextStyle(color: Color(0xFFFFAE00), fontSize: 16),
            ),
            value: value,
          ))?.toList()??[],
        ),
      ),
    );

  }

  Widget getBankListDropDown(){

    return GestureDetector(
      onTap: (){
        setState((){
          tempBankList=bankList;
        });
        Dialog bankDialog = Dialog(
          backgroundColor: Color(0xFF3A3A3A),
          child: StatefulBuilder(builder: (context,setStateNew) {

            return Container(
              height: height - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(
                        left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)),
                        border: Border.all(
                            color: Color(0xFFFFAE00))
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: TextField(
                                textCapitalization: TextCapitalization.characters,
                                onChanged: (value) {
                                  setStateNew((){
                                    if(value.isNotEmpty){
                                      tempBankList = bankList!.where((element) => element.bankName.contains(value)).toList();
                                    }else{
                                      tempBankList = bankList!;
                                    }

                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                                autocorrect: false,
                                enableSuggestions: false,
                                style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    decoration: TextDecoration
                                        .none
                                ),
                                cursorColor: const Color(
                                    0xFFFFAE00),
                              ),
                            )
                        ),
                        Icon(Icons.search,
                          color: Color(0xFFFFAE00),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: tempBankList!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                setState((){
                                  selectedBankModelp=tempBankList![index];
                                  selectedBankNamep=selectedBankModelp!.bankName;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  tempBankList![index].bankName,
                                  style: TextStyle(color: Color(
                                      0xFFFFAE00), fontSize: 18),
                                ),
                              ),
                            );
                          }
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
            builder: (BuildContext context) => bankDialog);

      },
      child: Container(
        //height: 40,
        margin: EdgeInsets.only(top: 10,bottom: 10),
        padding: EdgeInsets.only(left: 10, right: 10,top: 12,bottom: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Color(0xFFFFAE00))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                selectedBankNamep,
                style: TextStyle(color: Color(0xFFFFAE00),fontSize: 16),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.arrow_drop_down,color: Color(0xFFFFAE00),)
          ],
        ),
      ),
    );
  }

  Future<List<GSTStateCodeModel>> getStateList()async{
    String data =await DefaultAssetBundle.of(context).loadString("assets/gst_state_code.json") ;

    final jsonResult = json.decode(data);
    setState(() {
      stateList = GSTStateCodeListModel.fromJson(jsonResult).list!;
      selectedState= stateList.first;
    });

    //print(jsonResult);
    log("Resquest : "+jsonEncode(jsonResult));
    setState(() {
      selectedBank= bankList!.first;

    });

    return stateList;
  }

  Future<List<BankModel>> getBankList()async{
    String data =await DefaultAssetBundle.of(context).loadString("assets/dmt_bank_list.json") ;

    final jsonResult = json.decode(data);
    setState(() {
      bankList = (BankListModel.fromJson(jsonResult).list);
      bankList!.sort((a,b)=>a.bankName.compareTo(b.bankName));
      tempBankList!.addAll(bankList!);
      //bankList!.insertAll(0, [new BankModel(bankid: 0, bankName: "Select Bank")]);
    });

    //print(jsonResult);
    log("Resquest : "+jsonEncode(jsonResult));
    selectedBank= bankList!.first;
    return bankList!;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: Color(0xFFDC3546),
                )),
            child: child!,
          );
        });

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        _dateController.text = formattedDate;
        _benefDOBController.text = formattedDate;
      });
  }

  buildAddBeneficiarDialog(BuildContext context){

    //BankModel selectedBank = bankList!.first;
    //GSTStateCodeModel selectedState = stateList!.first;
    BankModel? selectedBankModel;
    String selectedBankName="Selecte Bank";

    Dialog changeAddBeneficiarydDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Color(0xFF3A3A3A),
      //this right here
      child: StatefulBuilder(builder: (context, setState) {
        return SizedBox(
          //height: 320,
          child: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add Beneficiary",style: TextStyle(fontSize: 18,color: Color(0xFFFFAE00)),),
                        IconButton(
                          icon:Icon(Icons.clear,color: Color(0xFFFFAE00)),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5),
                      child: TextFormField(
                        controller: _benefNameController,
                        onChanged: (content){

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
                          labelText: 'Bneficiary Name',
                          isDense: true,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState((){
                          tempBankList=bankList;
                        });
                        Dialog bankDialog = Dialog(
                          backgroundColor: Color(0xFF3A3A3A),
                          child: StatefulBuilder(builder: (context,setStateNew) {

                            return Container(
                              height: height - 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Color(0xFFFFAE00))
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              child: TextField(
                                                textCapitalization: TextCapitalization.characters,
                                                onChanged: (value) {
                                                  setStateNew((){
                                                    if(value.isNotEmpty){
                                                      tempBankList = bankList!.where((element) => element.bankName.contains(value)).toList();
                                                    }else{
                                                      tempBankList = bankList!;
                                                    }

                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "Search",
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                ),
                                                autocorrect: false,
                                                enableSuggestions: false,
                                                style: TextStyle(
                                                    color: Color(0xFFFFAE00),
                                                    decoration: TextDecoration
                                                        .none
                                                ),
                                                cursorColor: const Color(
                                                    0xFFFFAE00),
                                              ),
                                            )
                                        ),
                                        Icon(Icons.search,
                                          color: Color(0xFFFFAE00),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: tempBankList!.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: (){
                                                setState((){
                                                  selectedBankModel=tempBankList![index];
                                                  selectedBankName=selectedBankModel!.bankName;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  tempBankList![index].bankName,
                                                  style: TextStyle(color: Color(
                                                      0xFFFFAE00), fontSize: 18),
                                                ),
                                              ),
                                            );
                                          }
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
                            builder: (BuildContext context) => bankDialog);

                      },
                      child: Container(
                          //height: 40,
                          margin: EdgeInsets.only(top: 10,bottom: 10),
                          padding: EdgeInsets.only(left: 10, right: 10,top: 12,bottom: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              border: Border.all(color: Color(0xFFFFAE00))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  selectedBankName,
                                  style: TextStyle(color: Color(0xFFFFAE00),fontSize: 16),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,color: Color(0xFFFFAE00),)
                            ],
                          ),
                        ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5),
                      child: TextFormField(
                        controller: _benefAccountConroller,
                        onChanged: (content){
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
                          labelText: 'Account No.',
                          isDense: true,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5),
                      child: TextFormField(
                        controller: _benefIFSCController,
                        onChanged: (content){

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
                          labelText: 'IFSC Code',
                          isDense: true,
                        ),
                      ),
                    ),

                    Container(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: ()async{
                          //addBeneficiary();
                          if(_benefNameController.text.isEmpty){
                            Fluttertoast.showToast(msg: "Please enter beneficiary name");
                          }else if(_benefAccountConroller.text.isEmpty){
                            Fluttertoast.showToast(msg: "Please enter beneficiary account number");
                          }else if(_benefIFSCController.text.isEmpty){
                            Fluttertoast.showToast(msg: "Please enter beneficiary IFSC code");
                          }/*else if(_benefDOBController.text.isEmpty){
                            Fluttertoast.showToast(msg: "Please select date of birth");
                          }*//*else if(_benefAddressController.text.isEmpty){
                            Fluttertoast.showToast(msg: "Please enter beneficiary address");
                          }*//*else if(_benefPincodeController.text.isEmpty){
                            Fluttertoast.showToast(msg: "Please enter beneficiary pincode");
                          }*/else if(selectedBankModel==null){
                            Fluttertoast.showToast(msg: "Please select bank ");
                          }/*else if(selectedState.id=='00'){
                            Fluttertoast.showToast(msg: "Please select state");
                          }*/else{
                            var network =  NetworkApiServicePaySprint();
                            Map<String,dynamic> jsonbody = {
                              "mobile":registerNumber,
                              "benename":_benefNameController.text,
                              "bankid":selectedBankModel!.bankid.toString(),
                              "accno":_benefAccountConroller.text,
                              "ifsccode":_benefIFSCController.text
                              /*"verified":"0",
                              "gst_state":selectedState.id,
                              "dob":_benefDOBController.text,
                              "address":_benefAddressController.text,
                              "pincode":_benefPincodeController.text*/
                            };
                            var res = await network.postResponse(ApiEndPointsPaySprint().addBeneficiary, jsonbody);
                            print(res);
                            Map<String, dynamic> jsonres = res;
                            var model = AddBeneficiaryModel.fromJson(jsonres);
                            if(model.status){
                              _benefNameController.clear();
                              setState((){
                                selectedBank = bankList!.first;
                                selectedState = stateList.first;
                              });

                              _benefAccountConroller.clear();
                              _benefIFSCController.clear();
                              _benefDOBController.clear();
                              _benefAddressController.clear();
                              _benefPincodeController.clear();

                              getBeneficiary(registerNumber);
                              //await _beneficiaryListVM.fetchBeneficiary(registerNumber);
                              Navigator.pop(context);
                            }else{
                              Fluttertoast.showToast(msg: "Beneficiary not added! please try again");
                            }
                          }
                        },
                        child: Text(
                          "Add Beneficiary",
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
                    ),
                ],
              ),
            ),
          ),
        );
      }),
    );
    
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => changeAddBeneficiarydDialog);


  }

  Future getBeneficiary(String mobileNumber)async{
    try{
      loadProgress();
      var network =  NetworkApiServicePaySprint();
      Map<String,String> jsonbody = {
        "mobile":mobileNumber,
      };
      var res = await network.postResponse(ApiEndPointsPaySprint().fetchBeneficiary, jsonbody);
      print(res);
      Map<String, dynamic> jsonres = res;
      var model = BeneficiaryListModel.fromJson(jsonres);
      if(model.status){
        setState(() {
          beneficiaryList = model.data;
        });
      }
      setState(() {
        beneficiaVisibility = true;
      });
      loadProgress();
    }catch(e){
      loadProgress();
      print(e);
    }
  }

  addBeneficiary()async{
    if(_benefNameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter beneficiary name");
    }else if(_benefAccountConroller.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter beneficiary account number");
    }else if(_benefIFSCController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter beneficiary IFSC code");
    }else if(_benefDOBController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please select date of birth");
    }else if(_benefAddressController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter beneficiary address");
    }else if(_benefPincodeController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter beneficiary pincode");
    }else if(selectedBank.bankid==0){
      Fluttertoast.showToast(msg: "Please select bank ");
    }else if(selectedState!.id=='00'){
      Fluttertoast.showToast(msg: "Please select state");
    }else{

      var network =  NetworkApiServicePaySprint();
      Map<String,String> jsonbody = {
        "mobile":registerNumber,
        "benename":_benefNameController.text,
        "bankid":selectedBank.bankid.toString(),
        "accno":_benefAccountConroller.text,
        "ifsccode":_benefIFSCController.text,
        "verified":"0",
        "gst_state":selectedState!.id,
        "dob":_benefDOBController.text,
        "address":_benefAddressController.text,
        "pincode":_benefPincodeController.text
      };
      var res = await network.postResponse(ApiEndPointsPaySprint().addBeneficiary, jsonbody);
      print(res);
      Map<String, dynamic> jsonres = res;
      var model = BeneficiaryListModel.fromJson(jsonres);
      if(model.status){
        setState(() {
          beneficiaryList = model.data;
        });
      }

      /*_addBeneficiaryVM.addBenificiary(
          _mobile_controller.text,
          _benefNameController.text,
          selectedBank.bankid.toString(),
          _benefAccountConroller.text,
          _benefIFSCController.text,
          '0',
          selectedState.id,
          _benefDOBController.text,
          _benefAddressController.text,
          _benefPincodeController.text);*/
    }
  }

  void setVisibility(bool visibility){
    setState(() {
      containerVisible = visibility;
    });
  }

}