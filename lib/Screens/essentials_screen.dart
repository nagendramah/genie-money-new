// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:genie_money/Screens/payment_form.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/service_list_model.dart';
import 'package:genie_money/Screens/enter_location_screen.dart';
import 'package:genie_money/Screens/sub_catagories_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/NewVendorsModel.dart';
import '../Model/dmt/BankListModel.dart';
import '../data/remote/network/NetworkApiServiceNewVendor.dart';
import '../utils/constants.dart';
import '../utils/network.dart';

class EssentialsScreen extends StatefulWidget {
  const EssentialsScreen({Key? key}) : super(key: key);

  @override
  _EssentialsScreenState createState() => _EssentialsScreenState();
/*
  void showRegistrationDailog() {Fluttertoast.showToast(msg: "llllllll");
  }*/
}

class _EssentialsScreenState extends State<EssentialsScreen> {
  final ImagePicker _picker = ImagePicker();
  final ImagePicker _picker2 = ImagePicker();
  final ImagePicker _picker3 = ImagePicker();
  final ImagePicker _picker4 = ImagePicker();
  File? image1;
  File? image2;
  File? image3;
  File? image4;
  //var ess;

  late List<ServiceModel> servicesList;
  List<Category> VendorCatList = [];
  Category? selected_type;

  late String selected_typee = "Proprietorship";
  List<BankModel>? bankList = [];
  List<BankModel>? tempBankList = [];
  late BankModel selectedBank;
  double height = 0.0;

  List<String> business_type_list = [
    'Proprietorship',
    'Partnership',
    'Private Limited',
    'Others'
  ];

  String type = "";
  bool isLoading = false;
  String? CatId;
  int stopnum = 25;
  String postAdd = "Yes";
  String BankAdd = "No";
  bool agree = true;

  String selectedBankNamep = "Select Bank";

  late String user;
  
  var newValue;
  bool hojare() {
    var x;
    setState(() {
      isLoading = true;
      x = isLoading;
    });
    return x;
  }

  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _MobilenoController = TextEditingController();
  TextEditingController _CategoryController = TextEditingController();
  TextEditingController _Address1Controller = TextEditingController();
  TextEditingController _Address2Controller = TextEditingController();
  TextEditingController _TalukaController = TextEditingController();
  TextEditingController _DistrictController = TextEditingController();
  TextEditingController _StateController = TextEditingController();
  TextEditingController _pin_code_controller = TextEditingController();
  TextEditingController _NamePinCodeController = TextEditingController();
  TextEditingController _OthersController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();
  TextEditingController _refermerchantby = TextEditingController();
  TextEditingController _MerchantnameController = TextEditingController();
  TextEditingController _owner = TextEditingController();
  TextEditingController _GsT = TextEditingController();
  TextEditingController _Branch = TextEditingController();
  TextEditingController _AccountNumber = TextEditingController();
  TextEditingController _IFSCode = TextEditingController();
  TextEditingController _Password = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController _aadharcard = TextEditingController();
   TextEditingController _pancardnumber = TextEditingController();


 GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  bool isEmailValid(String email) {
  // Regular expression for email validation
  final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  return emailRegex.hasMatch(email);
}

bool isValidMobileNumber(String mobileNumber) {
  final RegExp mobileNumberRegExp = RegExp(r'^[0-9]{10}$');
  return mobileNumberRegExp.hasMatch(mobileNumber);
}


  var _ads_1_file;
  var _ads_2_file;
  var _ads_3_file;
  var _ads_4_file;
  var _ads_5_file;
  var panfile;
  var panfile1;
  var adharfile;
  var adharfile1;
  var drivingfile;
  var drivingfile1;
  var billfile;
  var billfile1;
  var tradefile;
  var tradefile1;
  var chequefile;
  var chequefile1;
  var gstfile;
  var gstfile1;
  bool showSpinner = false;

  late String CAtname;
  BankModel? selectedBankModelp;

  bool isVisible = false;
  bool isVisiblee = false;
  late String cid;

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      showRegistrationDailog();
      
      t.cancel();
        
      if (cid.isEmpty == "Customer") {

        print("rohandata");
        
        showRegistrationDailog();
        //  t.cancel();
      }
    });
   
    cid = Constants.category.toString();

    if (cid.isEmpty && type == "Merchant") {
        
      print("vvvvvvvvvvvv" + Constants.phone);
    }
  
    getBankList();
    getdata();
    getUserType();
    getuserid();
    super.initState();

    //Future.delayed(Duration.zero, () => showRegistrationDailog());
  }

  @override
  setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:kWhite,
        appBar: AppBar(
          backgroundColor: navyBlueColor,
          title: const Text(
            "Merchant Services",
            style: TextStyle(
              color:kWhite,
              //color: Color(0xFFFFAE00),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color:kWhite,
            onPressed: () {
              /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home()));*/
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            Visibility(
              visible: type == "Customer" || type == "Merchant"
                  ? isVisiblee = false
                  : isVisiblee = true,
              child: IconButton(
                onPressed: () async {
                  //Route route = MaterialPageRoute(builder: (context) => const EnterLocation());
                  setState(() {
                    showRegistrationDailog();
                  });
                  /*    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Janki()));*/
                },
                icon: Image.asset(
                  "images/plusss.png",
                  color: kWhite,
                  height: 21,
                  width: 21,
                ),
              ),
            ),
            IconButton(
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
              color: kWhite,
            ),
            /*IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search),
              color: const Color(0xFFFFAE00),
            ),*/
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child:
              TextFormField(
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color:greyColor),
                  cursorColor:greyColor,
                  keyboardType: TextInputType.emailAddress,
                  controller: _pincodeController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: greyColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:greyColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: greyColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color:navyBlueColor),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Pincode',
                    isDense: true,
                  )),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        if (cid.isEmpty && type == "Merchant") {
                          _MobilenoController.text = Constants.phone;
                          _emailController.text = Constants.email;
                // _alertDialog1();
                  _showAlertDialog();
                         // showRegistrationDailog();
                        }
                        // else if(type == "Partner"||type == "Associate Partner")
                        else {
                          
                          String Categoryid =
                              VendorCatList[index].categoryId.toString();
                          String Catname =
                              VendorCatList[index].categoryName.toString();
if (cid.isEmpty) {
            // Show alert message when not logged in
          _showAlertDialog();
          }else{
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubCatagoriesScreen(
                                      title: Catname,
                                      categoryId: Categoryid,
                                      pincode:
                                          _pincodeController.text.toString())));
          }
                        }

                        /* if (VendorCatList[index].categoryName.toString() ==
                            "AC/ Appliance Repair") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubCatagoriesScreen(
                                      VendorCatList[index]
                                          .categoryName
                                          .toString())));
                        }
                        else if (VendorCatList[index]
                                .categoryName
                                .toString() ==
                            "General Store") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubSubCategoriesScreen(
                                      VendorCatList[index]
                                          .categoryName
                                          .toString())));

                        }


                        else {
                          _alertDialog();
                        }*/
                      },
                      child: Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                           // border:
                               // Border.all(color: Color(0xFFFFAE00), width: 2),
                            color: navyBlueColor),
                        // color: const Color(0xFF3A3A3A),
                        /*    shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),

                          ),*/
                        child: Container(
                          /*  margin: const EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),*/
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 17),
                                // margin: const EdgeInsets.only(
                                //     left: 0.0, top: 10.0, bottom: 10.0),
                                child: Image.network(
                                  VendorCatList[index].categoryImg.toString(),
                                  color: kWhite,
                                  width: 35.0,
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                child: Text(
/*
                                  VendorCatList[index]
                                      .categoryName
                                      .toString(),*/
                                  ((VendorCatList[index].categoryName == null
                                          ? ""
                                          : VendorCatList![index]
                                              .categoryName!
                                              .toString())
                                      .replaceAll(" ", '\n')),
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 12.0,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: VendorCatList == null ? 0 : VendorCatList.length,
                  //      itemCount:  VendorCatList == null ? 0 : (VendorCatList.length > 33 ? 33 : VendorCatList.length),

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _alertDialog() {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          contentText: 'To be Displayed Soon',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

Future<void> _showAlertDialog() async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
    
        title: Text('To be Displayed Soon!',style: TextStyle(color: navyBlueColor)),
            backgroundColor: kWhite,
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(
          //   color: Colors.orange, // Set the border color here
          //   width: 2.0, // Set the border width here
          // ),
        ),
        actions: <Widget>[
         
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:navyBlueColor,
            ),
            child: TextButton(
              child: Text('Confirm', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop(false); // Close the dialog and return false
              },
            ),
          ),
        ],
      );
    },
  );
}
  Future getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = (prefs.get("type") ?? "Customer").toString();
    });
  }

