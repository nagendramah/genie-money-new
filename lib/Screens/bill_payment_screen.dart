import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/utility/DthInfoReponse.dart';
import 'package:genie_money/Model/utility/FasttagModel.dart';
import 'package:genie_money/Screens/browse_plan_screen.dart';
import 'package:genie_money/Screens/wallet_screen.dart';
import 'package:genie_money/data/remote/network/ApiEndPointsPaySprint.dart';
import 'package:genie_money/data/remote/network/NetworkApiServicePaySprint.dart';
import 'package:genie_money/data/remote/response/Status.dart';
import 'package:genie_money/view_model/recharge.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/utility/BillDetail.dart';
import '../Model/utility/DoRechargeModel.dart';
import '../Model/utility/OperatorListModel.dart';
import '../Model/utility/OperatorModel.dart';
class BillPaymentScreen extends StatefulWidget {
  String title;

  BillPaymentScreen(this.title, {Key? key}) : super(key: key);

  @override
  _BillPaymentScreenState createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen> {
  late String pointsss;

  final TextEditingController _mobile_no_controller = TextEditingController();
  final TextEditingController _prepaid_recharge_amount_controller =
      TextEditingController();
  final TextEditingController _dth_customer_no_controller =
      TextEditingController();
  final TextEditingController _dth_amount_controller = TextEditingController();
  final TextEditingController _electricity_customer_no_controller = TextEditingController();
  final TextEditingController _electricity_customer_amount_controller = TextEditingController();
  final TextEditingController _electricity_amount_controller =
      TextEditingController();
  final TextEditingController _gas_customer_no_controller =
      TextEditingController();
  final TextEditingController _gas_amount_controller = TextEditingController();
  final TextEditingController _water_customer_no_controller =
      TextEditingController();
  final TextEditingController _water_amount_controller =
      TextEditingController();
  final TextEditingController _landline_no_controller = TextEditingController();
  final TextEditingController _landline_amount_controller =
      TextEditingController();
  final TextEditingController _broadband_postpaid_no_controller =
      TextEditingController();
  final TextEditingController _broadband_postpaid_amount_controller =
      TextEditingController();
  final TextEditingController _postpaid_mobile_no_controller = TextEditingController();
  final TextEditingController _mobile_postpaid_amount_controller = TextEditingController();
  final TextEditingController _fasttag_cnumber_controller = TextEditingController();
  final TextEditingController _fasttag_mount_controller = TextEditingController();
  bool prepaid_recharge = false;
  bool dth = false;
  bool _show_dth = false;
  bool electricity = false;
  bool show_data_electricity = false;
  bool _show_electricity = false;
  bool gas = false;
  bool _show_gas = false;
  bool water = false;
  bool _show_water = false;
  bool landline = false;
  bool _show_landline = false;
  bool broadband_postpaid = false;
  bool _show_broadband_postpaid = false;
  bool postpaid_recharge = false;
  bool _show_mobile_postpaid = false;
  bool isButton = false;
  bool _postpaid_amount_visible = false;
  bool _showFasttag = false;

  late Operator prepaid_operator;
  //String dth_operator = 'Select Operator';
  String electricity_operator = 'Select Operator';
  String payment_time = 'Pay Now';
  String payment_method = 'Select Payment Method';
  String gas_operator = 'Select Operator';
  String water_operator = 'Select Operator';
  String landline_operator = 'Select Operator';
  String broadband_postpaid_operator = 'Select Operator';
  late BillOperator mobile_postpaid_operator;

  late Operator dth_operator;

  List<String> dth_operator_list = [
    'Select Operator',
    'Airteldth',
    'TataSky',
    'Videocon',
    'Sundirect',
    'Dishtv'
  ];

  List<Operator> dthOperatorList=[new Operator(id: '0', name: 'select Operator', category: 'DTH')];

  List<String> electricity_operator_list = [
    'Select Operator',
    'Assam Power Distribution Company LTD (RAPDR)',
    'Assam Power Distribution Company LTD (Non-RAPDR)',
    'Ajmer Vidyut Vitran Nigam Limited (AVVNL)',
    'Bangalore Electricity Supply Co. LTD. (BESCOM)',
    'Bharatpur Electricity Services LTD. (BESL) - Old',
    'Bharatpur Electricity Services LTD. (BESL)',
    'B.E.S.T Mumbai',
    'Bikaner Electricity Supply Limited (BKESL) - Old',
    'Bikaner Electricity Supply Limited (BKESL)',
    'BSES Rajdhani Power Limited'
  ];
  List<String> payment_time_list = [
    'Pay Now'
  ];
  List<String> payment_method_list = [
    'Select Payment Method'
  ];

  List<String> gas_operator_list = [
    'Select Operator',
    'Adani Gas',
    'Aavantika Gas LTD.',
    'Charotar Gas Sahakari Mandali LTD',
    'Central U.P. Gas Limited',
    'Gujrat Gas Limited',
    'Haryana City Gas - Kapil Chopra Enterprise - Old',
    'Haryana City Gas - Kapil Chopra Enterprise',
    'Indraprastha Gas',
    'Indian Oil - Adani Gas Private Limited',
    'Mahanagar Gas Limited'
  ];

  List<String> landline_operator_list = [
    'Select Operator',
    'Airtel Landline',
    'BSNL Landline - Corporate',
    'BSNL Landline - Individual',
    'MTNL Delhi',
    'MTNL Mumbai',
    'Tata Docomo CDMA Landline'
  ];




  List<String> prepaidCircleList =[
  'Andhra Pradesh Telangana',
  ];

  String currentCircle="";


  void _checkName() {
    setState(() {
      if (widget.title == "Mobile Prepaid") {
        prepaid_recharge = true;
      } else if (widget.title == "DTH Recharge") {
        dth = true;
      } else if (widget.title == "Electricity Bill") {
        postpaid_recharge = true;
        //electricity = true;
      } else if (widget.title == "Piped Gas Bill") {
        postpaid_recharge = true;
        //gas = true;
      } else if (widget.title == "Water Tax Bill") {
        postpaid_recharge = true;
        //water = true;
      } else if (widget.title == "Landline Bill") {
        //landline = true;
        postpaid_recharge = true;
      } else if (widget.title == "BroadBand Postpaid") {
        postpaid_recharge = true;
        //broadband_postpaid = true;
      } else if (widget.title == "Mobile Postpaid") {
        postpaid_recharge = true;
      }else if(widget.title == "Fast Tag"){
        _showFasttag = true;
      }
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> _onBackPressed() async {
    if (show_data_electricity) {
      setState(() {
        show_data_electricity = false;
        _show_electricity = true;
      });
      return false;
    } else {
      return true;
    }
  }

  OperatorListVM _operatorListVM = OperatorListVM();
  var networkApiService = NetworkApiServicePaySprint();
  bool isProgessBarVisible = false;
  double walletAmount = 0.0;
  //double walletAmount = 500;
  bool planVisibility = false;

  List<BillOperator> billOperatorList = [
    BillOperator(id: '0',
        name: 'Select Operator',
        category: 'post paid',
        viewbill: "0",
        regex: "^[1-9]{1}[0-9]{9}",
        displayname: "MobileNumber(+91)",
        ad1_d_name: null,
        ad1_name: null,
        ad1_regex: null,
        ad2_d_name: null,
        ad2_name: null,
        ad2_regex: null,
        ad3_d_name: null,
        ad3_name: null,
        ad3_regex: null)
  ];

  List<FasttagData> fasttagDataList = [
    FasttagData(
      id: "0",
      bankname: "",
      category: "",
      viewbill: "",
      regex: "",
      displayname: "select operator",
      ad1_regex: ""
    )
  ];


  Bill? bill = null;
  BillDetailsLPG? billDetailsLPG = null;
  DthInfoResponse? info = null;
  bool dth_info_visbility= false;
  late FasttagData selectedfastTagOperator;
  String fasttagCustName="";
  String fasttagAmount = "";
  String fasttagDueDate = "";
  String fasttagMessage = "";
  bool fasttagdetailsVisibility = false;
  FasttagDetail? fasttagDetailModel;
  @override
  void initState() {
    getreferal();


    currentCircle = prepaidCircleList.first;
    dth_operator = dthOperatorList.first;
    mobile_postpaid_operator = billOperatorList.first;
    selectedfastTagOperator = fasttagDataList.first;
    if(electricity) {
      setState(() {
        _electricity_customer_amount_controller.text = "1560.00";
      });
    }
    getWalletAmount();
    //getRechargeList();
    if(widget.title=="Mobile Prepaid" || widget.title=="DTH Recharge"){
      _operatorListVM.fetchOperator();
    }else if(widget.title=="Mobile Postpaid" ||
        widget.title=="Landline Bill" ||
        widget.title == "Electricity Bill" ||
        widget.title == "Water Tax Bill" ||
        widget.title == "BroadBand Postpaid" ||
        widget.title == "Piped Gas Bill"
    ){
      getBillPayOperaterList();
    }else if(widget.title == "Fast Tag"){
      getFastTagOperator();
    }

    super.initState();
  }

  getWalletAmount()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    //walletAmount = pref.getDouble("upiId")??0.0;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _checkName();
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
       // resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: Text(
            widget.title,
            style: const TextStyle(color: Color(0xFFFFAE00)),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.history,color: Color(0xFFFFAE00)))
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFFFFAE00),
            ),
            onPressed: () {
              if (show_data_electricity) {
                setState(() {
                  show_data_electricity = false;
                  _show_electricity = true;
                });
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WalletScrreen()));
                            },
                            child: Container(
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
                                        " Wallet : ",
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontWeight: FontWeight.bold,

                                        ),
                                      ),
                                    
                                      Text(
                                          pointsss.toString(),
                                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,))
                                    ],
                                  ),

                                  Icon(Icons.arrow_forward,color: Color(0xFFFFAE00),)

                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: prepaid_recharge,
                            child: perpaidMobileCenter(height, width, context),
                          ),
                          Visibility(
                            visible: dth,
                            child: dthColumn(height, width, context),
                          ),

                          Visibility(
                            visible: gas,
                            child: gasColumn(height, width, context),
                          ),

                          Visibility(
                            visible: landline,
                            child: landlineColumn(height, width, context),
                          ),

                          Visibility(
                            visible: postpaid_recharge,
                            child: mobile_postpaid_Column(height, width, context),
                          ),
                          Visibility(
                            visible: _showFasttag,
                            child: fasttagColumn(height, width, context),
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

  Column mobile_postpaid_Column(
      double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Color(0xFFFFAE00))
          ),
          padding: EdgeInsets.only(left: 10,right: 10),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<BillOperator>(
              dropdownColor: const Color(0xFF3A3A3A),
              isExpanded: true,
              value: mobile_postpaid_operator,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Color(0xFFFFAE00),
              ),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
              onChanged: (data) {
                setState(() {
                  mobile_postpaid_operator = data!;
                  if (mobile_postpaid_operator.name == "Select Operator") {
                    _show_mobile_postpaid = false;
                    isButton = false;
                  } else {
                    _show_mobile_postpaid = true;
                    isButton = true;
                  }
                });
              },
              items: billOperatorList.map<DropdownMenuItem<BillOperator>>((value) {
                return DropdownMenuItem<BillOperator>(
                  value: value,
                  child: Text(
                      value.name!,
                      style: TextStyle(color: Color(0xFFFFAE00)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Visibility(
          visible: _show_mobile_postpaid,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0,bottom: 10),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _postpaid_mobile_no_controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    label: const Text(
                      "Mobile Number",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    counterText: ""
                  ),
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: const Text(
                    "Proceed",
                    style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                        width, MediaQuery.of(context).size.height * 0.05),
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () async{
                    if(_postpaid_mobile_no_controller.text.isEmpty){
                      Fluttertoast.showToast(msg: "Please mobile amount");
                    }else{
                      if(widget.title=="Piped Gas Bill"){
                        await getLPGBillDetails(_postpaid_mobile_no_controller.text);
                      }else{
                        await getBillDetails(_postpaid_mobile_no_controller.text);  
                      }
                    }
                  },
                ),
              ),
              Visibility(
                visible: _postpaid_amount_visible,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "User Name : ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  bill==null?"":(bill!.userName==null?"":bill!.userName!),
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          /*Container(
                            child: Row(
                              children: [
                                Text(
                                  "Cell number : ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  bill==null?"":(bill!.userName==null?"":bill!.userName!),
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),*/
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "Bill Amount : ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  bill==null?"":(bill!.billAmount==null?"":bill!.billAmount.toString()),
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),

                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "Due Date : ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  bill==null?"":(bill!.dueDate==null?"":bill!.dueDate!),
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0,bottom: 10),
                      child: TextFormField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        readOnly: true,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        controller: _mobile_postpaid_amount_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Amount",
                            style: TextStyle(color: Color(0xFFFFAE00)),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        child: const Text(
                          "Pay Bill",
                          style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              width, MediaQuery.of(context).size.height * 0.05),
                          primary: const Color(0xFFFFAE00),
                          shadowColor: const Color(0xFFFFAE00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onPressed: () async{
                        if(widget.title=="Piped Gas Bill"){
                          await payBillLPG(_postpaid_mobile_no_controller.text);
                        }else{
                          await payBill(_postpaid_mobile_no_controller.text);
                        }


                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }

  Column landlineColumn(double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF3A3A3A),
          isExpanded: true,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFAE00)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFAE00)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFAE00)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFAE00)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            isDense: true,
          ),
          value: landline_operator,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (String? data) {
            setState(() {
              landline_operator = data!;
              if (landline_operator == "Select Operator") {
                _show_landline = false;
                isButton = false;
              } else {
                _show_landline = true;
                isButton = true;
              }
            });
          },
          items: landline_operator_list
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Visibility(
          visible: _show_landline,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _landline_no_controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    label: const Text(
                      "Landline Number with STD Code",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _landline_amount_controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    label: const Text(
                      "Amount",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              // SizedBox(
              //   height: height * 0.4493,
              // ),
              // ElevatedButton(
              //   child: const Text(
              //     "PAY",
              //     style: TextStyle(
              //         color: Color(0xFF111111),
              //         fontSize: 15.0,
              //         fontWeight: FontWeight.bold),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     fixedSize:
              //         Size(width, MediaQuery.of(context).size.height * 0.05),
              //     primary: const Color(0xFFFFAE00),
              //     shadowColor: const Color(0xFFFFAE00),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5.0),
              //     ),
              //   ),
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Column gasColumn(double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF3A3A3A),
          isExpanded: true,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFAE00)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFAE00)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFAE00)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFAE00)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            isDense: true,
          ),
          value: gas_operator,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (String? data) {
            setState(() {
              gas_operator = data!;
              if (gas_operator == "Select Operator") {
                _show_gas = false;
                isButton = false;
              } else {
                _show_gas = true;
                isButton = true;
              }
            });
          },
          items:
              gas_operator_list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Visibility(
          visible: _show_gas,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _gas_customer_no_controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    label: const Text(
                      "Customer ID",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _gas_amount_controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    label: const Text(
                      "Amount",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              // SizedBox(
              //   height: height * 0.4493,
              // ),
              // ElevatedButton(
              //   child: const Text(
              //     "PAY",
              //     style: TextStyle(
              //         color: Color(0xFF111111),
              //         fontSize: 15.0,
              //         fontWeight: FontWeight.bold),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     fixedSize:
              //         Size(width, MediaQuery.of(context).size.height * 0.05),
              //     primary: const Color(0xFFFFAE00),
              //     shadowColor: const Color(0xFFFFAE00),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5.0),
              //     ),
              //   ),
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Column show_data_electric(double width, double height, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bill Amount",
                style: TextStyle(
                  color: const Color(0xFFFFAE00),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "\u20B91560.00",
                  style: TextStyle(
                    color: const Color(0xFFFFAE00),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          color: const Color(0xFFFFAE00),
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Due Date",
                style: TextStyle(
                  color: const Color(0xFFFFAE00),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "27-03-2022",
                  style: TextStyle(
                    color: const Color(0xFFFFAE00),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          color: const Color(0xFFFFAE00),
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bill Number",
                style: TextStyle(
                  color: const Color(0xFFFFAE00),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "981276346556",
                  style: TextStyle(
                    color: const Color(0xFFFFAE00),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          color: const Color(0xFFFFAE00),
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bill Period",
                style: TextStyle(
                  color: const Color(0xFFFFAE00),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "2022/03",
                  style: TextStyle(
                    color: const Color(0xFFFFAE00),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          color: const Color(0xFFFFAE00),
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Consumer Number",
                style: TextStyle(
                  color: const Color(0xFFFFAE00),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  _electricity_customer_no_controller.text,
                  style: TextStyle(
                    color: const Color(0xFFFFAE00),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          color: const Color(0xFFFFAE00),
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Customer Name",
                style: TextStyle(
                  color: const Color(0xFFFFAE00),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Anup More",
                  style: TextStyle(
                    color: const Color(0xFFFFAE00),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
              color: const Color(0xFF3A3A3A),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: DropdownButtonFormField<String>(
                  dropdownColor: const Color(0xFF3A3A3A),
                  isExpanded: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    isDense: true,
                    label: Text("When To Pay"),
                    labelStyle: TextStyle(
                        color: const Color(0xFFFFAE00)
                    ),
                  ),
                  value: payment_time,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFFFFAE00),
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                  onChanged: (String? data) {
                    setState(() {
                      payment_time = data!;
                    });
                  },
                  items: payment_time_list
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  readOnly: true,
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _electricity_customer_amount_controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    label: const Text(
                      "Payment Amount (\u20B9)",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: DropdownButtonFormField<String>(
                  dropdownColor: const Color(0xFF3A3A3A),
                  isExpanded: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    isDense: true,
                    label: Text("Payment Method"),
                    labelStyle: TextStyle(
                        color: const Color(0xFFFFAE00)
                    ),
                  ),
                  value: payment_method,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFFFFAE00),
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                  onChanged: (String? data) {
                    setState(() {
                      payment_method = data!;
                    });
                  },
                  items: payment_method_list
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  child: const Text(
                    "Pay",
                    style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                    Size(width, MediaQuery.of(context).size.height * 0.05),
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {

                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
              color: const Color(0xFF3A3A3A),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(
                    "NOTE",
                  style: TextStyle(
                    color: Color(0xFFFFAE00),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(
                  "When to Pay-Pay later",
                  style: TextStyle(
                    color: Color(0xFFFFAE00),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(
                  "Scheduled your payment to a later date (but prior to atleast few working days before due date). Please note your account will be automatically debited on next working day of the scheduled date.",
                  style: TextStyle(
                    color: Color(0xFFFFAE00),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column dthColumn(double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: ChangeNotifierProvider<OperatorListVM>(
            create: (context)=> _operatorListVM,
            child: Consumer<OperatorListVM>(builder: (context,_operatorListVM,_){
              switch(_operatorListVM.operatorModel.status){
                case Status.LOADING:
                  print("Operator :: LOADING");
                  return Text("Loading",style: TextStyle(color: Color(0xFFFFAE00)),);//LoadingWidget();
                case Status.ERROR:
                  print("Operator :: ERROR");
                  return Text(_operatorListVM.operatorModel.message ?? "NA",style: TextStyle(color: Color(0xFFFFAE00)),);//MyErrorWidget(viewModel.movieMain.message ?? "NA");
                case Status.COMPLETED:
                  print("Operator :: COMPLETED");
                  print(_operatorListVM.operatorModel.data);
                  var list = _operatorListVM.operatorModel.data?.operatorList;
                  //var prepaidOperatorList = list!.where((element) => element.category=="Prepaid").toList();
                  dthOperatorList = list!.where((element) => element.category=="DTH").toList();
                  prepaid_operator = dthOperatorList.first;
                  dth_operator = dthOperatorList.first;
                  return _getOperatorListView(dthOperatorList,context);
                default:
              }
              return Container();
            },
            ),
          ),
        ),
        Visibility(
          visible: true,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _dth_customer_no_controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    label: const Text(
                      "Customer Number",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(
                  child: const Text(
                    "PROCEED",
                    style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                        width, MediaQuery.of(context).size.height * 0.05),
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () async{
                    if(walletAmount==0.0){
                      Fluttertoast.showToast(msg: "Insufficient balance. Please add amount in wallet to make recharge.");
                    }else{
                      if(_dth_customer_no_controller.text.isEmpty){
                        Fluttertoast.showToast(msg: "Please mobile amount");
                      }else{
                        await getDthDetail(_dth_customer_no_controller.text);
                      }
                    }
                  },
                ),
              ),
              Visibility(
                visible: dth_info_visbility,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(info==null?"":(info!.status==true?"":"No data found"), style: TextStyle(color: Colors.white),),
                            Text(
                                "Customer name : "+(info==null?"":(info!.info!.customerName== null?"":info!.info!.customerName!)),
                                style:TextStyle(color: Colors.white)
                            ),
                            Text(
                                "Balance : "+(info==null?"":(info!.info!.balance== null?"":info!.info!.balance.toString())),
                                style:TextStyle(color: Colors.white)
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          cursorColor: const Color(0xFFFFAE00),
                          keyboardType:
                              const TextInputType.numberWithOptions(decimal: true),
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          controller: _dth_amount_controller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            isDense: true,
                            label: const Text(
                              "Amount",
                              style: TextStyle(color: Color(0xFFFFAE00)),
                            ),
                            labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        child: ElevatedButton(
                          child: const Text(
                            "Pay",
                            style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                width, MediaQuery.of(context).size.height * 0.05),
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () async{
                            if(walletAmount==0.0){
                              Fluttertoast.showToast(msg: "Insufficient balance. Please add amount in wallet to make recharge.");
                            }else{
                              if(_dth_customer_no_controller.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please mobile amount");
                              }else if(_dth_amount_controller.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please enter amount");
                              }else{
                                await doRechargeList(context,int.parse(prepaid_operator.id!),
                                    _dth_customer_no_controller.text,
                                    _dth_amount_controller.text);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Center perpaidMobileCenter(double height, double width, BuildContext context) {
    TextEditingController _mobileNumberController = TextEditingController();
    TextEditingController _amountController = TextEditingController();

    return Center(
      child: Container(
        /*margin: EdgeInsets.only(top: height * 0.15),*/
        child: Card(
          color: const Color(0xFF3A3A3A),
          shadowColor: const Color(0xFF3A3A3A),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select Operator*",
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18.0),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: ChangeNotifierProvider<OperatorListVM>(
                    create: (context)=> _operatorListVM,
                    child: Consumer<OperatorListVM>(builder: (context,_operatorListVM,_){
                      switch(_operatorListVM.operatorModel.status){
                        case Status.LOADING:
                          print("Operator :: LOADING");
                          return Text("Loading",style: TextStyle(color: Color(0xFFFFAE00)),);//LoadingWidget();
                        case Status.ERROR:
                          print("Operator :: ERROR");
                          return Text(_operatorListVM.operatorModel.message ?? "NA",style: TextStyle(color: Color(0xFFFFAE00)),);//MyErrorWidget(viewModel.movieMain.message ?? "NA");
                        case Status.COMPLETED:
                          print("Operator :: COMPLETED");
                          print(_operatorListVM.operatorModel.data);
                          var list = _operatorListVM.operatorModel.data?.operatorList;
                          var prepaidOperatorList = list!.where((element) => element.category=="Prepaid").toList();
                          //dthOperatorList = list!.where((element) => element.category=="DTH").toList();
                          prepaid_operator = prepaidOperatorList.first;
                          //dth_operator = dthOperatorList.first;
                          return _getOperatorListView(prepaidOperatorList,context);
                        default:
                      }
                      return Container();
                    },),
                  ),
                ),
                const Text(
                  "Select Circle*",
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18.0),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Color(0xFFFFAE00))
                  ),
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: const Color(0xFF3A3A3A),
                      isExpanded: true,
                      value: currentCircle,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFFFFAE00),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      //style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                      onChanged: (data) {
                        setState(() {
                          currentCircle=data.toString();
                        });
                      },
                      items: prepaidCircleList.map((value) => DropdownMenuItem(
                        child: Text(
                          value,
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                          style: TextStyle(color: Color(0xFFFFAE00), fontSize: 12),
                        ),
                        value: value,
                      )).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: const Text(
                    "Mobile Number*",
                    style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _mobile_no_controller,
                    onChanged: (value){
                      if(value.length>9){
                        setState(() {
                          planVisibility= true;
                        });
                      }else{
                        setState(() {
                          planVisibility= false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      isDense: true,
                      hintText: "Enter Here",
                      hintStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      counterText: ""
                    ),
                  ),
                ),
                Visibility(
                  visible: planVisibility,
                  child: GestureDetector(
                    onTap: ()async{
                      var price = await Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) =>
                              BrowsePlanScreen(title: "Prepaid",operator: prepaid_operator.name.toString(),circle: currentCircle,phoneNumber: _mobile_no_controller.text,),
                        ),
                      );
                      print("price : "+price.toString());
                      _prepaid_recharge_amount_controller.text=price.toString();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                            "Browse Plan",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Color(0xFFFFAE00)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: const Text(
                    "Amount*",
                    style: TextStyle(
                      color: Color(0xFFFFAE00),
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _prepaid_recharge_amount_controller,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      isDense: true,
                      hintText: "Amount",
                      hintStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                    child: const Text(
                      "PROCEED",
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                          width, MediaQuery.of(context).size.height * 0.05),
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () async{
                      if(walletAmount==0.0){
                        Fluttertoast.showToast(msg: "Insufficient balance. Please add amount in wallet to make recharge.");
                      }else{
                        if(_mobile_no_controller.text.isEmpty){
                          Fluttertoast.showToast(msg: "Please mobile amount");
                        }else if(_prepaid_recharge_amount_controller.text.isEmpty){
                          Fluttertoast.showToast(msg: "Please enter amount");
                        }else{
                          await doRechargeList(context,int.parse(prepaid_operator.id!),
                              _mobile_no_controller.text,
                              _prepaid_recharge_amount_controller.text);
                        }
                      }

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column fasttagColumn(double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Color(0xFFFFAE00))
          ),
          padding: EdgeInsets.only(left: 10,right: 10),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<FasttagData>(
              dropdownColor: const Color(0xFF3A3A3A),
              isExpanded: true,
              value: selectedfastTagOperator,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Color(0xFFFFAE00),
              ),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
              onChanged: (data) {
                setState(() {
                  selectedfastTagOperator = data!;
                });
              },
              items: fasttagDataList.map<DropdownMenuItem<FasttagData>>((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value.bankname.toString()),
                );
              }).toList(),
            ),
          ),
        ),
        Visibility(
          visible: true,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _fasttag_cnumber_controller,
                  maxLength: 10,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    label: const Text(
                      "Customer ID",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(
                  child: const Text(
                    "PROCEED",
                    style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                        width, MediaQuery.of(context).size.height * 0.05),
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () async{
                    if(_fasttag_cnumber_controller.text.isNotEmpty){
                      getFastTagDetails(_fasttag_cnumber_controller.text);
                    }else{
                      Fluttertoast.showToast(msg: "Please enter customer number.");
                    }

                  },
                ),
              ),
              Text(
                fasttagMessage,
                style: TextStyle(color: Colors.white),
              ),
              Visibility(
                visible: fasttagdetailsVisibility,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                              "Customer Name : "+fasttagCustName,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                              "Amount : "+fasttagAmount,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                              "Due Date : "+fasttagDueDate,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        controller: _fasttag_mount_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Amount",
                            style: TextStyle(color: Color(0xFFFFAE00)),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      child: ElevatedButton(
                        child: const Text(
                          "PAY",
                          style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              width, MediaQuery.of(context).size.height * 0.05),
                          primary: const Color(0xFFFFAE00),
                          shadowColor: const Color(0xFFFFAE00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onPressed: () async{
                          if(walletAmount==0.0){
                             Fluttertoast.showToast(msg: "Insufficient balance. Please add amount in wallet to make recharge.");
                          }else{
                            if(_fasttag_cnumber_controller.text.isEmpty){
                              Fluttertoast.showToast(msg: "Please enter customer number");
                            }else if(_fasttag_mount_controller.text.isEmpty){
                              Fluttertoast.showToast(msg: "Please enter amount");
                            }else{
                              await fastTagRecharge(_fasttag_cnumber_controller.text);
                            }
                          }

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future getDthDetail(String canumber)async{
    try{
      loadProgress();
      Map<String,dynamic> jsonbody = {
        "canumber":canumber,
        "op":prepaid_operator.name
      };
      var res = await networkApiService.postResponse(ApiEndPointsPaySprint().dthInfo, jsonbody);
      print(res);
      var model = DthInfoResponse.fromJson(res);
      if(model.status){
        loadProgress();
        setState(() {
          info = model;
          dth_info_visbility = true;
        });

      }else{
        loadProgress();
        /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Data not found for customer number $canumber", style: TextStyle(color: Color(0xFFFFAE00)),),
        ));*/
        Fluttertoast.showToast(
          msg: "Data not found for customer number $canumber",
          backgroundColor: Color(0xFFFFAE00),
          gravity: ToastGravity.CENTER
        );
        print("Data not found");
      }

    }catch(e){
      loadProgress();
      print(e);
    }
  }

  Future doRechargeList(BuildContext context,int operator,numbertoRecharger,String amount)async{
    try{
      FocusScope.of(context).unfocus();
      loadProgress();
      String referenceid=generateReferenceId().toString();
      //int referenceid= generateReferenceId();
      Map<String,dynamic> jsonbody = {
        "operator":operator,
        "canumber":numbertoRecharger,
        "amount":amount,
        "referenceid":referenceid
      };

      var res = await networkApiService.postResponse(ApiEndPointsPaySprint().doRecharge, jsonbody);
      print(res);
      var model = DoRechargeModel.fromJson(res);
      if(model.status){
        if(model.responseCode==1){
          if(widget.title=="Mobile Prepaid"){
            _mobile_no_controller.clear();
            _prepaid_recharge_amount_controller.clear();
          }else{
            _dth_customer_no_controller.clear();
            _dth_amount_controller.clear();
          }

          //Fluttertoast.showToast(msg:model.message);
          String msg = "Recharge for"+ prepaid_operator.name.toString() +"of Amount "+amount.toString() +" is successfull"; 
          alterDialog(context,msg,numbertoRecharger);
        }else{
          alterDialog(context,model.message,numbertoRecharger);
          //Fluttertoast.showToast(msg:model.message);
        }
        //Fluttertoast.showToast(msg: "Recharge for Aircel of Amount "+amount.toString() +" is successfull");
        
      }else{
        String msg="Recharge for"+ prepaid_operator.name.toString() +"of Amount "+amount.toString() +" is failed";
        alterDialog(context,msg,numbertoRecharger);
        //Fluttertoast.showToast(msg: "Recharge for Aircel of Amount "+amount.toString() +" is failed");
      }
      loadProgress();
    }catch(e){
      print("dorechange : "+e.toString());
      loadProgress();
    }
  }

  int generateReferenceId(){
    int id = DateTime.now().millisecondsSinceEpoch;
    //print(""+id.toString());
    return id;
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

  alterDialog(BuildContext context,String msg,String mobileNumber){

    Dialog alterDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Color(0xFF3A3A3A),
      child: StatefulBuilder(builder: (context,setState){
        return Container(
          height: 240,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        widget.title=="Mobile Prepaid"?"Prepaid Recharge":"DTH",
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
                margin: EdgeInsets.all(20),
                child: Text(
                    msg+" for "+mobileNumber,
                    style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK",
                    style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
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
        );
      },),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => alterDialog
    );


  }

  Widget _getOperatorListView(List<Operator>? list,BuildContext context){
    //print("list lenght : "+list!.length.toString());

    return
      //DropdownButtonFormField<Operator>(
      StatefulBuilder(builder: (context,setState){
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Color(0xFFFFAE00))
          ),
          padding: EdgeInsets.only(left: 10,right: 10),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Operator>(
              dropdownColor: const Color(0xFF3A3A3A),
              isExpanded: true,
              value: prepaid_operator,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Color(0xFFFFAE00),
              ),
              iconSize: 24,
              elevation: 16,
              //style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
              onChanged: (data) {
                setState(() {
                  print("data : "+data!.name!);
                  prepaid_operator = data;
                });
              },
              items: list?.map((value) => DropdownMenuItem(
                child: Text(
                  value.name.toString().trim(),
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 12),
                ),
                value: value,
              )).toList()??[],
            ),
          ),
        );},
      );
  }

  Future getBillPayOperaterList()async{
    try{
      loadProgress();
      Map<String,dynamic> jsonbody = {
        "mode": "online"
      };
      dynamic res;
      if(widget.title=="Piped Gas Bill"){
        res = await networkApiService.postResponse(ApiEndPointsPaySprint().lpgBillOperatorList, jsonbody);
      }else{
        res = await networkApiService.postResponse(ApiEndPointsPaySprint().billpayOperatorList, jsonbody);
      }

      print(res);
      var model = OperatorListModel.formJson(res);

      if(model.status) {
        billOperatorList.clear();
        //if (model.responseCode == 1) {
          setState(() {
            var list = model.data;
            if(widget.title=="Mobile Postpaid"){
              setState(() {
                billOperatorList = list.where((element) => element.category=="Postpaid").toList();
                mobile_postpaid_operator = billOperatorList.first;
                //print("length : "+(list.length).toString());
                _show_mobile_postpaid = true;
                isButton = true;
                print("length : "+(billOperatorList.length).toString());
              });
            }else if(widget.title=="Landline Bill"){
              billOperatorList = list.where((element) => element.category=="Landline").toList();
              mobile_postpaid_operator = billOperatorList.first;
              //print("length : "+(list.length).toString());
              _show_mobile_postpaid = true;
              isButton = true;
              print("length : "+(billOperatorList.length).toString());
            }else if(widget.title == "Electricity Bill"){

              billOperatorList = list.where((element) => element.category=="Electricity").toList();
              mobile_postpaid_operator = billOperatorList.first;
              //print("length : "+(list.length).toString());
              _show_mobile_postpaid = true;
              isButton = true;
              print("length : "+(billOperatorList.length).toString());
            }else if(widget.title == "Water Tax Bill"){

              billOperatorList = list.where((element) => element.category=="Water").toList();
              mobile_postpaid_operator = billOperatorList.first;
              //print("length : "+(list.length).toString());
              _show_mobile_postpaid = true;
              isButton = true;
              print("length : "+(billOperatorList.length).toString());
            }else if(widget.title == "BroadBand Postpaid"){
              billOperatorList = list.where((element) => element.category=="Broadband").toList();
              mobile_postpaid_operator = billOperatorList.first;
              //print("length : "+(list.length).toString());
              _show_mobile_postpaid = true;
              isButton = true;
              print("length : "+(billOperatorList.length).toString());
            }else if(widget.title=="Piped Gas Bill"){
              setState(() {
                billOperatorList = list;
                mobile_postpaid_operator = billOperatorList.first;
                //print("length : "+(list.length).toString());
                _show_mobile_postpaid = true;
                isButton = true;
              });

              print("length : "+(billOperatorList.length).toString());
            }
          });
        //}
      }
      loadProgress();
    }catch(e){
      print(e.toString());
    }
  }

  Future getLPGBillDetails(String cnunumber)async{
    try{
      loadProgress();
      var jsonbody = Map<String,dynamic>();
        jsonbody = {
          "operator": int.parse(mobile_postpaid_operator.id!),
          "canumber": int.parse(cnunumber),
        };

      var res = await networkApiService.postResponse(ApiEndPointsPaySprint().lpgBillDetails, jsonbody);
      print(res);
      var model = BillDetailsLPG.fromJson(res);
      if(model.status){
        loadProgress();
        setState(() {
         //billDetailsLPG = model;
          bill = Bill(billAmount: model.amount, dueDate: "", userName: model.name);
          _postpaid_amount_visible = true;
          _mobile_postpaid_amount_controller.text = (bill!.billAmount).toString();
        });

      }else{
        loadProgress();
        print("Data not found");
      }

    }catch(e){
      loadProgress();
      print(e);
    }
  }
  
  Future getBillDetails(String cnunumber)async{
     try{
       loadProgress();
        var jsonbody = Map<String,dynamic>();
      
         jsonbody = {
           "operator": int.parse(mobile_postpaid_operator.id!),
           "canumber": int.parse(cnunumber),
           "mode": "online"
         };
       

       var res = await networkApiService.postResponse(ApiEndPointsPaySprint().fetchBillDetails, jsonbody);
       print(res);
       var model = BillDetail.fromJson(res);
       if(model.status){
         loadProgress();
         setState(() {
           bill = model.bill_fetch;
           _postpaid_amount_visible = true;
           _mobile_postpaid_amount_controller.text = (bill!.billAmount).toString();
         });

       }else{
         loadProgress();
         print("Data not found");
       }

     }catch(e){
       loadProgress();
       print(e);
     }
  }

  Future payBill(String canumber)async{
    try{
      loadProgress();
      Map<String,dynamic> jsonbody = {
      "operator": int.parse(mobile_postpaid_operator.id!),
      "canumber": int.parse(canumber),
      "amount": bill!.billAmount,
      "referenceid": generateReferenceId().toString(),
      "latitude": "27.2232",
      "longitude": "78.26535",
      "mode": "online",
      "bill_fetch": {
        "billAmount": bill!.billAmount,
        "billnetamount": bill!.billAmount,
        "billdate": "01Jan1990",
        "dueDate": bill!.dueDate,
        "acceptPayment": true,
        "acceptPartPay": false,
        "cellNumber": int.parse(canumber),
        "userName": bill!.userName
      }
      };
      var res = await networkApiService.postResponse(ApiEndPointsPaySprint().paybill, jsonbody);
      print(res);
      var model = Response.fromJson(res);
      if(model.status){
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: Color(0xFF3A3A3A),
              child: Container(
                height: 150,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          model.message!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.none,color:Color(0xFFFFAE00),
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          child: const Text(
                            "OK",
                            style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () async{
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ),
            )
        );
      }else{
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: Color(0xFF3A3A3A),
              child: Center(
                child: Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          "Bill not paid, Please try again",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color:Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          child: const Text(
                            "OK",
                            style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,

                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () async{
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        );
      }
      loadProgress();
    }catch(e){
      loadProgress();
      print(e);
    }
  }

  Future payBillLPG(String canumber)async{
    try{
      loadProgress();
      Map<String,dynamic> jsonbody = {
        "operator": int.parse(mobile_postpaid_operator.id!),
        "canumber": int.parse(canumber),
        "amount": bill!.billAmount,
        "ad1": 22,
        "ad2": 458,
        "ad3": 16336200,
        "referenceid": generateReferenceId().toString(),
        "latitude": "27.2232",
        "longitude": "78.26535",
      };
      var res = await networkApiService.postResponse(ApiEndPointsPaySprint().lpgPayBill, jsonbody);
      print(res);
      var model = Response.fromJson(res);
      if(model.status){
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: Color(0xFF3A3A3A),
              child: Container(
                  height: 150,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          model.message!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.none,color:Color(0xFFFFAE00),
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            child: const Text(
                              "OK",
                              style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFFFAE00),
                              shadowColor: const Color(0xFFFFAE00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onPressed: () async{
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            )
        );
      }else{
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: Color(0xFF3A3A3A),
              child: Center(
                child: Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Bill not paid, Please try again",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color:Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          child: const Text(
                            "OK",
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () async{
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        );
      }
      loadProgress();
    }catch(e){
      loadProgress();
      print(e);
    }
  }

  Future getFastTagOperator()async{
    try{
      loadProgress();
      Map<String,dynamic> jsonbody = {
        "mode": "online"
      };
      var res = await networkApiService.postResponse(ApiEndPointsPaySprint().fastTagOperatorList, jsonbody);

      print(res);
      var model = FasttagModel.fromJson(res);
      //fasttagDataList.clear();
      if(model.status) {

          setState((){
            fasttagDataList = model.flasttagDataList!;
            selectedfastTagOperator = fasttagDataList.first;
            print(fasttagDataList.length);
            //selectedfastTagOperator = fasttagDataList.first;
            //_showFasttag = true;
          });


      }
      loadProgress();
    }catch(e){
      loadProgress();
      print(e);
    }
  }

  Future getFastTagDetails(String custNumber)async{
    try{
      loadProgress();
      Map<String,dynamic> jsonbody = {
        "operator":int.parse(selectedfastTagOperator.id!),
        "canumber":custNumber
      };

      var res = await networkApiService.postResponse(ApiEndPointsPaySprint().fetchBillDetails, jsonbody);

      print(res);
      var model = FasttagDetail.fromJson(res);

      if(model.status!) {
        setState((){
          fasttagDueDate = model.dueDate!;
          fasttagAmount = model.amount!.toString();
          fasttagCustName = model.name!;
          fasttagdetailsVisibility = true;
          fasttagDetailModel = model;
        });

      }else{
        setState((){
          fasttagMessage = model.message;
        });


      }
      loadProgress();
    }catch(e){
      loadProgress();
      print(e);
    }
  }

  Future fastTagRecharge(String custNumber)async{
    try{
      loadProgress();
      String referenceid=generateReferenceId().toString();
      Map<String, dynamic> jsonbodynew = {
        "billAmount": fasttagDetailModel!.amount!,
        "billnetamount": fasttagDetailModel!.amount!,
        "dueDate": fasttagDetailModel!.dueDate,
        "maxBillAmount": 1000,
        "acceptPayment": true,
        "acceptPartPay": true,
        "cellNumber": custNumber,
        "userName": fasttagDetailModel!.name!
      };

      Map<String,dynamic> jsonbody = {
        "operator":int.parse(selectedfastTagOperator.id!),
        "canumber":custNumber,
        "amount":fasttagDetailModel!.amount!,
        "referenceid":referenceid,
        "latitude":99,
        "longitude":98,
        "bill_fetch": jsonbodynew
      };

      var res = await networkApiService.postResponse(ApiEndPointsPaySprint().fastTagRechage, jsonbody);

      print(res);
      var model = FastTagReponse.fromJson(res);

      if(model.status) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: Color(0xFF3A3A3A),
              child: Container(
                  height: 150,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          model.message!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.none,color:Color(0xFFFFAE00),
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            child: const Text(
                              "OK",
                              style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFFFAE00),
                              shadowColor: const Color(0xFFFFAE00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onPressed: () async{
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            )
        );

      }else{
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: Color(0xFF3A3A3A),
              child: Center(
                child: Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Bill not paid, Please try again",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color:Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          child: const Text(
                            "OK",
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () async{
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        );


      }
      loadProgress();
    }catch(e){
      loadProgress();
      print(e);
    }
  }

  Future<void> getreferal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState((){
      pointsss = sharedPreferences.getString('point')??"";
      print("lalalalala"+pointsss.toString());
    });

  }


}

