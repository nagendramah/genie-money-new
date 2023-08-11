import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/PaySprintCardLeadGenModel.dart';
import 'package:genie_money/Model/banksathiloginmodel.dart';
import 'package:genie_money/Model/customer_exist.dart' as customer;
import 'package:genie_money/Model/newuser_response.dart';
import 'package:genie_money/Model/search_comapny.dart' as searchcompany;
import 'package:genie_money/Model/occupation_response.dart' as occupation;
import 'package:genie_money/Model/newuser_response.dart' as createleadprofile;
import 'package:genie_money/Screens/terms_condition.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/data/remote/network/ApiHandler.dart';

import 'package:genie_money/utils/network.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/BrokerResponseModel.dart';

import '../data/remote/network/ApiEndPointsPaySprint.dart';
import '../data/remote/network/NetworkApiServiceNewVendor.dart';
import '../data/remote/network/NetworkApiServicePaySprint.dart';
import '../utils/constants.dart';

class CreditCardLeadGeneration extends StatefulWidget {
  final String bankname, leadtype, account;
  final String? mobilenumber, categoryid,customerid;
  const CreditCardLeadGeneration(
      {Key? key,
      required this.bankname,
        this.mobilenumber,
        this.categoryid,
        this.customerid,
      required this.leadtype,
      required this.account})
      : super(key: key);

  //CreditCardLeadGeneration( {Key? key,required this.bankname}) : super(key: key);

  @override
  State<CreditCardLeadGeneration> createState() =>
      _CreditCardLeadGenerationState();
}

var appPassword;
late List<String> brokers;

/*@override
void initState() {

  String gtwayname="geniemoney";
  bool leprechaunMode = false;

  ScgatewayFlutterPlugin.setConfigEnvironment(GatewayEnvironment.PRODUCTION, gtwayname, leprechaunMode, brokers);


  brokers = [
    "fivepaisa",
    "iifl",
    "kite",
    "kotak"

  ];
}*/

class _CreditCardLeadGenerationState extends State<CreditCardLeadGeneration> {
  TextEditingController _first_name = TextEditingController();
  TextEditingController _last_name = TextEditingController();
  // my changes TextEditingController _phone = TextEditingController();
  TextEditingController _monthly_salary = TextEditingController();
  TextEditingController _itr_amount = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pin_code_controller = TextEditingController();
  TextEditingController _Address = TextEditingController();
  TextEditingController _StateController = TextEditingController();
  TextEditingController _Landmark = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _companySearch = TextEditingController();

  String CustomerType = "Partner";
  var code;

  late String selected_type = "Occupation Type";
  String selected_category = "Category Type";
  String selected_gender_value = "Gender Type";
  bool isProgessBarVisible = false;

  bool is_mobile_linked_aadhar = true;

  /*changes
 List<String> business_type_list = [
    'Customer Type',
    'SALARIED',
    'SELF EMPLOYED',
    'BUSINESS'
  ];*/

  List<String> gender_type_list = ['Gender Type', 'Male', 'Female', 'Other'];

  List<String> occupation_type_list = [
    'Occupation Type',
    'Salaried',
    'Self Employed (Professional)',
    'Self-employed'
  ];