// Validation logic

String? _validateMerchantName(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter the Merchant Name";
  }
  return null;
}
String? _validateOwnerPromoter(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter the Owner / Promoter Name";
  }
  return null;
}
String? _validateAddress1(String? value) {
  if (value == null || value.isEmpty) {
    return "Address1";
  }
  return null;
}
String? _validateAddress2(String? value) {
  if (value == null || value.isEmpty) {
    return "Address2";
  }
  return null;
}
String? _validatePinCode(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a pin code';
  }
  if (value.length != 6) {
    return 'Pin code should be 6 digits';
  }
  return null; // Input is valid
}
String? _validateTaluka(String? value) {
  if (value == null || value.isEmpty) {
    return "Address1";
  }
  return null;
}
String? _validateState(String? value) {
  if (value == null || value.isEmpty) {
    return "Address1";
  }
  return null;
}
String? _validateEmailID(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter an email address";
  }

  // Regular expression for email validation
  final RegExp emailRegExp = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})$',
  );

  if (!emailRegExp.hasMatch(value)) {
    return "Please enter a valid email address";
  }

  return null; // Return null if the email is valid
}

String? _validateAadhar(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter an Aadhar number";
  }

  // Regular expression for Aadhar number validation
  final RegExp aadharRegExp = RegExp(
    r'^\d{12}$',
  );

  if (!aadharRegExp.hasMatch(value)) {
    return "Please enter a valid 12-digit Aadhar number";
  }

  return null; // Return null if the Aadhar number is valid
}


String? _validateMobileNO(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter a mobile number";
  }

  // Regular expression for mobile number validation
  final RegExp mobileRegExp = RegExp(r'^\d{10}$');

  if (!mobileRegExp.hasMatch(value)) {
    return "Please enter a valid 10-digit mobile number";
  }

  return null; // Return null if the mobile number is valid
}
String? _validatePanCard(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter a PAN card number";
  }

  // Regular expression for PAN card validation
  final RegExp panCardRegExp = RegExp(
    r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$',
  );

  if (!panCardRegExp.hasMatch(value)) {
    return "Please enter a valid PAN card number";
  }

  return null; // Return null if the PAN card number is valid
}


String? _validateGSTNO(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter a GST number";
  }

  // Regular expression for GST number validation
  final RegExp gstRegExp = RegExp(
    r'^\d{2}[A-Z]{5}\d{4}[A-Z]{1}\d[Z]{1}[A-Z\d]{1}$',
  );

  if (!gstRegExp.hasMatch(value)) {
    return "Please enter a valid GST number";
  }

  return null; // Return null if the GST number is valid
}