  List<String> category = ['Category Type', 'Individual', 'Non-Individual'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: Text(
          widget.bankname.toString(),
          style: TextStyle(
            color:kWhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: kWhite,
          onPressed: () {
            /*   Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home()));*/
            Navigator.of(context).pop();
          },
        ),
        /*IconButton(
          onPressed: () async {
            //Route route = MaterialPageRoute(builder: (context) => const EnterLocation());
            String? pincode = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EnterLocation()));
            if (pincode != null) {
              _pincodeController.text = pincode;
            } else {
              _pincodeController.clear();
            }
          },
          icon: const Icon(Icons.location_on),
          color: const Color(0xFFFFAE00),
        ),*/
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _first_name,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color:greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: navyBlueColor),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'First Name',
                    isDense: true,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _last_name,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color: greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: navyBlueColor),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Last Name',
                    isDense: true,
                  )),
            ),
            Container(
              width: 500,
              margin: EdgeInsets.all(10),
              child: Text(
                " My Mobile Is Linked With Aadhar",
                style: TextStyle(fontSize: 20, color: navyBlueColor),
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      value: "yes",
                      groupValue: CustomerType,
                      activeColor: navyBlueColor,
                      onChanged: (value) {
                        setState(() {
                          CustomerType = value.toString();

                          is_mobile_linked_aadhar = true;
                        });
                      },
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(color: navyBlueColor, fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "No",
                      groupValue: CustomerType,
                      activeColor: navyBlueColor,
                      onChanged: (value) {
                        setState(() {
                          is_mobile_linked_aadhar = true;

                          CustomerType = value.toString();
                        });
                      },
                    ),
                    Text(
                      'No',
                      style: TextStyle(color: navyBlueColor, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
            /* my changes Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _phone,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Color(0xFFFFAE00)),
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
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Phone no',
                    isDense: true,
                  )),
            ),*/
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _dateController,
                style: const TextStyle(color: greyColor),
                cursorColor: greyColor,
                //controller: _email_controller,
                decoration: InputDecoration(
                  counterStyle: TextStyle(color: navyBlueColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  // hintText: 'Email / Mobile No.',
                  labelText: 'Date of Birth',
                  isDense: true,
                ),
                onTap: () async {
                  final DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    _dateController.text =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                  }
                },
                /*     onSaved: (value) { future reference
                  customerData['dob'] = value;
                },*/
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _email,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color: greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.emailAddress,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: navyBlueColor),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Email',
                    isDense: true,
                  )),
            ),
            /*Container(
              margin: EdgeInsets.all(10),
              child: Container(
                child: DropdownButtonFormField<String>(
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
                  value: selected_type,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFFFFAE00),
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style:
                      const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                  onChanged: (String? data) {
                    setState(() {
                      selected_type = data ?? "Select Business Type";
                    });
                  },
                  items: occupation_type_list
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),*/
            //salary
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _monthly_salary,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color:greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: navyBlueColor),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Monthly Salary',
                    isDense: true,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _itr_amount,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color: greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: navyBlueColor),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Income Tax Return',
                    isDense: true,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Container(
                child: DropdownButtonFormField<String>(
                  dropdownColor: kWhite,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    isDense: true,
                  ),
                  value: selected_gender_value,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: navyBlueColor,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style:
                      const TextStyle(color: navyBlueColor, fontSize: 18),
                  onChanged: (String? data) {
                    setState(() {
                      selected_gender_value = data ?? "Select Business Type";
                    });
                  },
                  items: gender_type_list
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _Address,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color: greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: navyBlueColor),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Address',
                    isDense: true,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                cursorColor:greyColor,
                keyboardType: TextInputType.number,
                controller: _pin_code_controller,
                style: const TextStyle(color:greyColor),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  // hintText: 'Email / Mobile No.',
                  labelText: 'Pin Code',
                  isDense: true,
                ),
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    if (text.length == 6) {
                      NetworkCall networkCall = NetworkCall();
                      networkCall
                          .getStateAndCity(_pin_code_controller.text, context)
                          .then((value) => {
                                setState(() {
                                  _StateController.text =
                                      value.postOffice?.elementAt(0).state ??
                                          "";
                                  /* _DistrictController.text = value
                              .postOffice
                              ?.elementAt(0)
                              .district ??
                              "";
                          _TalukaController.text = value
                              .postOffice
                              ?.elementAt(0)
                              .taluk ??
                              "";*/
                                })
                              });
                    } else if (text.length > 6) {
                      _createToast("Please enter valid pin code");
                    }
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Container(
                child: DropdownButtonFormField<String>(
                  dropdownColor: kWhite,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    isDense: true,
                  ),
                  value: selected_category,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: navyBlueColor,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style:
                      const TextStyle(color: navyBlueColor, fontSize: 18),
                  onChanged: (String? data) {
                    setState(() {
                      selected_category = data ?? "Select Business Type";
                    });
                  },
                  items: category.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _Landmark,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color: greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: navyBlueColor),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Landmark',
                    isDense: true,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _StateController,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color:greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: navyBlueColor),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'State',
                    isDense: true,
                  )),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.all(10),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_first_name.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please enter name",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (_last_name.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please enter last name",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } /* my changes else if (_phone.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please enter phone no",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }*/ else if (_dateController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please enter date of birth",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (_email.text.isEmpty ||
                        !RegExp(r'\S+@\S+\.\S+').hasMatch(_email.text)) {
                      Fluttertoast.showToast(
                          msg: "Please enter a valid email",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }  else if (_monthly_salary.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please enter Monthly Salary",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }  else if (_itr_amount.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please enter ITR Amount",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }  else if (selected_gender_value == "Gender Type") {
                      Fluttertoast.showToast(
                          msg: "Please Select Gender",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }  else if (_Address.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please enter your address",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (_pin_code_controller.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please enter pincode",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }  else if (selected_category == "Category Type") {
                      Fluttertoast.showToast(
                          msg: "Please Select the Category",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      if (widget.leadtype == "credit card") {
                        CardLeaddata();
                        getBankSathi();
                        /*BackendCardLeaddata();*/
                      } else {
                        postdata();
                        getBankSathi();
                        createLeadProfile();
                        // Personalloandleaddata();

                        // BackendPersonalloandleaddata();
                      }

                      // getdata();
                      // //  ScgatewayFlutterPlugin.initGateway(authToken);
                      //
                      // ScgatewayFlutterPlugin.leadGen(_name.text, _email.text, _phone.text, _pincode.text);
                      // //   ScgatewayFlutterPlugin.leadGenWithStatus(_name.text, _email.text, _phone.text);
                      // getpass();

                      // Fluttertoast.showToast(
                      //     msg: "Success",
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.CENTER,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.green,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0);
                      //  if(_pincode.text.isNotEmpty)
                      //    {
                      //      if (widget.bankname.toString() == "5Pasia") {
                      //        _launchURL("https://www.5paisa.com/landing/open-demat-online");
                      //
                      //
                      //      }
                      //      else   if (widget.bankname.toString()  == "Kotak Securities") {
                      //        _launchURL("https://www.kotaksecurities.com/open-demat-account/");
                      //      }
                      //
                      //      else if (widget.bankname.toString()== "IIFL") {
                      //        _launchURL("https://www.indiainfoline.com/open-demat-account");
                      //      }
                      //      else {
                      // //       _launchURL("https://zerodha.com/open-account");
                      //        _launchURL("https://zerodha.com/open-account");
                      //
                      //
                      //      }
                      //    }
                    }
                    // _launchURL();

                    /* Navigator.pop(context);changes*/
                    //             Navigator.push(context, MaterialPageRoute(builder: context) => VendorPaymentPage));
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: kWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                    backgroundColor: navyBlueColor,
                  //  shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    var rng = new Random();
    code = rng.nextInt(900000) + 100000;
    postdata();
    getComapany();
    getOccupation();
    //getBankSathi();
  }

  _launchURL(String s) async {
    var url = s;
    if (url.isNotEmpty) {
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> getpass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appPassword = prefs.getString("leadgen") ?? "";
  }

  void _createToast(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  Future<void> getdata() async {
    Map<String, String> jsonbody = {
      "bank_name": widget.bankname.toString(),
      "name": _first_name.text.toString(),
      "email": _email.text.toString(),
      "phone": widget.mobilenumber!/*_phone.text.toString()*/,
      "pincode": _pin_code_controller.text.toString(),
      "user_id": Constants.userid.toString(),
    };
    var network = NewVendorApiService();
    String urls =
        "https://geniemoneyy.com/genie_money/index.php/saveDemateAccount";
    var res = await network.postresponse(urls, jsonbody);
    var model = BrokerResponseModel.fromJson(res);
    print("ApiResponse" + res.toString());
    String stat = model.status.toString();
    String msg = model.messages!.success.toString();
    if (stat.toString().contains("201")) {
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: navyBlueColor,
          textColor: Colors.white,
          fontSize: 16.0);

      if (widget.bankname.toString() == "5Pasia") {
        _launchURL("https://www.5paisa.com/landing/open-demat-online");
      } else if (widget.bankname.toString() == "Kotak Securities") {
        _launchURL("https://www.kotaksecurities.com/open-demat-account/");
      } else if (widget.bankname.toString() == "IIFL") {
        _launchURL("https://www.indiainfoline.com/open-demat-account");
      } else {
        //       _launchURL("https://zerodha.com/open-account");
        _launchURL("https://zerodha.com/open-account");
      }
    } else {
      Fluttertoast.showToast(
          msg: "Somthing Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: navyBlueColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> CardLeaddata() async {
    try {
      loadProgress();
      var network = NetworkApiServicePaySprint();

      Map<String, String> x = {
        "address": _Address.text,
        "pinCode": _pin_code_controller.text,
        "landMark": _Landmark.text
      };
      Map<String, String> jsonbody = {
        "current_address": x.toString(),
        "merchantcode": "A002",
        "refid": code.toString(),
        "name": _first_name.text,
        "mobile_no": widget.mobilenumber!/*_phone.text*/,
        "state": _StateController.text,
        "customer_type": selected_type.toString(),
        "email": _email.text,
        "is_mobile_linked_aadhar": is_mobile_linked_aadhar.toString(),
      };
      var res = await network.postResponse(
          ApiEndPointsPaySprint().CreditCardLead, jsonbody);
      print(res);
      print("credit card");

      Map<String, dynamic> jsonres = res;
      var model = PaySprintCardLeadGenModel.fromJson(jsonres);
      var ee = model.status.toString();
      if (ee != true) {
        Fluttertoast.showToast(
            msg: model.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: navyBlueColor,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        print("ssss" + ee);
        Fluttertoast.showToast(
            msg: "Transaction Successfully Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: navyBlueColor,
            textColor: Colors.white,
            fontSize: 16.0);
      }

      loadProgress();
    } catch (e) {
      loadProgress();
      print(e);
    }
  }

  loadProgress() {
    if (isProgessBarVisible == true) {
      setState(() {
        isProgessBarVisible = false;
      });
    } else {
      setState(() {
        isProgessBarVisible = true;
      });
    }
  }

  /*Future<void> Personalloandleaddata() async {
    try{
      loadProgress();
      var network =  NetworkApiServicePaySprint();

      Map<String, String> x =  {
        "address": _Address.text,
        "pinCode": _pincode.text,
        "landMark": _Landmark.text
      };
      Map<String,String> jsonbody = {
        "current_address": x.toString(),
        "merchantcode": "A002",
        "refid": code.toString(),
        "name": _name.text,
        "mobile_no": _phone.text,
        "state": _state.text,
        "customer_type": selected_type,
        "email": _email.text,
        "is_mobile_linked_aadhar": is_mobile_linked_aadhar.toString(),


      };
      var res = await network.postResponse(ApiEndPointsPaySprint().personalloan, jsonbody);
      print(res);
      print("Personal loan");
      Map<String, dynamic> jsonres = res;
      // var model = BeneficiaryListModel.fromJson(jsonres);
      // if(model.status){
      //   setState(() {
      //     beneficiaryList = model.data;
      //   });
      // }
      // setState(() {
      //   beneficiaVisibility = true;
      // });
      loadProgress();
    }catch(e){
      loadProgress();
      print(e);
    }
  }*/

  /*Future<void> BackendCardLeaddata() async {
    Map<String, String> jsonbody = {
      "service_type":"tradition_credit_card",
      "type":Constants.type,

      "bank_name":widget.bankname.toString(),
      "name":_name.text,
      "phone":_phone.text,
      "customer_type":selected_type,
      "address":_Address.text,
      "pincode":_pincode.text,
      "landmark":_Landmark.text,
      "state":_state.text,
      "link_adhar":_state.text,
      // "user_id:": user.toString(),

    };

    var network = NewVendorApiService();

    String urls =
        "http://165.22.219.135/genie_money/index.php/loanservices";
    var res = await network.postresponse(urls, jsonbody);
    var model = LeadGenModel.fromJson(res);
    String stat = model.status.toString();

    if (model.status == 201) {
      Fluttertoast.showToast(
          msg: "Transaction Successfully Added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.pop(context);

    }
    else {
      Fluttertoast.showToast(
          msg: "Somthing Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    print("" + res!.toString());
    print("vvvvvvvvvvvvv" + Constants.userid.toString());

  }*/

  /* Future<void> BackendPersonalloandleaddata() async {
    Map<String, String> jsonbody = {
      "service_type":"tradition_personal_loan",
      "type":Constants.type,

      "bank_name":widget.bankname.toString(),
      "name":_name.text,
      "phone":_phone.text,
      "customer_type":selected_type,
      "address":_Address.text,
      "pincode":_pincode.text,
      "landmark":_Landmark.text,
      "state":_state.text,
      "link_adhar":_state.text,
      // "user_id:": user.toString(),

    };

    var network = NewVendorApiService();

    String urls =
        "http://165.22.219.135/genie_money/index.php/loanservices";
    var res = await network.postresponse(urls, jsonbody);
    var model = LeadGenModel.fromJson(res);
    String stat = model.status.toString();

    if (model.status == 201) {
      Fluttertoast.showToast(
          msg: "Transaction Successfully Added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);
    }
    else {
      Fluttertoast.showToast(
          msg: "Somthing Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    print("" + res!.toString());
    print("vvvvvvvvvvvvv" + Constants.userid.toString());

  }*/
//krishna work

  String companyname = "genie soft";
  int? companyId = 0;
  Future<void> getComapany() async {
    List<searchcompany.Data> data = <searchcompany.Data>[];
    try {
      final url =
          'https://leadapi.banksathi.com/api/b2b/companies?searchKey=$companyname';

      searchcompany.SearchResponse response =
          await ApiHandler.shared.getSearch(url);
      data = response.data;
      for (int i = 0; i < data.length; i++) {
        companyId = data[i].id;
      }
    } catch (e) {
      ApiHandler.shared.showErrorDialog(context, 'Invalid request');
    }
  }

  /*var customerid = "";
  Future<void> getCustomerID() async {
    customer.Data data = customer.Data();
    try {
      final url =
          'https://leadapi.banksathi.com/api/b2b/checkCustomerExists';
      Map<String, dynamic> body = {
        "pan": "AYRPJ9427L",
        "category_id": "13",
        "mobile_no": "9855667789",
        "is_user_validated": "1",
        "is_pan_validated": "1"
      };
      final response = await ApiHandler.shared.getCustomerId();
      data = response.data;
      customerid = data.profileDetails!.customerId;
    } catch (e) {
      _showErrorDialog(context, "Invalid request");
    }
  }*/

  Future<void> getOccupation() async {
    try {
      final String url = 'https://leadapi.banksathi.com/api/b2b/occupation';
      final response = await ApiHandler.shared.getOccupation(url);
      List<occupation.Data> data = response.data;
    } catch (e) {
      ApiHandler.shared.showErrorDialog(context, "Invalid request");
    }
  }

  String? messagefromServer;
  Future<void> createLeadProfile() async {
    try {
      final url = 'https://leadapi.banksathi.com/api/b2b/createLeadProfile';

      Map<String, dynamic> body = {
        "first_name": _first_name.text,
        "last_name": _last_name.text,
        "email": _email.text,
        "dob": _dateController.text,
        "company": companyId.toString(),
        "occupation": "1",
        "monthly_salary": _monthly_salary.text,
        "itr_amount": _itr_amount.text,
        "gender": selected_gender_value,
        "pincode": "27304",
        "address": _Address.text,
        "category": selected_category,
        "category_id": widget.categoryid,
        "customer_id": widget.customerid,
        "mobile_no": widget.mobilenumber/*_phone.text*/
      };
      /*  NewUserRequest request = NewUserRequest();
    request.firstName = _first_name.text;
    request.lastName = _last_name.text;
    request.mobileNo = _phone.text;
    request.email = _email.text;
    request.dob = _dateController.text;
    request.company = "216177";
    request.occupation = '1';
    request.monthlySalary = _monthly_salary.text;
    request.itrAmount = _itr_amount.text;
    request.gender = selected_gender_value;
    request.pincode = _pin_code_controller.text;
    request.address = _Address.text;
    request.category = selected_category;
    request.categoryId = "1";
    request.customerId = "aUczK1BLZm1lRmtSNEZ6SGJTaHl0QT09";*/
      final response = await ApiHandler.shared.postCreateLead(url, body);
      messagefromServer = response.message;
      createleadprofile.Data data = response.data;
      if (response.status == true) {
        Fluttertoast.showToast(
            msg: messagefromServer!,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: navyBlueColor,
            textColor: Colors.white,
            fontSize: 16.0);
        if(messagefromServer == "Customer profile has been updated." || messagefromServer == "Customer profile has been created."){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TermAndCondition(customerid: widget.customerid,categoryid: widget.categoryid,mobilenumber: widget.mobilenumber,leadtype: widget.leadtype,account: widget.account,bankname: widget.bankname,)));
        }
      }
    }catch(e){
     ApiHandler.shared.showErrorDialog(context, "Url is not available");
    }
  }



  Future<void> postdata() async {
    final url = Uri.parse(
        "https://geniemoneyy.com/genie_money/index.php/Traditional_Bank");
    final response = await http.post(url, body: {
      "id": Constants.userid,
      "name": _first_name.text,
      "linked_adhar": CustomerType,
      'phone_no': widget.mobilenumber/* _phone.text*/,
      "email": _email.text,
      'customer_type': selected_type,
      "address": _Address.text,
      'pincode': _pin_code_controller.text,
      "landmark": _Landmark.text,
      "bank_name": widget.bankname.toString(),
      "type": widget.account.toString(),
      "state": _StateController.text,
    });
    print(response.body);
    if (response.statusCode == 201) {
      setState(() {});
      print("object");
      print("jankiii lolllllllgdhgfghdfgfdgfgfd");
    } else {
      print('something worng');
      print("janki javoooooooooooooooooooo");
    }
  }

  Future<void> getBankSathi() async {
    String url = "https://leadapi.banksathi.com/api/b2b/allProductCategory";

    Client client = Client();

    final baseHeader = {
      "x-api-key": "QkN5cGZFRWl4S1Mrb0g5V0dyWFlKNGJseW1sd3haTWhZUWVqOUxlek5qVT0",
      "IV": "YUp4OVJQam13Q0NnbUNTSFZPT0ZFUT09"
    };

    final response = await client.get(Uri.parse(url), headers: baseHeader);
    print(response);
    print(response.body);
    var model = demomodelFromJson(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Data Submitted Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: navyBlueColor,
          textColor: Colors.white,
          fontSize: 16.0);
//while
      /*setState(() {
        _first_name.clear();
        _phone.clear();
        _email.clear();
        _pin_code_controller.clear();
        _Landmark.clear();
        _StateController.clear();
        _Address.clear();
        CustomerType = "Partner";
        selected_type = "Customer Type";
      });*/
    } else {
      Fluttertoast.showToast(
          msg: "Data Store not Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: navyBlueColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }

  /*Future<void> getBankSathi() async {
    var headers = {
      'x-api-key': ' U042VVRFTjhESnZVeFVlbjgrRVlGZ3BnWTJ2Nnk3UlZPSkE4ckZ3UTZzMD0=',
      'iv': ' OStGaWg3ZnpFV3lvSERZRHo2SnpLUT09'
    };
    var request = http.Request('GET', Uri.parse('https://leadapi.banksathi.com/api/b2b/allProductCategory'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

    */ /* var headers = {
      'x-api-key': ' U042VVRFTjhESnZVeFVlbjgrRVlGZ3BnWTJ2Nnk3UlZPSkE4ckZ3UTZzMD0=',
      'iv': ' OStGaWg3ZnpFV3lvSERZRHo2SnpLUT09'
    };
    var url = Uri.parse('https://leadapi.banksathi.com/api/b2b/allProductCategory');
    var response = await http.get(url,headers:headers );
   // var model = banksathiloginModelToJson(response.body);
    if(response.statusCode==200){
      print("hello bank sathiii ");
      setState(() {
      });
    }
    else{
      print("errror bank sathiii" );
    }*/ /*
  }*/
}