String? _validateRemarks(String? value) {
  if (value == null || value.isEmpty) {
    return "Address1";
  }
  return null;
}
String? _validateReferralCode(String? value) {
  if (value == null || value.isEmpty) {
    return "Address1";
  }
  return null;
}


  showRegistrationDailog() async {
    bool otpVisibility = false;
    bool isCheck = true;
    FocusNode otpFocusNode = FocusNode();
    List<String> category = ["category"];
    Category? selected_type;

    print("type" + type);
    Dialog alterDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor:kWhite,
      child: StatefulBuilder(
        builder: (context, setState) {
          var selectedCategory;
          return WillPopScope(
            onWillPop: () async {
      Navigator.pop(context); 
       Navigator.pop(context);
      
      return false; // Return false to prevent the dialog from closing automatically
    },
            child: Container(
              //height: 240,
            
              child: Form(
                 key: _formKey,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                "Register New Merchant",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: navyBlueColor,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.clear, color: navyBlueColor),
                            onPressed: () {
                              Navigator.pop(context);
                             // Navigator.pop(context);
                             // Navigator.pop(context);
                        
                            },
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _MerchantnameController,
                            style: const TextStyle(color:greyColor),
                            cursorColor: greyColor,
                            keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color:navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Merchant Name',
                              isDense: true,
                            ),
                            validator: _validateMerchantName,
                            ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButtonFormField<String>(
                          dropdownColor:kWhite,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:greyColor),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:greyColor),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:greyColor),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color:greyColor),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            isDense: true,
                          ),
                            hint: Text(
                              "Select Business Type",
                              style: TextStyle(color:navyBlueColor),
                            ),
                           value: selectedCategory,
                          isDense: true,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: navyBlueColor,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: navyBlueColor, fontSize: 18),
                          onChanged: (String? ff) {
                            setState(() {
                             // selected_typee = (ff ?? "Proprietorship");
                              selectedCategory = newValue;
                            });
                          },
                          items: business_type_list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(

                              
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _NamePinCodeController,
                            style: const TextStyle(color: greyColor),
                            cursorColor:greyColor,
                            keyboardType: TextInputType.emailAddress,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color: navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Owner / Promoter Name',
                              isDense: true,
                            ),
                               validator: _validateOwnerPromoter,
                            
                            ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _Address1Controller,
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color: greyColor),
                            cursorColor:greyColor,
                            keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color:navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Address 1',
                              isDense: true,
                            ),
                            validator: _validateAddress1,
                            ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _Address2Controller,
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color: greyColor),
                            cursorColor: greyColor,
                            keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color: navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Address 2',
                              isDense: true,
                            ),
                            validator: _validateAddress2,
                            ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          cursorColor:greyColor,
                          keyboardType: TextInputType.number,
                          controller: _pin_code_controller,
                          style: const TextStyle(color:greyColor),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color:greyColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color:greyColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color:greyColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color:greyColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: const TextStyle(color:navyBlueColor),
                            // hintText: 'Email / Mobile No.',
                            labelText: 'Pin Code',
                            isDense: true,


                          ),
                      
                          // onChanged: (text) {
                          //   if (text.isNotEmpty) {
                          //     if (text.length == 6) {
                          //       NetworkCall networkCall = NetworkCall();
                          //       networkCall
                          //           .getStateAndCity(
                          //               _pin_code_controller.text, context)
                          //           .then((value) => {
                          //                 setState(() {
                          //                   _StateController.text = value.postOffice
                          //                           ?.elementAt(0)
                          //                           .state ??
                          //                       "";
                          //                   _DistrictController.text = value
                          //                           .postOffice
                          //                           ?.elementAt(0)
                          //                           .district ??
                          //                       "";
                          //                   _TalukaController.text = value
                          //                           .postOffice
                          //                           ?.elementAt(0)
                          //                           .taluk ??
                          //                       "";
                          //                 })
                          //               });
                          //     } else if (text.length > 6) {
                          //       _createToast("Please enter valid pin code");
                          //     }
                          //   }
                          // },
                         validator: (value) {
        if (value!.isEmpty) {
          return 'Please fill the pin code';
        } else if (value.length != 6) {
          return 'Please enter a valid 6-digit pin code';
        }
        return null; // Return null if the input is valid
      },
                           // validator: _validatePinCode,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _TalukaController,
                        
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color:greyColor),
                            cursorColor:greyColor,
                            keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color: navyBlueColor
                              ),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Taluka/Teshil',
                              isDense: true,
                            ),
                             validator: _validateTaluka,
                            ),
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
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color:navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'State',
                              isDense: true,
                            ),
                             validator: _validateState,
                            ),
                      ),
                        /*                  Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _DistrictController,
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
                            cursorColor: const Color(0xFFFFAE00),
                            keyboardType: TextInputType.text,
                            //controller: _email_controller,
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
                              labelText: 'District',
                              isDense: true,
                            )),
                      )*/
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _emailController,
                            // readOnly:
                            //     cid.isEmpty && type == "Merchant" ? true : false,
                            style: const TextStyle(color:greyColor),
                            cursorColor: greyColor,
                            keyboardType: TextInputType.emailAddress,
                            // keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color: navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Email ID',
                              isDense: true,
                            ),
                             validator: _validateEmailID,
                            ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _MobilenoController,
                            // readOnly:
                            //     cid.isEmpty && type == "Merchant" ? true : false,
                        
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color:greyColor),
                            cursorColor:greyColor,
                            keyboardType: TextInputType.phone,
                            // keyboardType: TextInputType.text,
                            maxLength: 10,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(color: greyColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color:navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Mobile Number',
                              isDense: true,
                            ),
                             validator: _validateMobileNO,
                            ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _pancardnumber,
                            // readOnly:
                            //     cid.isEmpty && type == "Merchant" ? true : false,
                            style: const TextStyle(color: greyColor),
                            cursorColor:greyColor,
                            keyboardType: TextInputType.emailAddress,
                            // keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color:navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Pan Card number',
                              isDense: true,
                            ),
                              validator: _validatePanCard,
                            ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _aadharcard,
                            // readOnly:
                            //     cid.isEmpty && type == "Merchant" ? true : false,
                            style: const TextStyle(color: greyColor),
                            cursorColor:greyColor,
                            keyboardType: TextInputType.number,
                            // keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color:navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Aadhar Card Number',
                              isDense: true,
                            ),
                              validator: _validateAadhar,
                            ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _GsT,
                            // readOnly:
                            //     cid.isEmpty && type == "Merchant" ? true : false,
                            style: const TextStyle(color:greyColor),
                            cursorColor: greyColor,
                            keyboardType: TextInputType.emailAddress,
                            // keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color:navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'GST Number',
                              isDense: true,
                            ),
                             validator: _validateGSTNO,
                            ),
                      ),
                      Visibility(
                        visible: cid.isEmpty && type == "Merchant"
                            ? isVisible = false
                            : isVisible = true,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                              controller: _Password,
                              //controller: _email_mobile_controller,
                              style: const TextStyle(color: greyColor),
                              cursorColor: greyColor,
                              keyboardType: TextInputType.text,
                              //controller: _email_controller,
                              decoration: InputDecoration(
                                counterStyle: TextStyle(color: greyColor),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle:
                                    const TextStyle(color: navyBlueColor),
                                // hintText: 'Email / Mobile No.',
                                labelText: 'Password',
                                isDense: true,
                              )),
                        ),
                      ),
                        /*
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _MobilenoController,
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
                            cursorColor: const Color(0xFFFFAE00),
                            keyboardType: TextInputType.text,
                            maxLength: 10,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(color: Color(0xFFFFAE00)),
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
                              labelText: 'Confirm Password',
                              isDense: true,
                            )),
                      ),
                        */
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color:greyColor)),
                        margin: EdgeInsets.all(10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text(
                              "Select Category",
                              style: TextStyle(color: navyBlueColor),
                            ),
                            value: selected_type,
                            isDense: true,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: navyBlueColor,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                color: navyBlueColor, fontSize: 18),
                            onChanged: (data) {
                              setState(() {
                                selected_type = data as Category;
                                CatId = selected_type?.categoryId.toString();
                                //CAtname = selected_type?.categoryName.toString();
                                //       CatId==26?isVisible=true:isVisible=false;
                                if (CatId == "34") {
                                  isVisible = true;
                                } else {
                                  isVisible = false;
                                }
                              });
                            },
                            dropdownColor: kWhite,
                            items: VendorCatList.map<DropdownMenuItem<Category>>(
                                (Category value) {
                              CAtname = value.categoryName.toString();
                              print("|" + CAtname);
                              return DropdownMenuItem<Category>(
                                value: value,
                                child: Text(value.categoryName.toString()),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: selected_typee.toString() == "Others"
                            ? isVisible = true
                            : isVisible = false,
                        
                        //     Ven     categoryName.toString()=="Other"? isVisible = false:isVisible = true;
                        
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                              controller: _OthersController,
                              //controller: _email_mobile_controller,
                              style: const TextStyle(color: greyColor),
                              cursorColor:greyColor,
                              keyboardType: TextInputType.text,
                              //controller: _email_controller,
                              decoration: InputDecoration(
                                counterStyle: TextStyle(color:greyColor),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle:
                                    const TextStyle(color: navyBlueColor),
                                // hintText: 'Email / Mobile No.',
                                labelText: 'Others',
                                isDense: true,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          'Wish to Upload Bussiness Images ?',
                          style: TextStyle(color: navyBlueColor),
                        ),
                      ),
                      Container(
                        child: Theme(
                          data: ThemeData(
                           unselectedWidgetColor: greyColor, 
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: "Yes",
                                    groupValue: postAdd,
                                    activeColor: navyBlueColor,
                                    onChanged: (value) {
                                      setState(() {
                                        postAdd = value.toString();
                                      });
                                    },
                                  ),
                                  Text(
                                    'Yes',
                                    style: TextStyle(color: navyBlueColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    
                                    value: "No",
                                    groupValue: postAdd,
                                    activeColor:navyBlueColor,
                                    onChanged: (value) {
                                      setState(() {
                                        postAdd = value.toString();
                                      });
                                    },
                                  ),
                                  Text(
                                    'No',
                                    style: TextStyle(color: navyBlueColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                     
                      //52uploadf(context, setState, "Upload Image"),
                      if (postAdd == "Yes") ...[
                       uploadf(context, setState, "Upload Image"), 
                      Visibility(
                        visible: postAdd == "Yes",
                        child: Container(
                        
                          margin: EdgeInsets.only(left: 40),
                          child: Text(
                            '(Can Upload Upto 5 Images Only)',
                            style: TextStyle(color: navyBlueColor),
                          ),
                        ),
                      ),
                      ],
                      
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ads_1_Column(context, setState),
                            ads_2_Column(context, setState),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ads_3_Column(context, setState),
                            ads_4_Column(context, setState),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ads_5_Column(context, setState),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          'Please Upload Images of the following documents in JPEG / PNG / PDF format.',
                          style: TextStyle(color:navyBlueColor),
                        ),
                      ),
                      uploadf(context, setState, "PAN CARD"),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            pan_1_Column(context, setState),
                            pan_2_Column(context, setState),
                            //ads_2_Column(context, setState),
                          ],
                        ),
                      ),
                      uploadf(context, setState, "Aadhar Card"),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            adhar_1_Column(context, setState),
                            adhar_2_Column(context, setState),
                          ],
                        ),
                      ),
                      uploadf(context, setState, "Driving Licence / Voters Id"),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            driving_1_Column(context, setState),
                            driving_2_Column(context, setState),
                          ],
                        ),
                      ),
                      uploadf(context, setState, "Utility Bill"),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            bill_1_Column(context, setState),
                            bill_2_Column(context, setState),
                          ],
                        ),
                      ),
                      uploadf(context, setState, "Trade Licence / Udyog Aadhar"),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            trade_1_Column(context, setState),
                            trade_2_Column(context, setState),
                          ],
                        ),
                      ),
                      uploadf(context, setState, "Cancelled Cheque"),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            cheque_1_Column(context, setState),
                            cheque_2_Column(context, setState),
                          ],
                        ),
                      ),
                      uploadf(context, setState, "GST Certificate"),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            gst_1_Column(context, setState),
                            gst_2_Column(context, setState),
                          ],
                        ),
                      ),
                  
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _remarkController,
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color: greyColor),
                            cursorColor:  greyColor,
                            keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(color: greyColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:  greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:  greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:  greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color:navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Remarks',
                              isDense: true,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                            controller: _refermerchantby,
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color: greyColor),
                            cursorColor:  greyColor,
                            keyboardType: TextInputType.text,
                            maxLength: 6,
                        
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(color: greyColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:  greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:  greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:  greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color:  greyColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color: navyBlueColor),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Referred by (Referral Code)',
                              isDense: true,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          'Bank Details (Optional)',
                          style: TextStyle(color: navyBlueColor),
                        ),
                      ),
                      Container(
                        child:Theme(
                          data: ThemeData(
                          unselectedWidgetColor:greyColor, 
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: "Yes",
                                    groupValue: BankAdd,
                                    activeColor: navyBlueColor,
                                    onChanged: (value) {
                                      setState(() {
                                        BankAdd = value.toString();
                                      });
                                    },
                                  ),
                                  Text(
                                    'Yes',
                                    style: TextStyle(color: navyBlueColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "No",
                                    groupValue: BankAdd,
                                    activeColor: navyBlueColor,
                                    onChanged: (value) {
                                      setState(() {
                                        BankAdd = value.toString();
                                      });
                                    },
                                  ),
                                  Text(
                                    'No',
                                    style: TextStyle(color: navyBlueColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      getBankListDropDown(),
                      Visibility(
                        visible: BankAdd == "Yes" ? true : false,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                              controller: _Branch,
                              //controller: _email_mobile_controller,
                              style: const TextStyle(color:  greyColor),
                              cursorColor:  greyColor,
                              keyboardType: TextInputType.text,
                              //controller: _email_controller,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle:
                                    const TextStyle(color: navyBlueColor),
                                // hintText: 'Email / Mobile No.',
                                labelText: 'Branch',
                                isDense: true,
                              )),
                        ),
                      ),
                      Visibility(
                        visible: BankAdd == "Yes" ? true : false,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                              controller: _AccountNumber,
                              //controller: _email_mobile_controller,
                              style: const TextStyle(color:  greyColor),
                              cursorColor:  greyColor,
                              keyboardType: TextInputType.text,
                              //controller: _email_controller,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle:
                                    const TextStyle(color:  navyBlueColor),
                                // hintText: 'Email / Mobile No.',
                                labelText: 'Account Number',
                                isDense: true,
                              )),
                        ),
                      ),
                      Visibility(
                        visible: BankAdd == "Yes" ? true : false,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                              controller: _IFSCode,
                              //controller: _email_mobile_controller,
                              style: const TextStyle(color:  greyColor),
                              cursorColor:  greyColor,
                              keyboardType: TextInputType.text,
                              //controller: _email_controller,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle:
                                    const TextStyle(color: navyBlueColor),
                                // hintText: 'Email / Mobile No.',
                                labelText: 'IFSC Code',
                                isDense: true,
                              )),
                        ),
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              //Navigator.pop(context);
                              setState(() {
                                otpVisibility = true;
                                otpFocusNode.requestFocus();
                              });
                            },
                            child: Text(
                              "Get OTP",
                              style: TextStyle(
                                  color: kWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                              backgroundColor: navyBlueColor,
                              //shadowColor: const Color(0xFFFFAE00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: otpVisibility,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                              controller: otpController,
                              //controller: _email_mobile_controller,
                              style: const TextStyle(color:  greyColor),
                              cursorColor:  greyColor,
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              //controller: _email_controller,
                              decoration: InputDecoration(
                                counterStyle: TextStyle(color:  greyColor),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color:  greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle:
                                    const TextStyle(color: navyBlueColor),
                                // hintText: 'Email / Mobile No.',
                                labelText: 'OTP',
                                isDense: true,
                              )),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value ?? false;
                              });
                            },
                          ),
                          const Text(
                            "I Agree to the ",
                            style: TextStyle(
                              color:  greyColor,
                            ),
                          ),
                          Container(
                            child: RichText(
                              text: TextSpan(
                                  text: 'Terms & Condition',
                           
                                  style: TextStyle(
                                    color: navyBlueColor,
                                     fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _launchURL();
                                      print('Login Text Clicked');
                                    }),
                            ),
                          ),
                        ],
                      ),
                        Row(
                        children: [
                          Checkbox(
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value ?? false;
                              });
                            },
                          ),
                          const Text(
                            "I Agree to the ",
                            style: TextStyle(
                              color: greyColor,
                            ),
                          ),
                          Container(
                            child: Flexible(
                          
                              child: RichText(
                                text: TextSpan(
                                    text: 'Cancelation & Refund Policy',
                                                       
                                    style: TextStyle(
                                      color: navyBlueColor,
                                       fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launch2URL();
                                        print('Login Text Clicked');
                                      }
                                      ),
                              ),
                            ),




                          ),
                        ],
                      ),
                      Visibility(
                        visible: agree,
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(10),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                RegisterVendorData();
                        
                                /*        Navigator.pop(context);
                                              Navigator.push(context, MaterialPageRoute(builder: context) => VendorPaymentPage));
                        
                        */
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color:kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                                backgroundColor: navyBlueColor,
                                //shadowColor: const Color(0xFFFFAE00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => alterDialog);
   /* if (type == "Customer") {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => alterDialog);
    }*/
  }

  void _showPicker(context, String which_image, StateSetter setState) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      if (which_image == "aall") {
                        _imgFromGallery(which_image, setState);
                      } else if (which_image == "pan") {
                        _imgFromGallery(which_image, setState);
                      } else if (which_image == "adhar") {
                        _imgFromGallery(which_image, setState);
                      } else if (which_image == "dl") {
                        _imgFromGallery(which_image, setState);
                      } else if (which_image == "bill") {
                        _imgFromGallery(which_image, setState);
                      } else if (which_image == "trade") {
                        _imgFromGallery(which_image, setState);
                      } else if (which_image == "cheque") {
                        _imgFromGallery(which_image, setState);
                      } else if (which_image == "gst") {
                        _imgFromGallery(which_image, setState);
                      } else {
                        _imgFromGalleryy(which_image, setState);
                      }

                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera(which_image, setState);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromCamera(String which_image, StateSetter setState) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (which_image == "ads_1") {
        _ads_1_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_2") {
        _ads_2_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_3") {
        _ads_3_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_4") {
        _ads_4_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_5") {
        _ads_5_file = image == null ? null : File(image.path);
      } else if (which_image == "aall") {
        _ads_1_file = image == null ? null : File(image.path);
        print("image" + image.toString());
      } else if (which_image == "pan") {
        panfile = image == null ? null : File(image.path);
      } else if (which_image == "pan") {
        panfile1 = image == null ? null : File(image.path);
      } else if (which_image == "adhar") {
        adharfile = image == null ? null : File(image.path);
      } else if (which_image == "dl") {
        drivingfile = image == null ? null : File(image.path);
      } else if (which_image == "bill") {
        billfile = image == null ? null : File(image.path);
      } else if (which_image == "trade") {
        tradefile = image == null ? null : File(image.path);
      } else if (which_image == "cheque") {
        chequefile = image == null ? null : File(image.path);
      } else if (which_image == "gst") {
        gstfile = image == null ? null : File(image.path);
      }else if (which_image == "pan1") {
        panfile1 = image == null ? null : File(image.path);
      }else if (which_image == "adhar1") {
        adharfile1 = image == null ? null : File(image!.path);
      }else if (which_image == "dl1") {
        drivingfile1 = image == null ? null : File(image!.path);
      }else if (which_image == "bill1") {
        billfile1 = image == null ? null : File(image!.path);
      }else if (which_image == "trade1") {
        tradefile1 = image == null ? null : File(image!.path);
      }
      else if (which_image == "cheque1") {
        chequefile1 = image == null ? null : File(image!.path);
      }else if (which_image == "gst1") {
        gstfile1 = image == null ? null : File(image!.path);
      }
    });
  }

  _imgFromGallery(String which_image, StateSetter setState) async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? image = await _picker.pickMultiImage(imageQuality: 5);

    setState(() {
      if (which_image == "aall") {
        if (image?.length == 1) {
          _ads_1_file = image == null ? null : File(image[0].path);
        } else if (image?.length == 2) {
          _ads_1_file = image == null ? null : File(image[0].path);
          _ads_2_file = image == null ? null : File(image[1].path);
        } else if (image?.length == 3) {
          _ads_1_file = image == null ? null : File(image[0].path);
          _ads_2_file = image == null ? null : File(image[1].path);
          _ads_3_file = image == null ? null : File(image[2].path);
        } else if (image?.length == 4) {
          _ads_1_file = image == null ? null : File(image[0].path);
          _ads_2_file = image == null ? null : File(image[1].path);
          _ads_3_file = image == null ? null : File(image[2].path);
          _ads_4_file = image == null ? null : File(image[3].path);
        } else if (image?.length == 5) {
          _ads_1_file = image == null ? null : File(image[0].path);
          _ads_2_file = image == null ? null : File(image[1].path);
          _ads_3_file = image == null ? null : File(image[2].path);
          _ads_4_file = image == null ? null : File(image[3].path);
          _ads_5_file = image == null ? null : File(image[3].path);
        }
      } else if (which_image == "pan") {
        if (image?.length == 1) {
          panfile = image == null ? null : File(image[0].path);
        }else if (image?.length == 2) {
          panfile = image == null ? null : File(image[0].path);
          panfile1 = image == null ? null : File(image[1].path);
        }
      } else if (which_image == "adhar") {
        if (image?.length == 1) {
          adharfile = image == null ? null : File(image[0].path);
        }
      } else if (which_image == "dl") {
        if (image?.length == 1) {
          drivingfile = image == null ? null : File(image[0].path);
        }
      } else if (which_image == "bill") {
        if (image?.length == 1) {
          billfile = image == null ? null : File(image[0].path);
        }
      } else if (which_image == "trade") {
        if (image?.length == 1) {
          tradefile = image == null ? null : File(image[0].path);
        }
      } else if (which_image == "cheque") {
        if (image?.length == 1) {
          chequefile = image == null ? null : File(image[0].path);
        }
      } else if (which_image == "gst") {
        if (image?.length == 1) {
          gstfile = image == null ? null : File(image[0].path);
        }
      }

      /* _ads_1_file = image == null ? null : File(image[0].path);
        _ads_2_file = image == null ? null : File(image[1].path);
        _ads_3_file = image == null ? null : File(image[2].path);
        _ads_4_file = image == null ? null : File(image[3].path);
*/

      print("image" + image.toString());
    });
  }

  _imgFromGalleryy(String which_image, StateSetter setState) async {
    final ImagePicker _pickerr = ImagePicker();
    XFile? images =
        await _pickerr.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (which_image == "ads_1") {
        _ads_1_file = images == null ? null : File(images!.path);
      } else if (which_image == "ads_2") {
        _ads_2_file = images == null ? null : File(images!.path);
      } else if (which_image == "ads_3") {
        _ads_3_file = images == null ? null : File(images!.path);
      } else if (which_image == "ads_4") {
        _ads_4_file = images == null ? null : File(images!.path);
        print("image" + images.toString());
      } else if (which_image == "ads_5") {
        _ads_5_file = images == null ? null : File(images!.path);
      }else if (which_image == "pan1") {
        panfile1 = images == null ? null : File(images!.path);
      }else if (which_image == "adhar1") {
        adharfile1 = images == null ? null : File(images!.path);
      }else if (which_image == "dl1") {
        drivingfile1 = images == null ? null : File(images!.path);
      }else if (which_image == "bill1") {
        billfile1 = images == null ? null : File(images!.path);
      }else if (which_image == "trade1") {
        tradefile1 = images == null ? null : File(images!.path);
      }else if (which_image == "cheque1") {
        chequefile1 = images == null ? null : File(images!.path);
      }else if (which_image == "gst1") {
        gstfile1 = images == null ? null : File(images!.path);
      }

      /* _ads_1_file = image == null ? null : File(image[0].path);
        _ads_2_file = image == null ? null : File(image[1].path);
        _ads_3_file = image == null ? null : File(image[2].path);
        _ads_4_file = image == null ? null : File(image[3].path);
*/

      print("image" + images.toString());
    });
  }

  gst_1_Column(BuildContext context, StateSetter setState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "gst", setState);
                setState(() {});
              },
              child: ClipRect(
                child: gstfile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          gstfile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: gstfile == null ? false : true,
          child: const Center(
            child: Text(
              "Photo 1",
              style: TextStyle(
                color: navyBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
  gst_2_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: gstfile == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "gst1", setState);
                  setState(() {});
                },
                child: ClipRect(
                  child: gstfile1 != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      gstfile1!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                      : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const Icon(
                        Icons.camera_alt,
                        color: navyBlueColor,
                        size: 100,
                      )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: gstfile1 == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 2",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  cheque_1_Column(BuildContext context, StateSetter setState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "cheque", setState);
                setState(() {});
              },
              child: ClipRect(
                child: chequefile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          chequefile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: chequefile == null ? false : true,
          child: const Center(
            child: Text(
              "Photo 1",
              style: TextStyle(
                color: navyBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
  cheque_2_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: chequefile == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "cheque1", setState);
                  setState(() {});
                },
                child: ClipRect(
                  child: chequefile1 != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      chequefile1!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                      : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const Icon(
                        Icons.camera_alt,
                        color: navyBlueColor,
                        size: 100,
                      )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: chequefile1 == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 2",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  trade_1_Column(BuildContext context, StateSetter setState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "trade", setState);
                setState(() {});
              },
              child: ClipRect(
                child: tradefile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          tradefile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: tradefile == null ? false : true,
          child: const Center(
            child: Text(
              "Photo 1",
              style: TextStyle(
                color: navyBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
  trade_2_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: tradefile == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "trade1", setState);
                  setState(() {});
                },
                child: ClipRect(
                  child: tradefile1 != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      tradefile1!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                      : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const Icon(
                        Icons.camera_alt,
                        color: navyBlueColor,
                        size: 100,
                      )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: tradefile1 == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 2",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  bill_1_Column(BuildContext context, StateSetter setState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "bill", setState);
                setState(() {});
              },
              child: ClipRect(
                child: billfile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          billfile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: billfile == null ? false : true,
          child: const Center(
            child: Text(
              "Photo 1",
              style: TextStyle(
                color: navyBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
  bill_2_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: billfile == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "bill1", setState);
                  setState(() {});
                },
                child: ClipRect(
                  child: billfile1 != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      billfile1!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                      : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const Icon(
                        Icons.camera_alt,
                        color: navyBlueColor,
                        size: 100,
                      )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: drivingfile1 == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 2",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  driving_1_Column(BuildContext context, StateSetter setState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "dl", setState);
                setState(() {});
              },
              child: ClipRect(
                child: drivingfile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          drivingfile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: drivingfile == null ? false : true,
          child: const Center(
            child: Text(
              "Photo 1",
              style: TextStyle(
                color: navyBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
  driving_2_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: drivingfile == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "dl1", setState);
                  setState(() {});
                },
                child: ClipRect(
                  child: drivingfile1 != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      drivingfile1!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                      : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const Icon(
                        Icons.camera_alt,
                        color: navyBlueColor,
                        size: 100,
                      )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: drivingfile1 == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 2",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  ads_4_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: _ads_3_file == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "ads_4", setState);
                },
                child: ClipRect(
                  child: _ads_4_file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _ads_4_file!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.camera_alt,
                            color: navyBlueColor,
                            size: 100,
                          )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _ads_4_file == null ? false : true,
            child: Center(
              child: Text(
                "Photo 4",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ads_3_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: _ads_2_file == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "ads_3", setState);
                },
                child: ClipRect(
                  child: _ads_3_file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _ads_3_file!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.camera_alt,
                            color: navyBlueColor,
                            size: 100,
                          )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _ads_3_file == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 3",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ads_2_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: _ads_1_file == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "ads_2", setState);
                },
                child: ClipRect(
                  child: _ads_2_file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _ads_2_file!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.camera_alt,
                            color: navyBlueColor,
                            size: 100,
                          )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _ads_2_file == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 2",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  adhar_1_Column(BuildContext context, StateSetter setState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "adhar", setState);
                setState(() {});
              },
              child: ClipRect(
                child: adharfile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          adharfile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: adharfile == null ? false : true,
          child: const Center(
            child: Text(
              "Photo 1",
              style: TextStyle(
                color: navyBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
  adhar_2_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: adharfile == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "adhar1", setState);
                  setState(() {});
                },
                child: ClipRect(
                  child: adharfile1 != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      adharfile1!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                      : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const Icon(
                        Icons.camera_alt,
                        color: navyBlueColor,
                        size: 100,
                      )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: adharfile1 == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 2",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  pan_1_Column(BuildContext context, StateSetter setState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "pan", setState);
                setState(() {});
              },
              child: ClipRect(
                child: panfile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          panfile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: panfile == null ? false : true,
          child: const Center(
            child: Text(
              "Photo 1",
              style: TextStyle(
                color: navyBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
  pan_2_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: panfile == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "pan1", setState);
                  setState(() {});
                },
                child: ClipRect(
                  child: panfile1 != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      panfile1!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                      : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const Icon(
                        Icons.camera_alt,
                        color: navyBlueColor,
                        size: 100,
                      )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: panfile1 == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 2",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  ads_1_Column(BuildContext context, StateSetter setState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "ads_1", setState);
                setState(() {});
              },
              child: ClipRect(
                child: _ads_1_file != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          _ads_1_file!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: _ads_1_file == null ? false : true,
          child: const Center(
            child: Text(
              "Photo 1",
              style: TextStyle(
                color: navyBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  ads_5_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: _ads_4_file == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "ads_5", setState);
                  setState(() {});
                },
                child: ClipRect(
                  child: _ads_5_file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _ads_5_file!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.camera_alt,
                            color: navyBlueColor,
                            size: 100,
                          )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _ads_5_file == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 5",
                style: TextStyle(
                  color: navyBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Visibility uploadf(BuildContext context, StateSetter setState, String title) {
    return Visibility(
      visible: agree,
      child: Container(
        height: 40,
        margin: EdgeInsets.all(10),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              if (title == "Upload Image") {
                _showPicker(context, "aall", setState);
              } else if (title == "PAN CARD") {
                _showPicker(context, "pan", setState);
              } else if (title == "Aadhar Card") {
                _showPicker(context, "adhar", setState);
              } else if (title == "Driving Licence / Voters Id") {
                _showPicker(context, "dl", setState);
              } else if (title == "Utility Bill") {
                _showPicker(context, "bill", setState);
              } else if (title == "Trade Licence / Udyog Aadhar") {
                _showPicker(context, "trade", setState);
              } else if (title == "Cancelled Cheque") {
                _showPicker(context, "cheque", setState);
              } else if (title == "GST Certificate") {
                _showPicker(context, "gst", setState);
              }

              /*        Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: context) => VendorPaymentPage));

*/
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  // "Upload Image",
                  style: TextStyle(
                      color: kWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.upload_file,
                  color: kWhite,
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
              //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
              backgroundColor: navyBlueColor,
             // shadowColor: const Color(0xFFFFAE00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void RegisterVendorData() async {

    if (_formKey.currentState!.validate()) {
      _MerchantnameController.clear();
    _NamePinCodeController.clear();
       _Address1Controller.clear();
       _Address2Controller.clear();
       _TalukaController.clear();
       _StateController.clear();
       _emailController.clear();
          _MobilenoController.clear();
          _pancardnumber.clear();
          _aadharcard.clear();
          _GsT.clear();
    // All fields are valid, continue with registration logic
    // ...
  }
/*    SharedPreferences preferences =
        SharedPreferences.getInstance() as SharedPreferences;
    String? user = preferences.getString("userid");*/

    if (_NamePinCodeController.text.toString().isEmpty) {
      // Fluttertoast.showToast(
      //     msg: "Pleas enter name ",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    } else if (_MobilenoController.text.toString().isEmpty) {
      // Fluttertoast.showToast(
      //     msg: "Enter mobile no ",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    } else {
     String mobileNumber = _MobilenoController.text.toString();

    if(!isValidMobileNumber(mobileNumber)) {
    // Fluttertoast.showToast(
    //   msg: "Please input a correct 10-digit mobile number",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.CENTER,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.red,
    //   textColor: Colors.white,
    //   fontSize: 16.0,
    // );
  } 
     else if (_emailController.text.toString().isEmpty) {
      // Fluttertoast.showToast(
      //     msg: "Pleas enter email ",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    } else if (!isEmailValid(_emailController.text.toString())) {
  // Fluttertoast.showToast(
  //   msg: "Please enter a valid email",
  //   toastLength: Toast.LENGTH_SHORT,
  //   gravity: ToastGravity.CENTER,
  //   timeInSecForIosWeb: 1,
  //   backgroundColor: Colors.green,
  //   textColor: Colors.white,
  //   fontSize: 16.0,
  // );
}
     else if (CAtname.toString().isEmpty) {
      Fluttertoast.showToast(
          msg: "Please seclect Category ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (otpController.text.toString().isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter  OTP ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } 
    else {
      setState(() {
        showSpinner = true;
      });
    

      // var stream  = new http.ByteStream(_ads_1_file!.openRead());
      // stream.cast();
      // var stream2  = new http.ByteStream(_ads_2_file!.openRead());
      //   stream2.cast();
      //   var stream3  = new http.ByteStream(_ads_1_file!.openRead());
      //   stream3.cast();
      //   var stream4  = new http.ByteStream(_ads_1_file!.openRead());
      //   stream4.cast();

//       var stream3 = new http.ByteStream(_ads_1_file!.openRead());
//       var stream4  = new http.ByteStream(_ads_1_file!.openRead());
// /*      var stream2  = new http.ByteStream(_ads_2_file!.openRead());
//       var stream3  = new http.ByteStream(_ads_3_file!.openRead());
//       var stream4  = new http.ByteStream(_ads_4_file!.openRead());*/
//       stream3.cast();
//       stream4.cast();
      // stream2.cast();
      // stream3.cast();
      // stream4.cast();

      //   var length = await _ads_1_file!.length();

      var uri = Uri.parse(
          'https://geniemoneyy.com/genie_money/public/index.php/useressentialssave');

      var request = new http.MultipartRequest('POST', uri);
      //"phone": _MobilenoController.text.toString(),

      request.fields['user_id'] = Constants.userid;
      request.fields['category_id'] = CatId.toString();
      request.fields['password'] = _Password.text.toString();
      request.fields['merchant_name'] = _MerchantnameController.text.toString();
      request.fields['merchant_type'] = selected_typee.toString();
      request.fields['if_other'] = _OthersController.text.toString();
      request.fields['name_of_owner'] = _NamePinCodeController.text.toString();
      request.fields['phone'] = _MobilenoController.text.toString();
      request.fields['email'] = _emailController.text.toString();
      request.fields['address'] = _Address1Controller.text.toString();
      request.fields['address2'] = _Address2Controller.text.toString();
      request.fields['city'] = _TalukaController.text.toString();
      request.fields['gst'] = _GsT.text.toString();
      request.fields['state'] = _StateController.text.toString();
      request.fields['pincode'] = _pin_code_controller.text.toString();
      request.fields['bank_name'] = selectedBankNamep.toString();
      request.fields['Branch'] = _Branch.text.toString();
      request.fields['account'] = _AccountNumber.text.toString();
      request.fields['ifsc_code'] = _IFSCode.text.toString();
      request.fields['remark'] = _remarkController.text.toString();
      request.fields['marchant_refer_by'] = _refermerchantby.text.toString();

      if (_ads_1_file != null) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('ad_1', _ads_1_file!.path);
        request.files.add(multipartFile);
      } else {
        // request.fields['ad_1'] =  _remarkController.text.toString();
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('ad_1', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }

      if (_ads_2_file != null) {
        http.MultipartFile multipartFile2 =
            await http.MultipartFile.fromPath('ad_2', _ads_2_file!.path);
        request.files.add(multipartFile2);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('ad_2', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }

      if (_ads_3_file != null) {
        http.MultipartFile multipartFile3 =
            await http.MultipartFile.fromPath('ad_3', _ads_1_file!.path);
        request.files.add(multipartFile3);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('ad_3', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }

      if (_ads_4_file != null) {
        http.MultipartFile multipartFile4 =
            await http.MultipartFile.fromPath('ad_4', _ads_4_file!.path);
        request.files.add(multipartFile4);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('ad_4', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (panfile != null) {
        http.MultipartFile multipartFile5 =
        await http.MultipartFile.fromPath('PAN', panfile!.path);
        request.files.add(multipartFile5);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('PAN', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (panfile1 != null) {
        http.MultipartFile multipartFile6 =
        await http.MultipartFile.fromPath('PAN2', panfile!.path);
        request.files.add(multipartFile6);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('PAN2', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (adharfile != null) {
        http.MultipartFile multipartFile7 =
        await http.MultipartFile.fromPath('Aadhar', adharfile!.path);
        request.files.add(multipartFile7);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('Aadhar', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (adharfile1 != null) {
        http.MultipartFile multipartFile8 =
        await http.MultipartFile.fromPath('adhar2', adharfile1!.path);
        request.files.add(multipartFile8);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('adhar2', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (drivingfile != null) {
        http.MultipartFile multipartFile9=
        await http.MultipartFile.fromPath('Driving_Licence', drivingfile!.path);
        request.files.add(multipartFile9);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('Driving_Licence', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (drivingfile1 != null) {
        http.MultipartFile multipartFile10=
        await http.MultipartFile.fromPath('Driving_Licence2', drivingfile1!.path);
        request.files.add(multipartFile10);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('Driving_Licence2', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (billfile != null) {
        http.MultipartFile multipartFile11=
        await http.MultipartFile.fromPath('Utility_Bill', billfile!.path);
        request.files.add(multipartFile11);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('Utility_Bill', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (billfile1 != null) {
        http.MultipartFile multipartFile12=
        await http.MultipartFile.fromPath('Utility_Bill2', billfile1!.path);
        request.files.add(multipartFile12);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('Utility_Bill2', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (tradefile != null) {
        http.MultipartFile multipartFile13=
        await http.MultipartFile.fromPath('TradeL_UAadhar', tradefile!.path);
        request.files.add(multipartFile13);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('TradeL_UAadhar', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (tradefile1 != null) {
        http.MultipartFile multipartFile14=
        await http.MultipartFile.fromPath('TradeL_UAadhar2', tradefile1!.path);
        request.files.add(multipartFile14);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('TradeL_UAadhar2', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (chequefile != null) {
        http.MultipartFile multipartFile15=
        await http.MultipartFile.fromPath('Cancelled_Cheque', chequefile!.path);
        request.files.add(multipartFile15);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('Cancelled_Cheque', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (chequefile1 != null) {
        http.MultipartFile multipartFile16=
        await http.MultipartFile.fromPath('Cancelled_Cheque2', chequefile1!.path);
        request.files.add(multipartFile16);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('Cancelled_Cheque2', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (gstfile != null) {
        http.MultipartFile multipartFile17=
        await http.MultipartFile.fromPath('GST_Certificate', gstfile!.path);
        request.files.add(multipartFile17);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('GST_Certificate', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
      if (gstfile1 != null) {
        http.MultipartFile multipartFile18=
        await http.MultipartFile.fromPath('GST_Certificate2', gstfile1!.path);
        request.files.add(multipartFile18);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.png'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('GST_Certificate2', bytes,
            filename: 'sliderlogo.png');
        request.files.add(mpFile);
      }
// if(_ads_4_file==null||_ads_3_file==null||_ads_2_file==null||_ads_1_file==null)
//   {
//     request.files.add(http.MultipartFile.fromString("ad_1", "aadharcard_payment_gm.png"));
//
//
//
//   }

      //  request.files.add(multipartFile2);
      // request.files.add(multipartFile3);
      //  request.files.add(multipartFile4);

/*
    var multiport = new http.MultipartFile(
          'ad_1',
          stream,
          length);*/
/* var multiport2 = new http.MultipartFile(
          'ad_2',
          stream,
          length);
 var multiport3 = new http.MultipartFile(
          'ad_3',
          stream,
          length);
 var multiport4 = new http.MultipartFile(
          'ad_4',
          stream,
          length)*/
      ;

      /// request.files.add(multiport);

      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      final decodedMap = json.decode(responseString);

      int stat = decodedMap['status'];

      var msg = decodedMap['error'];

      print(decodedMap['status']);
      print(responseString);
      print(decodedMap['ess_id ']);
      print(decodedMap['error']);

      //  print(response.stream.toString());

      /*   var model = VendorResponse.fromJson(StreamedResponse);

      String stat = model.status.toString();
      String ess = model.essId.toString();
      print("ddddddddddddd"+stat);*/

      if (stat == 201) {
        Fluttertoast.showToast(
            msg: "Merchant Succesfully Registerd ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        if (cid.isEmpty && type == "Merchant") {
          var ess = decodedMap['ess_id '];
          var newcatID = decodedMap['category_id '];
          String _name='';
          String _email='';
          String _phone='';
          String _Address='';
          String _amount='';
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PaymentForm( _name,
 _email,
   _phone,
_Address,
 _amount)));
                      /*VendorPaymentPage(essid: ess.toString(), cat_id: newcatID, cat_idd: '0',)));*/

          print("new catid" + newcatID);
        } else {
          var ess = decodedMap['ess_id '];
          String _name='';
          String _email='';
          String _phone='';
          String _Address='';
          String _amount='';
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PaymentForm(_name,
 _email,
   _phone,
_Address,
 _amount)));
                      /*VendorPaymentPage(essid: ess.toString(), cat_id: "", cat_idd: '0',)));*/
        }

        setState(() {
          showSpinner = false;
        });
      } else {
        Fluttertoast.showToast(
            //msg: "Email & Mobile No Already Exist",
            msg: "Email & Mobile No Already Exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          showSpinner = false;
        });
      }
    
      /* Map<String, String> jsonbody = {
        "category_id": CatId.toString(),
        "user_id":user.toString(),
        "password":_MobilenoController.text.toString(),

        "merchant_name":_MerchantnameController.text.toString(),
        "merchant_type":selected_typee.toString(),
        "if_other":_IFSCode.text.toString(),
        "name_of_owner": _NamePinCodeController.text.toString(),
        "phone": _MobilenoController.text.toString(),
        "email": _emailController.text.toString(),
        "address": _Address1Controller.text.toString(),
        "address2": _Address2Controller.text.toString(),
        "city": _TalukaController.text.toString(),
        "gst":_GsT.text.toString(),
        "state": _StateController.text.toString(),
        "pincode": _pin_code_controller.text.toString(),
        "bank_name":selectedBankNamep.toString(),
        "Branch":_Branch.text.toString(),
        "account":_AccountNumber.text.toString(),
        "ifsc_code":_IFSCode.text.toString(),




        // "user_id:": user.toString(),

        //  "district": _DistrictController.text.toString(),


*/ /*
        "remark":_remarkController.text.toString(),
*/ /*



        */ /*   "ad_1":_ads_1_file,
      "ad_2":_ads_2_file.toString(),
      "ad_3":_ads_3_file.toString(),
      "ad_4":_ads_4_file.toString(),
*/ /*
      };
      var network = NewVendorApiService();
      String urls =
          "http://165.22.219.135/genie_money/public/index.php/useressentialssave";
      var res = await network.postresponse(urls, jsonbody);
      var model = VendorResponse.fromJson(res);
      String stat = model.status.toString();
      String ess = model.essId.toString();

      if (stat != 201) {
        Fluttertoast.showToast(
            msg: "Vendor Succesfully Registerd ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    VendorPaymentPage(essid: ess,)));
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

*/
    }
  }
  }

  void _createToast(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  Future<void> getuserid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      user = sharedPreferences.getString('userid') ?? "";
      print("lalalalala" + user.toString());
    });
  }

  Future<void> getdata() async {
    String url =
        "https://geniemoneyy.com/genie_money/public/index.php/categoryimage";
    var network = new NewVendorApiService();
    var res = await network.getresponse(url);
    var vlist = NewVendorsModel.fromJson(res);

    setState(() {
      VendorCatList = vlist.category!;
    });

    print("" + res!.toString());
  }

  Widget getBankListDropDown() {
    return GestureDetector(
      onTap: () {
        setState(() {
          tempBankList = bankList;
        });
        Dialog bankDialog = Dialog(
          backgroundColor:kWhite,
          child: StatefulBuilder(builder: (context, setStateNew) {
            return Container(
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: navyBlueColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: TextField(
                            textCapitalization: TextCapitalization.characters,
                            onChanged: (value) {
                              setStateNew(() {
                                if (value.isNotEmpty) {
                                  tempBankList = bankList!
                                      .where((element) =>
                                          element.bankName.contains(value))
                                      .toList();
                                } else {
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
                                color:navyBlueColor,
                                decoration: TextDecoration.none),
                            cursorColor: greyColor,
                          ),
                        )),
                        Icon(
                          Icons.search,
                          color: navyBlueColor,
                        )
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
                              onTap: () {
                                setState(() {
                                  selectedBankModelp = tempBankList![index];
                                  selectedBankNamep =
                                      selectedBankModelp!.bankName;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  tempBankList![index].bankName,
                                  style: TextStyle(
                                      color: navyBlueColor, fontSize: 18),
                                ),
                              ),
                            );
                          }),
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
      child: Visibility(
        visible: BankAdd == "Yes" ? true : false,
        child: Container(
          //height: 40,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: navyBlueColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  selectedBankNamep,
                  style: TextStyle(color: navyBlueColor, fontSize: 16),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: navyBlueColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<BankModel>> getBankList() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/dmt_bank_list.json");

    final jsonResult = json.decode(data);
    setState(() {
      bankList = (BankListModel.fromJson(jsonResult).list);
      bankList!.sort((a, b) => a.bankName.compareTo(b.bankName));
      tempBankList!.addAll(bankList!);
      //bankList!.insertAll(0, [new BankModel(bankid: 0, bankName: "Select Bank")]);
    });

    print(jsonResult);
    selectedBank = bankList!.first;
    return bankList!;
  }

  _launchURL() async {
    const url = 'https://geniemoneyy.com/terms/';
    if (url.isNotEmpty) {
    launchUrl(Uri.parse(url),mode:LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
    _launch2URL() async {
    const url = 'https://geniemoneyy.com/refund-policies/';
    if (url.isNotEmpty) {
    launchUrl(Uri.parse(url),mode:LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
 /* onBackPress() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen()));
    //Navigator.of(context).pop();
  }*/
    Future _alertDialog1() {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          contentText: 'Getting Activated Soon',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}
