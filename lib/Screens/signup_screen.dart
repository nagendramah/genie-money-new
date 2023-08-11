// ignore: unused_import
// ignore_for_file: unused_field, unused_local_variable

// ignore: unused_import
import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: unused_import
import 'package:genie_money/Model/DemoModel.dart';
import 'package:genie_money/Screens/onboard_screen.dart';
// ignore: duplicate_import
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/network.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;
import 'package:location/location.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import
import 'package:webview_flutter/webview_flutter.dart';

// ignore: unused_import
import '../Model/SignUpModel.dart';
import '../utils/location_finder.dart';
//import 'package:unique_identifier/unique_identifier.dart';

// ignore: must_be_immutable
class SignupScreen extends StatefulWidget {
  String which_page;

  SignupScreen(this.which_page, {Key? key}) : super(key: key);

  @override
  _SignupScreen createState() {
    // TODO: implement createState
    return _SignupScreen();
  }
}

class _SignupScreen extends State<SignupScreen>
    with TickerProviderStateMixin {
  String BankAdd = "Partner";

  final TextEditingController   _email_controller = TextEditingController();
  final TextEditingController _mobile_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _confirm_password_controller = TextEditingController();
  final TextEditingController _ref_controller = TextEditingController();
  final TextEditingController _employee_code_controller = TextEditingController();

///////////////////////////Bussiness partner///////////////////////////////////

  final TextEditingController   _Bemail_controller = TextEditingController();
  final TextEditingController _Bmobile_controller = TextEditingController();
  final TextEditingController _Bpassword_controller = TextEditingController();
  final TextEditingController _Bconfirm_password_controller = TextEditingController();
  final TextEditingController _Bref_controller = TextEditingController();
  final TextEditingController _Bemployee_code_controller = TextEditingController();
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 GlobalKey<FormState> _form1Key = GlobalKey<FormState>();
  NetworkCall networkCall = NetworkCall();
  late String longitude = '00.00000';
  late String latitude = '00.00000';
  late String loction = "";
  late Geolocator.LocationPermission permission;
  late bool serviceEnabled = false, isProgress = false;
  bool isChecked = true;
  bool showWeb = false;
  bool isLoading = true;
  String url = "http://geniesoftsystem.com/";
  final _key = UniqueKey();
  late String selected_type = "Retailer";
  String selectedTypeNew="retailer";
  late String type = "Customer";
  late String Btype = "Business Partner";
  late String Etype = "Employee";

  late TabController _tabController;

  double curve = 140;
  double height_angle = 170;
  late String _currentAddress = "";
  String? _identifier = 'Unknown';

  List<String> business_type_list = [
    'Retailer',
    'Distributor',
    'Super Distributor'
  ];

    String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z\d-]+$');

  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email';
  }

    // You can add more complex email validation logic here
    return null;
  }
  String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your phone number';
    }
      if (value.length != 10) {
    return 'Please enter a 10-digit phone number';
  }
    return null;
  }

  Future<void> _getLocation() async {
    permission = await Geolocator.Geolocator.checkPermission();
    if (permission == Geolocator.LocationPermission.always ||
        permission == Geolocator.LocationPermission.whileInUse) {
      serviceEnabled = await Geolocator.Geolocator.isLocationServiceEnabled();
      if (serviceEnabled) {
        Geolocator.Position position = await Geolocator.Geolocator.getCurrentPosition(
            desiredAccuracy: Geolocator.LocationAccuracy.high);
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();

      } else {
        await Geolocator.Geolocator.openLocationSettings();
      }
    } else {
      permission = await Geolocator.Geolocator.requestPermission();
    }
  }

  Future<void> GetAddressFromLatLong() async {
    if (_currentAddress.isEmpty) {
      LocationFinder locationFinder = LocationFinder();
      LocationData locationData = await locationFinder.getLocation();
      double longitude = locationData.longitude ?? 0.0000;
      double latitude = locationData.latitude ?? 0.0000;
      List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      setState(() {
        if (_currentAddress.isEmpty) {
          _currentAddress =
          '${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.thoroughfare}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';
        }
      });
      //print("pincode : "+place.street.toString());
      print(_currentAddress);
    }
  }



  Future<bool> _onBackPressed() async {
    // Your back press code here...
    if (showWeb) {
      setState(() {
        showWeb = false;
      });
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    getim();

    _tabController = TabController(length: 3, vsync: this);
    if (widget.which_page == "1") {
      _tabController.animateTo(1);
      Btype = "Business Partner";
    } else if (widget.which_page == "2") {
      _tabController.animateTo(2);
      Etype = "Employee";
    }
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? font = DefaultTextStyle.of(context).style.fontFamily;
    print("font name :" + font!);
    _getLocation();
    GetAddressFromLatLong();
    return Scaffold(
      backgroundColor:kWhite,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
/*
                Visibility(
                  visible: showWeb,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 1.0),
                        height: height * 0.95,
                        child: WebView(
                          key: _key,
                          initialUrl: url,
                          javascriptMode: JavascriptMode.unrestricted,
                          onPageStarted: (value) {
                            Center(
                              child: Visibility(
                                visible: isLoading,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          onPageFinished: (finish) {
                            setState(() {
                              isLoading = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
*/
                TabBar(
                  indicator: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: navyBlueColor),
                  onTap: (value) {
                    setState(() {
                      if (value == 0) {
                        type = "Customer";
                      } else if (value == 1) {
                        Btype = "Business Partner";
                      } else {
                        Etype = "Employee";
                      }
                    });
                  },
                  isScrollable: false,
                  indicatorColor: Colors.white,
                  controller: _tabController,
                  labelColor: kWhite,
                  unselectedLabelColor:navyBlueColor,
                  tabs: const [
                    Tab(
                      child: Text(
                        "Customer",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Business Partner",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Employee",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      customer_login_ui(height, context, width),

                      business_login_ui(height, context, width),
                      employe_login_ui(height, context, width),
                    ],

/*
                    child: CustomPaint(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Existing user?",
                              style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Route newRoute = MaterialPageRoute(
                                    builder: (context) =>
                                        OnBoardScreen("signup", type == "Customer" ? "0" : type == "Business Partner" ? "1" : "2"));
                                Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 16.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(width, 40.0),
                                primary: const Color(0xFF111111),
                                shadowColor: const Color(0xFF111111),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 80.0,
                            ),
                            Visibility(
                              visible: type == "Employee" ? false : true,
                              child: Column(
                                children: [
                                  const Text(
                                    "Sign up with",
                                    style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Genie Moneyy",
                                    style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 20),
                                  Visibility(
                                    visible: type == "Business Partner" ? true : false,

                                    child: SingleChildScrollView(

                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              Radio(
                                                value: "Partner",
                                                groupValue: BankAdd,
                                                activeColor: Color(0xFFFFAE00),
                                                onChanged: (value) {
                                                  setState(() {
                                                    BankAdd = value.toString();
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Partner',
                                                style: TextStyle(color: Color(0xFFFFAE00),fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Radio(
                                                value: "Associate Partner",
                                                groupValue: BankAdd,
                                                activeColor: Color(0xFFFFAE00),
                                                onChanged: (value) {
                                                  setState(() {
                                                    BankAdd = value.toString();
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Associate Partner',
                                                style: TextStyle(color: Color(0xFFFFAE00),fontSize: 13),
                                              ),

                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Radio(
                                                value: "Merchant",
                                                groupValue: BankAdd,
                                                activeColor: Color(0xFFFFAE00),
                                                onChanged: (value) {
                                                  setState(() {
                                                    BankAdd = value.toString();
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Merchant',
                                                style: TextStyle(color: Color(0xFFFFAE00),fontSize: 13),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  TextField(
                                    style:
                                    const TextStyle(color: Color(0xFFFFAE00)),
                                    cursorColor: const Color(0xFFFFAE00),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _email_controller,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      labelStyle: const TextStyle(
                                          color: Color(0xFFFFAE00)),
                                      // hintText: 'Email / Mobile No.',
                                      labelText: 'Enter Email',
                                      isDense: true,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  TextField(
                                    cursorColor: const Color(0xFFFFAE00),
                                    keyboardType: TextInputType.phone,
                                    controller: _mobile_controller,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    style:
                                    const TextStyle(color: Color(0xFFFFAE00)),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      labelStyle: const TextStyle(
                                          color: Color(0xFFFFAE00)),
                                      // hintText: 'Email / Mobile No.',
                                      labelText: 'Mobile number',
                                      isDense: true,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  TextField(
                                    obscureText: true,
                                    cursorColor: const Color(0xFFFFAE00),
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: _password_controller,
                                    style:
                                    const TextStyle(color: Color(0xFFFFAE00)),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      labelStyle: const TextStyle(
                                          color: Color(0xFFFFAE00)),
                                      // hintText: 'Email / Mobile No.',
                                      labelText: 'Password',
                                      isDense: true,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  TextField(
                                    cursorColor: const Color(0xFFFFAE00),
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: _confirm_password_controller,
                                    style:
                                    const TextStyle(color: Color(0xFFFFAE00)),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      labelStyle: const TextStyle(
                                          color: Color(0xFFFFAE00)),
                                      // hintText: 'Email / Mobile No.',
                                      labelText: 'Re-confirm Password',
                                      isDense: true,

                                    ),
                                  ),

                                  Visibility(

                                    visible: type == "Business Partner" ? true : false,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10.02),

                                      child: DropdownButtonFormField<String>(
                                        dropdownColor: const Color(0xFF3A3A3A),
                                        isExpanded: true,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Color(0xFFFFAE00)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Color(0xFFFFAE00)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Color(0xFFFFAE00)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Color(0xFFFFAE00)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
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
                                        style: const TextStyle(
                                            color: Color(0xFFFFAE00), fontSize: 18),
                                        onChanged: (String? data) {
                                          setState(() {
                                            selected_type =
                                                data ?? "Select Business Type";
                                          });


                                        },
                                        items: business_type_list
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  TextField(
                                    cursorColor: const Color(0xFFFFAE00),
                                    keyboardType: TextInputType.text,
                                    controller: _ref_controller,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    style:
                                    const TextStyle(color: Color(0xFFFFAE00)),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      labelStyle: const TextStyle(
                                          color: Color(0xFFFFAE00)),
                                      // hintText: 'Email / Mobile No.',
                                      labelText: 'Referal Code',
                                      isDense: true,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Visibility(
                              visible: type == "Employee" ? true : false,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10.0),
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "New Employee?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontSize: 18.0,),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5, bottom: 5),
                                      child: Text(
                                        "Please Contact HR Team",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                */
/*TextField(
                                  cursorColor: const Color(0xFFFFAE00),
                                  controller: _employee_code_controller,
                                  style:
                                  const TextStyle(color: Color(0xFFFFAE00)),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: const TextStyle(
                                        color: Color(0xFFFFAE00)),
                                    // hintText: 'Email / Mobile No.',
                                    labelText: 'Employee Code',
                                    isDense: true,
                                  ),
                                ),*//*

                              ),
                            ),
                            Visibility(
                              visible: type == "Employee" ? false : true,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: height * 0.02),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: const Color(0xFFFFAE00),
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                        const Text(
                                          "I Agree to the ",
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (showWeb) {
                                                showWeb = false;
                                              } else {
                                                showWeb = true;
                                              }
                                            });
                                          },
                                          child: const Text(
                                            "Terms & Conditions.",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              decoration:
                                              TextDecoration.underline,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () async {
                                      DeviceInfoPlugin deviceInfo =
                                      DeviceInfoPlugin();
                                      var model,
                                          manufacturer,
                                          release,
                                          sdkInt,
                                          id;
                                      if (Platform.isAndroid) {
                                        AndroidDeviceInfo androidInfo =
                                        await deviceInfo.androidInfo;
                                        model = androidInfo.model;
                                        manufacturer = androidInfo.manufacturer;
                                        release = androidInfo.version.release;
                                        sdkInt = androidInfo.version.sdkInt;
                                        id = androidInfo.androidId;
                                      } else {
                                        IosDeviceInfo iosDevice =
                                        await deviceInfo.iosInfo;
                                        model = iosDevice.name;
                                        manufacturer = iosDevice.model;
                                        release = iosDevice.systemName;
                                        sdkInt = iosDevice.systemVersion;
                                        id = iosDevice.identifierForVendor;
                                      }

                                      String sdk = "$sdkInt";
                                      if (_email_controller.text.isNotEmpty) {
                                        if (_mobile_controller.text.isNotEmpty) {
                                          if (_mobile_controller.text.length == 10) {
                                            if (_password_controller
                                                .text.isNotEmpty) {
                                              if (_confirm_password_controller
                                                  .text.isNotEmpty) {
                                                if (_password_controller.text ==
                                                    _confirm_password_controller.text) {
                                                  if (type == "Customer") {
                                                    setState(() {
                                                      isProgress = true;
                                                    });
                                                    bool status = await networkCall.fetchRegistrationPosts(
                                                        _email_controller.text,
                                                        _mobile_controller.text,
                                                        _password_controller.text,
                                                        release + " (" + sdk + ")",
                                                        model,
                                                        latitude,
                                                        longitude,
                                                        _currentAddress,

                                                        "Customer",
                                                        type,
                                                        _ref_controller.text.toString(),
                                                        "2333",
                                                        context);
                                                    setState(() {


                                                      isProgress = false;
                                                    });
                                                    print("status : "+status.toString());
                                                    if (status) {
                                                      getUSERfer();

                                                      Navigator.pushAndRemoveUntil<dynamic>(
                                                        context,
                                                        MaterialPageRoute<dynamic>(
                                                          builder: (BuildContext context) => SignInScreen("0"),
                                                        ),
                                                            (route) => false,
                                                      );
                                                    }
                                                  } else if (type == "Employee") {
                                                    setState(() {
                                                      isProgress = true;
                                                    });
                                                    bool status = await networkCall.fetchRegistrationPosts(
                                                        _email_controller.text,
                                                        _mobile_controller.text,
                                                        _password_controller.text,
                                                        release + " (" + sdk + ")",
                                                        model,
                                                        latitude,
                                                        longitude,
                                                        _currentAddress,
                                                        "",
                                                        "employee",
                                                        type,
                                                        "",
                                                        context);
                                                    setState(() {
                                                      isProgress = false;
                                                    });
                                                    print("status : "+status.toString());
                                                    if (status) {
                                                      Navigator.pushAndRemoveUntil<dynamic>(
                                                        context,
                                                        MaterialPageRoute<dynamic>(
                                                          builder: (BuildContext context) => SignInScreen("2"),
                                                        ),
                                                            (route) => false,
                                                      );
                                                    }
                                                  } else {
                                                    setState(() {
                                                      isProgress = true;
                                                    });
                                                    bool status = await networkCall
                                                        .fetchRegistrationPosts(
                                                        _email_controller.text,
                                                        _mobile_controller.text,
                                                        _password_controller.text,
                                                        release + " (" + sdk + ")",
                                                        model,
                                                        latitude,
                                                        longitude,
                                                        _currentAddress,
                                                        selected_type,
                                                        type,
                                                        _ref_controller.text,
                                                        "2323",

                                                        context);
                                                    setState(() {
                                                      isProgress = false;
                                                    });
                                                    if (status) {
                                                      Navigator.pushAndRemoveUntil<dynamic>(
                                                        context,
                                                        MaterialPageRoute<dynamic>(
                                                          builder: (BuildContext context) => SignInScreen("1"),
                                                        ),
                                                            (route) => false,
                                                      );
                                                    }
                                                  }
                                                } else {
                                                  _createToast(
                                                      "Password does not match");
                                                }
                                              } else {
                                                _createToast(
                                                    "Please enter re-confirm password");
                                              }
                                            } else {
                                              _createToast(
                                                  "Please enter password");
                                            }
                                          } else {
                                            _createToast(
                                                "Please enter valid mobile number");
                                          }
                                        } else {
                                          _createToast(
                                              "Please enter mobile number");
                                        }
                                      } else {
                                        _createToast("Please enter email id");
                                      }
                                    },
                                    child: const Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 16.0,
                                      ),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      painter: HeaderCurvedContainer(height_angle, curve),
                    ),
*/
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isProgress,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFFAE00),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  void getUSERfer() {
    ;
/*
    var refer = DemoModel().fromJson(json).userdetail!.userRefer.toString();
*//*

    print(refer);
    _createToast(refer);
*/

  }


  customer_login_ui(double height, BuildContext context, double width) {
    return Form(
       key: _formKey, 
      child: SingleChildScrollView(
        child: CustomPaint(
          painter: HeaderCurvedContainer(context, height_angle, curve),
          child: Container(
            margin: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Existing user?",
                  style: TextStyle(
                      color: kWhite,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Route newRoute = MaterialPageRoute(
                        builder: (context) =>
                            OnBoardScreen("signup", type == "Customer" ? "0" : type == "Business Partner" ? "1" : "2"));
                    Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width, 40.0), backgroundColor: kWhite,
                   // shadowColor: const Color(0xFF111111),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color:navyBlueColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80.0,
                ),
                Column(
                  children: [
                    const Text(
                      "Sign up with",
                      style: TextStyle(
                          color:navyBlueColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Genie Moneyy",
                      style: TextStyle(
                          color:navyBlueColor,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
    
                    TextFormField(
                      style:
                      const TextStyle(color:greyColor),
                      cursorColor: greyColor,
                      keyboardType: TextInputType.emailAddress,
                      controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: navyBlueColor),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Email',
                        isDense: true,
                      ),
                         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z\d-]+$');
          if (!emailRegex.hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
        
      
                    ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      cursorColor: greyColor,
                      keyboardType: TextInputType.phone,
                      controller: _mobile_controller,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10)
                      ],
                      style:
                      const TextStyle(color:greyColor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: navyBlueColor),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Mobile number',
                        isDense: true,
                      ),
           validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your mobile number';
  }
  final mobileRegex = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
  if (!mobileRegex.hasMatch(value)) {
    return 'Please enter a valid mobile number';
  }
  return null;
},
                    ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      obscureText: true,
                      cursorColor: greyColor,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _password_controller,
                      style:
                      const TextStyle(color: greyColor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: navyBlueColor),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Password',
                        isDense: true,
                      ),

  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    // Add your password validation logic here
    // For example, you can check for minimum length or specific character requirements
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  },


                    ),
  //                   if (_password_controller.text.isNotEmpty &&
  //   _password_controller.text != _confirm_password_controller.text)
  // // Text(
  //   'Passwords do not match',
  //   style: TextStyle(color: Colors.red),
  // ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      cursorColor: greyColor,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _confirm_password_controller,
                      style:
                      const TextStyle(color: greyColor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: navyBlueColor),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Re-confirm Password',
                        isDense: true,
    
                      ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    }
    if (value != _password_controller.text) {
      return 'Passwords do not match';
    }
    return null;
  },

                    ),
    
                    Visibility(
    
                      visible: type == "Business Partner" ? true : false,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.02),
    
                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xFF3A3A3A),
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                            ),
                            isDense: true,
                          ),
                          value: selected_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: navyBlueColor,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: greyColor, fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              selected_type =
                                  data ?? "Select Business Type";
                            });
    
    
                          },
                          items: business_type_list
                              .map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      cursorColor:greyColor,
                      keyboardType: TextInputType.text,
                      controller: _ref_controller,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10)
                      ],
                      style:
                      const TextStyle(color: greyColor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: navyBlueColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: navyBlueColor),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Referred by (Referral Code)',
                        isDense: true,
                      ),
                            validator: (value) {
    if (value != null && value.isNotEmpty) {
      // Add your referral code validation logic here
      // For example, you can check the format or length of the referral code
      if (value.length < 5) {
        return 'Invalid referral code';
      }
    }
    return null;
  },
                    ),
 
                  ],
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: type == "Employee" ? true : false,
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text(
                            "New Employee?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:navyBlueColor,
                              fontSize: 18.0,),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: const Text(
                            "Please Contact HR Team",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: navyBlueColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    /*TextField(
                                              cursorColor: const Color(0xFFFFAE00),
                                              controller: _employee_code_controller,
                                              style:
                                              const TextStyle(color: Color(0xFFFFAE00)),
                                              decoration: InputDecoration(
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xFFFFAE00)),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                disabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xFFFFAE00)),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xFFFFAE00)),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xFFFFAE00)),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                labelStyle: const TextStyle(
                                                    color: Color(0xFFFFAE00)),
                                                // hintText: 'Email / Mobile No.',
                                                labelText: 'Employee Code',
                                                isDense: true,
                                              ),
                                            ),*/
                  ),
                ),
                Visibility(
                  visible: type == "Employee" ? false : true,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: navyBlueColor,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                            ),
                            const Text(
                              "I Agree to the ",
                              style: TextStyle(
                                color:greyColor,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _launchURL();
                                setState(() {
                                  if (showWeb) {
                                    showWeb = false;
                                  } else {
                                    showWeb = true;
                                  }
                                });
    
                              },
                              child: const Text(
                                "Terms & Conditions.",
                                style: TextStyle(
                                  color: navyBlueColor,
                                  decoration:
                                  TextDecoration.underline,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                          visible: isChecked,
                        child: ElevatedButton(
                          onPressed: () async {
                            
                        if (_formKey.currentState!.validate()) {
                      // _email_controller .clear();
                      //  _mobile_controller.clear();
                      //  _password_controller.clear();
                      //    _confirm_password_controller.clear(); 
                      //    _ref_controller.clear();
                      
                        DeviceInfoPlugin deviceInfo =
                            DeviceInfoPlugin();
                            var model,
                                manufacturer,
                                release,
                                sdkInt,
                                id;
                            if (Platform.isAndroid) {
                              AndroidDeviceInfo androidInfo =
                              await deviceInfo.androidInfo;
                              model = androidInfo.model;
                              manufacturer = androidInfo.manufacturer;
                              release = androidInfo.version.release;
                              sdkInt = androidInfo.version.sdkInt;
                              id = androidInfo.androidId;
                            } else {
                              IosDeviceInfo iosDevice =
                              await deviceInfo.iosInfo;
                              model = iosDevice.name;
                              manufacturer = iosDevice.model;
                              release = iosDevice.systemName;
                              sdkInt = iosDevice.systemVersion;
                              id = iosDevice.identifierForVendor;
                            }
                            String sdk = "$sdkInt";
                           if (type == "Customer") {
                              setState(() {
                                isProgress = true;
                              });
                              bool status = await networkCall.fetchRegistrationPosts(
                                _email_controller.text,
                                _mobile_controller.text,
                                _password_controller.text,
                                release + " (" + sdk + ")",
                                model,
                                latitude,
                                longitude,
                                _currentAddress,
                                "Customer",
                                type,
                                _ref_controller.text.toString(),
                                "2333",
                                context,
                              );
                              setState(() {
                                isProgress = false;
                              });
                              print("status : " + status.toString());
                              if (status) {
                                getUSERfer();
                      
                                Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) => SignInScreen("0"),
                                  ),
                                  (route) => false,
                                
                                );
                                _email_controller.clear();
                                _mobile_controller.clear();
                                _password_controller.clear();
                                _confirm_password_controller.clear();
                                _ref_controller.clear();
                              }
                            } else if (type == "Employee") {
                              setState(() {
                                isProgress = true;
                              });
                              bool status = await networkCall.fetchRegistrationPosts(
                                _email_controller.text,
                                _mobile_controller.text,
                                _password_controller.text,
                                release + " (" + sdk + ")",
                                model,
                                latitude,
                                longitude,
                                _currentAddress,
                                "",
                                "employee",
                                type,
                                "",
                                context,
                              );
                              setState(() {
                                isProgress = false;
                              });
                              print("status : " + status.toString());
                              if (status) {
                                Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) => SignInScreen("2"),
                                  ),
                                  (route) => false,
                                );
                                      _email_controller.clear();
                                _mobile_controller.clear();
                                _password_controller.clear();
                                _confirm_password_controller.clear();
                                _ref_controller.clear();
                              }
                            } else {
                              setState(() {
                                isProgress = true;
                              });
                              bool status = await networkCall.fetchRegistrationPosts(
                                _email_controller.text,
                                _mobile_controller.text,
                                _password_controller.text,
                                release + " (" + sdk + ")",
                                model,
                                latitude,
                                longitude,
                                _currentAddress,
                                selected_type,
                                type,
                                _ref_controller.text,
                                "2323",
                                context,
                              );
                              setState(() {
                                isProgress = false;
                              });
                              if (status) {
                                Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) => SignInScreen("1"),
                                  ),
                                  (route) => false,
                                );
                                      _email_controller.clear();
                                _mobile_controller.clear();
                                _password_controller.clear();
                                _confirm_password_controller.clear();
                                _ref_controller.clear();
                              }
                            }
                           
                                  // Form is valid, proceed with the button action
                                  // Add your button action code here
                                }
                              
                            DeviceInfoPlugin deviceInfo =
                            DeviceInfoPlugin();
                            var model,
                                manufacturer,
                                release,
                                sdkInt,
                                id;
                            if (Platform.isAndroid) {
                              AndroidDeviceInfo androidInfo =
                              await deviceInfo.androidInfo;
                              model = androidInfo.model;
                              manufacturer = androidInfo.manufacturer;
                              release = androidInfo.version.release;
                              sdkInt = androidInfo.version.sdkInt;
                              id = androidInfo.androidId;
                            } else {
                              IosDeviceInfo iosDevice =
                              await deviceInfo.iosInfo;
                              model = iosDevice.name;
                              manufacturer = iosDevice.model;
                              release = iosDevice.systemName;
                              sdkInt = iosDevice.systemVersion;
                              id = iosDevice.identifierForVendor;
                            }
                          


                            String sdk = "$sdkInt";
                            if (_email_controller.text.isNotEmpty) {
                              if (_mobile_controller.text.isNotEmpty) {
                                if (_mobile_controller.text.length == 10) {
                                  if (_password_controller
                                      .text.isNotEmpty) {
                                    if (_confirm_password_controller
                                        .text.isNotEmpty) {
                                      if (_password_controller.text ==
                                          _confirm_password_controller.text) {
                                        if (type == "Customer") {
                                          setState(() {
                                            isProgress = true;
                                          });
                                          bool status = await networkCall.fetchRegistrationPosts(
                                              _email_controller.text,
                                              _mobile_controller.text,
                                              _password_controller.text,
                                              release + " (" + sdk + ")",
                                              model,
                                              latitude,
                                              longitude,
                                              _currentAddress,
                          
                                              "Customer",
                                              type,
                                              _ref_controller.text.toString(),
                                              "2333",
                                              context);
                                          setState(() {
                          
                          
                                            isProgress = false;
                                          });
                                          print("status : "+status.toString());
                                          if (status) {
                                            getUSERfer();
                          
                                            Navigator.pushAndRemoveUntil<dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder: (BuildContext context) => SignInScreen("0"),
                                              ),
                                                  (route) => false,
                                            );
                                          }
                                        } else if (type == "Employee") {
                                          setState(() {
                                            isProgress = true;
                                          });
                                          bool status = await networkCall.fetchRegistrationPosts(
                                              _email_controller.text,
                                              _mobile_controller.text,
                                              _password_controller.text,
                                              release + " (" + sdk + ")",
                                              model,
                                              latitude,
                                              longitude,
                                              _currentAddress,
                                              "",
                                              "employee",
                                              type,
                                              "",
                                              context);
                                          setState(() {
                                            isProgress = false;
                                          });
                                          print("status : "+status.toString());
                                          if (status) {
                                            Navigator.pushAndRemoveUntil<dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder: (BuildContext context) => SignInScreen("2"),
                                              ),
                                                  (route) => false,
                                            );
                                          }
                                        } else {
                                          setState(() {
                                            isProgress = true;
                                          });
                                          bool status = await networkCall
                                              .fetchRegistrationPosts(
                                              _email_controller.text,
                                              _mobile_controller.text,
                                              _password_controller.text,
                                              release + " (" + sdk + ")",
                                              model,
                                              latitude,
                                              longitude,
                                              _currentAddress,
                                              selected_type,
                                              type,
                                              _ref_controller.text,
                                              "2323",
                          
                                              context);
                                          setState(() {
                                            isProgress = false;
                                          });
                                          if (status) {
                                            Navigator.pushAndRemoveUntil<dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder: (BuildContext context) => SignInScreen("1"),
                                              ),
                                                  (route) => false,
                                            );
                                          }
                                        }
                                      } else {
                                        _createToast(
                                            "Password does not match");
                                      }
                                    } else {
                                      _createToast(
                                          "Please enter re-confirm password");
                                    }
                                  } else {
                                    _createToast(
                                        "Please enter password");
                                  }
                                } else {
                                  _createToast(
                                      "Please enter valid mobile number");
                                }
                              } else {
                                _createToast(
                                    "Please enter mobile number");
                              }
                            } else {
                              _createToast("Please enter email id");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            
                            fixedSize: Size(width, 40.0), backgroundColor: navyBlueColor,
                            //shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  business_login_ui(double height, BuildContext context, double width) {
   // final _formKey = GlobalKey<FormState>();
    return Form(
        key: _form1Key,
      child: SingleChildScrollView(
        child: CustomPaint(
          painter: HeaderCurvedContainer(context, height_angle, curve),
          child: Container(
            margin: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Existing user?",
                  style: TextStyle(
                      color:kWhite,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Route newRoute = MaterialPageRoute(
                        builder: (context) =>
                            OnBoardScreen("signup", Btype == "Customer" ? "0" : Btype == "Business Partner" ? "1" : "2"));
                    Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color:navyBlueColor,
                      fontSize: 16.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width, 40.0), backgroundColor: kWhite,
                   // shadowColor: const Color(0xFF111111),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80.0,
                ),
                Visibility(
                  visible: Btype == "Business Partner" ? true : false,
                  child: Column(
                    children: [
                      const Text(
                        "Sign up with",
                        style: TextStyle(
                            color: navyBlueColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Genie Moneyy",
                        style: TextStyle(
                            color: navyBlueColor,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      SingleChildScrollView(
    
                        scrollDirection: Axis.horizontal,
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor: greyColor, 
                            ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: "Partner",
                                    groupValue: BankAdd,
                                    activeColor: navyBlueColor,
                                  
                                    onChanged: (value) {
                                      setState(() {
                                        BankAdd = value.toString();
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Partner',
                                    style: TextStyle(color: navyBlueColor,fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Associate Partner",
                                    groupValue: BankAdd,
                                    activeColor: navyBlueColor,
                                    onChanged: (value) {
                                      setState(() {
                                        BankAdd = value.toString();
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Associate Partner',
                                    style: TextStyle(color: navyBlueColor,fontSize: 13),
                                  ),
                            
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Merchant",
                                    groupValue: BankAdd,
                                    activeColor: navyBlueColor,
                                    onChanged: (value) {
                                      setState(() {
                                        BankAdd = value.toString();
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Merchant',
                                    style: TextStyle(color: navyBlueColor,fontSize: 13),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
    
                      TextFormField(
                      
                        style:
                        const TextStyle(color: greyColor),
                        cursorColor: greyColor,
                        keyboardType: TextInputType.emailAddress,
                        controller: _Bemail_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(
                              color: navyBlueColor),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Enter Email',
                          isDense: true,
                        ),
                          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z\d-]+$');
            if (!emailRegex.hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
    
                      
                      ),
                      SizedBox(height: height * 0.02),
                      TextFormField(
                        cursorColor: greyColor,
                        keyboardType: TextInputType.phone,
                        controller: _Bmobile_controller,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10)
                        ],
                        style:
                        const TextStyle(color: greyColor),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(
                              color: navyBlueColor),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Mobile number',
                          isDense: true,
                        ),
             validator: (value) {
      if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
      }
      final mobileRegex = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
      if (!mobileRegex.hasMatch(value)) {
      return 'Please enter a valid mobile number';
      }
      return null;
    },
    
    
    
                      ),
                      SizedBox(height: height * 0.02),
                      TextFormField(
                        obscureText: true,
                        cursorColor: greyColor,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _Bpassword_controller,
                        style:
                        const TextStyle(color: greyColor),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(
                              color: navyBlueColor),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Password',
                          isDense: true,
                        ),
    
      validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a password';
      }
      // Add your password validation logic here
      // For example, you can check for minimum length or specific character requirements
      if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      }
      return null;
      },
    
                      
                      ),
                      SizedBox(height: height * 0.02),
                      TextFormField(
                        cursorColor: greyColor,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _Bconfirm_password_controller,
                        style:
                        const TextStyle(color: greyColor),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(
                              color: navyBlueColor),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Re-confirm Password',
                          isDense: true,
    
                        ),
                         validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please re-enter your password';
      }
      if (value != _Bpassword_controller.text) {
        return 'Passwords do not match';
      }
      return null;
      },
    
    
    
    
                      ),
    
                      // Visibility(
                      //
                      //   visible: Btype == "Business Partner" ? true : false,
                      //   child: Container(
                      //     margin: EdgeInsets.only(top: 10.02),
                      //
                      //     child: DropdownButtonFormField<String>(
                      //       dropdownColor: const Color(0xFF3A3A3A),
                      //       isExpanded: true,
                      //       decoration: const InputDecoration(
                      //         focusedBorder: OutlineInputBorder(
                      //           borderSide:
                      //           BorderSide(color: Color(0xFFFFAE00)),
                      //           borderRadius: BorderRadius.all(
                      //               Radius.circular(10.0)),
                      //         ),
                      //         disabledBorder: OutlineInputBorder(
                      //           borderSide:
                      //           BorderSide(color: Color(0xFFFFAE00)),
                      //           borderRadius: BorderRadius.all(
                      //               Radius.circular(10.0)),
                      //         ),
                      //         enabledBorder: OutlineInputBorder(
                      //           borderSide:
                      //           BorderSide(color: Color(0xFFFFAE00)),
                      //           borderRadius: BorderRadius.all(
                      //               Radius.circular(10.0)),
                      //         ),
                      //         border: OutlineInputBorder(
                      //           borderSide:
                      //           BorderSide(color: Color(0xFFFFAE00)),
                      //           borderRadius: BorderRadius.all(
                      //               Radius.circular(10.0)),
                      //         ),
                      //         isDense: true,
                      //       ),
                      //       value: selected_type,
                      //       icon: const Icon(
                      //         Icons.arrow_drop_down,
                      //         color: Color(0xFFFFAE00),
                      //       ),
                      //       iconSize: 24,
                      //       elevation: 16,
                      //       style: const TextStyle(
                      //           color: Color(0xFFFFAE00), fontSize: 18),
                      //       onChanged: (String? data) {
                      //         setState(() {
                      //           selected_type =
                      //               data ?? "Select Business Type";
                      //         });
                      //
                      //
                      //       },
                      //       items: business_type_list
                      //           .map<DropdownMenuItem<String>>(
                      //               (String value) {
                      //             return DropdownMenuItem<String>(
                      //               value: value,
                      //               child: Text(value),
                      //             );
                      //           }).toList(),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: height * 0.02),
                      TextFormField(
                        cursorColor: greyColor,
                        keyboardType: TextInputType.text,
                        controller: _Bref_controller,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10)
                        ],
                        style:
                        const TextStyle(color: greyColor),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: navyBlueColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(
                              color: navyBlueColor),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Referred by (Referral Code)',
                          isDense: true,
                        ),
      //                    validator: (value) {
      // if (value == null || value.isEmpty) {
      //   return 'Please re-enter your password';
      // }
      // if (value != _password_controller.text) {
      //   return 'Passwords do not match';
      // }
      // return null;
      // },
                      ),
    
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: type == "Employee" ? true : false,
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text(
                            "New Employee?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:navyBlueColor,
                              fontSize: 18.0,),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: const Text(
                            "Please Contact HR Team",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: navyBlueColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    /*TextField(
                                              cursorColor: const Color(0xFFFFAE00),
                                              controller: _employee_code_controller,
                                              style:
                                              const TextStyle(color: Color(0xFFFFAE00)),
                                              decoration: InputDecoration(
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xFFFFAE00)),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                disabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xFFFFAE00)),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xFFFFAE00)),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xFFFFAE00)),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                labelStyle: const TextStyle(
                                                    color: Color(0xFFFFAE00)),
                                                // hintText: 'Email / Mobile No.',
                                                labelText: 'Employee Code',
                                                isDense: true,
                                              ),
                                            ),*/
                  ),
                ),
                Visibility(
                  visible: type == "Employee" ? false : true,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: navyBlueColor,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                            ),
                            const Text(
                              "I Agree to the ",
                              style: TextStyle(
                                color:greyColor,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _launchURL();
                                setState(() {
                                  if (showWeb) {
                                    showWeb = false;
                                  } else {
                                    showWeb = true;
                                  }
                                });
                              },
                              child: const Text(
                                "Terms & Conditions.",
                                style: TextStyle(
                                  color: navyBlueColor,
                                  decoration:
                                  TextDecoration.underline,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                     Visibility(
                       visible: isChecked,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_form1Key.currentState!.validate()) {
    
                                  // _email_controller.clear();
                                  // _mobile_controller.clear();
                                  // _password_controller.clear();
                                  // _confirm_password_controller.clear();
                                 // _ref_controller.clear();
    
    
    
                            
                            DeviceInfoPlugin deviceInfo =
                            DeviceInfoPlugin();
                            var model,
                                manufacturer,
                                release,
                                sdkInt,
                                id;
                            if (Platform.isAndroid) {
                              AndroidDeviceInfo androidInfo =
                              await deviceInfo.androidInfo;
                              model = androidInfo.model;
                              manufacturer = androidInfo.manufacturer;
                              release = androidInfo.version.release;
                              sdkInt = androidInfo.version.sdkInt;
                              id = androidInfo.androidId;
                            } else {
                              IosDeviceInfo iosDevice =
                              await deviceInfo.iosInfo;
                              model = iosDevice.name;
                              manufacturer = iosDevice.model;
                              release = iosDevice.systemName;
                              sdkInt = iosDevice.systemVersion;
                              id = iosDevice.identifierForVendor;
                            }
                      
                            String sdk = "$sdkInt";
                              if (Btype == "Business Partner") {
                                          setState(() {
                                            isProgress = true;
                                          });
                                          bool status = await networkCall
                                              .fetchRegistrationPosts(
                                              _Bemail_controller.text,
                                              _Bmobile_controller.text,
                                              _Bpassword_controller.text,
                                              release + " (" + sdk + ")",
                                              model,
                                              latitude,
                                              longitude,
                                              _currentAddress,
                                              BankAdd,
                                              type,
                                              _Bref_controller.text,
                                              "2323",
                      
                                              context);
                                          setState(() {
                      
                      
                                            isProgress = false;
    
    
                                          });
                                          print("status : "+status.toString());
                                          if (status) {
                                            getUSERfer();
                      
                                            Navigator.pushAndRemoveUntil<dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder: (BuildContext context) => SignInScreen("0"),
                                              ),
                                                  (route) => false,
                                                  
                                            );
                                              _Bemail_controller.clear();
                                  _Bmobile_controller.clear();
                                  _Bpassword_controller.clear();
                                  _Bconfirm_password_controller.clear();
                                          }
                                        }
                                           else if (Btype == "Employee") {
                                          setState(() {
                                            isProgress = true;
                                          });
                                          bool status = await networkCall.fetchRegistrationPosts(
                                              _Bemail_controller.text,
                                              _Bmobile_controller.text,
                                              _Bpassword_controller.text,
                                              release + " (" + sdk + ")",
                                              model,
                                              latitude,
                                              longitude,
                                              _currentAddress,
                                              "",
                                              "employee",
                                              type,
                                              "",
                                              context);
                                          setState(() {
                                            isProgress = false;
                                          });
                                          print("status : "+status.toString());
                                          if (status) {
                                            Navigator.pushAndRemoveUntil<dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder: (BuildContext context) => SignInScreen("2"),
                                              ),
                                                  (route) => false,
                                            );
                                              _Bemail_controller.clear();
                                  _Bmobile_controller.clear();
                                  _Bpassword_controller.clear();
                                  _Bconfirm_password_controller.clear();
                                          }
                                        }
                                        else {
                                          setState(() {
                                            isProgress = true;
                                          });
                                          bool status = await networkCall.fetchRegistrationPosts(
                                              _email_controller.text,
                                              _mobile_controller.text,
                                              _password_controller.text,
                                              release + " (" + sdk + ")",
                                              model,
                                              latitude,
                                              longitude,
                                              _currentAddress,
                      
                                              "Customer",
                                              type,
                                              _ref_controller.text.toString(),
                                              "2333",
                                              context);
                                          setState(() {
                                            isProgress = false;
                                          });
                                          if (status) {
                                            Navigator.pushAndRemoveUntil<dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder: (BuildContext context) => SignInScreen("1"),
                                              ),
                                                  (route) => false,
                                            );
                                              _Bemail_controller.clear();
                                  _Bmobile_controller.clear();
                                  _Bpassword_controller.clear();
                                  _Bconfirm_password_controller.clear();
                                          }
                                          }
                            }







                       
                            
                            // if (_Bemail_controller.text.isNotEmpty) {
                            //   if (_Bmobile_controller.text.isNotEmpty) {
                            //     if (_Bmobile_controller.text.length == 10) {
                            //       if (_Bpassword_controller
                            //           .text.isNotEmpty) {
                            //         if (_Bconfirm_password_controller
                            //             .text.isNotEmpty) {
                            //           if (_Bpassword_controller.text ==
                            //               _Bconfirm_password_controller.text) {
                            //             if (Btype == "Business Partner") {
                            //               setState(() {
                            //                 isProgress = true;
                            //               });
                            //               bool status = await networkCall
                            //                   .fetchRegistrationPosts(
                            //                   _Bemail_controller.text,
                            //                   _Bmobile_controller.text,
                            //                   _Bpassword_controller.text,
                            //                   release + " (" + sdk + ")",
                            //                   model,
                            //                   latitude,
                            //                   longitude,
                            //                   _currentAddress,
                            //                   BankAdd,
                            //                   type,
                            //                   _Bref_controller.text,
                            //                   "2323",
                      
                            //                   context);
                            //               setState(() {
                      
                      
                            //                 isProgress = false;
    
    
                            //               });
                            //               print("status : "+status.toString());
                            //               if (status) {
                            //                 getUSERfer();
                      
                            //                 Navigator.pushAndRemoveUntil<dynamic>(
                            //                   context,
                            //                   MaterialPageRoute<dynamic>(
                            //                     builder: (BuildContext context) => SignInScreen("0"),
                            //                   ),
                            //                       (route) => false,
                                                  
                            //                 );
                            //                   _Bemail_controller.clear();
                            //       _Bmobile_controller.clear();
                            //       _Bpassword_controller.clear();
                            //       _Bconfirm_password_controller.clear();
                            //               }
                            //             }
                            //             else if (Btype == "Employee") {
                            //               setState(() {
                            //                 isProgress = true;
                            //               });
                            //               bool status = await networkCall.fetchRegistrationPosts(
                            //                   _Bemail_controller.text,
                            //                   _Bmobile_controller.text,
                            //                   _Bpassword_controller.text,
                            //                   release + " (" + sdk + ")",
                            //                   model,
                            //                   latitude,
                            //                   longitude,
                            //                   _currentAddress,
                            //                   "",
                            //                   "employee",
                            //                   type,
                            //                   "",
                            //                   context);
                            //               setState(() {
                            //                 isProgress = false;
                            //               });
                            //               print("status : "+status.toString());
                            //               if (status) {
                            //                 Navigator.pushAndRemoveUntil<dynamic>(
                            //                   context,
                            //                   MaterialPageRoute<dynamic>(
                            //                     builder: (BuildContext context) => SignInScreen("2"),
                            //                   ),
                            //                       (route) => false,
                            //                 );
                            //                   _Bemail_controller.clear();
                            //       _Bmobile_controller.clear();
                            //       _Bpassword_controller.clear();
                            //       _Bconfirm_password_controller.clear();
                            //               }
                            //             } else {
                            //               setState(() {
                            //                 isProgress = true;
                            //               });
                            //               bool status = await networkCall.fetchRegistrationPosts(
                            //                   _email_controller.text,
                            //                   _mobile_controller.text,
                            //                   _password_controller.text,
                            //                   release + " (" + sdk + ")",
                            //                   model,
                            //                   latitude,
                            //                   longitude,
                            //                   _currentAddress,
                      
                            //                   "Customer",
                            //                   type,
                            //                   _ref_controller.text.toString(),
                            //                   "2333",
                            //                   context);
                            //               setState(() {
                            //                 isProgress = false;
                            //               });
                            //               if (status) {
                            //                 Navigator.pushAndRemoveUntil<dynamic>(
                            //                   context,
                            //                   MaterialPageRoute<dynamic>(
                            //                     builder: (BuildContext context) => SignInScreen("1"),
                            //                   ),
                            //                       (route) => false,
                            //                 );
                            //                   _Bemail_controller.clear();
                            //       _Bmobile_controller.clear();
                            //       _Bpassword_controller.clear();
                            //       _Bconfirm_password_controller.clear();
                            //               }
                            //             }
                                        

                            //           } 
                            //           else {
                            //             _createToast(
                            //                 "Password does not match");
                            //           }
                            //         } else {
                            //           _createToast(
                            //               "Please enter re-confirm password");
                            //         }
                            //       } else {
                            //         _createToast(
                            //             "Please enter password");
                            //       }
                            //     } else {
                            //       _createToast(
                            //           "Please enter valid mobile number");
                            //     }
                            //   } else {
                            //     _createToast(
                            //         "Please enter mobile number");
                            //   }
                            // } else {
                            //   _createToast("Please enter email id");
                            // }
                            //  _Bemail_controller.clear();
                            //       _Bmobile_controller.clear();
                            //       _Bpassword_controller.clear();
                            //       _Bconfirm_password_controller.clear();
    
    
                          
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 16.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 40.0), backgroundColor: navyBlueColor,
                           // shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  employe_login_ui(double height, BuildContext context, double width) {
    return SingleChildScrollView(
      child: CustomPaint(
        painter: HeaderCurvedContainer(context, height_angle, curve),
        child: Container(
          margin: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Existing user?",
                style: TextStyle(
                    color: kWhite,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Route newRoute = MaterialPageRoute(
                      builder: (context) =>
                          OnBoardScreen("signup", Etype == "Customer" ? "0" : Etype == "Business Partner" ? "1" : "2"));
                  Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width, 40.0), backgroundColor: kWhite,
                 // shadowColor: const Color(0xFF111111),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: navyBlueColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              Visibility(
                visible: Etype == "Employee" ? false : true,
                child: Column(
                  children: [
                    const Text(
                      "Sign up with",
                      style: TextStyle(
                          color: navyBlueColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Genie Moneyy",
                      style: TextStyle(
                          color: navyBlueColor,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: type == "Business Partner" ? true : false,

                      child: SingleChildScrollView(

                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: "Partner",
                                  groupValue: BankAdd,
                                  activeColor:navyBlueColor,
                                  onChanged: (value) {
                                    setState(() {
                                      BankAdd = value.toString();
                                    });
                                  },
                                ),
                                const Text(
                                  'Partner',
                                  style: TextStyle(color: navyBlueColor,fontSize: 13),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: "Associate Partner",
                                  groupValue: BankAdd,
                                  activeColor: navyBlueColor,
                                  onChanged: (value) {
                                    setState(() {
                                      BankAdd = value.toString();
                                    });
                                  },
                                ),
                                const Text(
                                  'Associate Partner',
                                  style: TextStyle(color: navyBlueColor,fontSize: 13),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: "Merchant",
                                  groupValue: BankAdd,
                                  activeColor: navyBlueColor,
                                  onChanged: (value) {
                                    setState(() {
                                      BankAdd = value.toString();
                                    });
                                  },
                                ),
                                const Text(
                                  'Merchant',
                                  style: TextStyle(color: navyBlueColor,fontSize: 13),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextField(
                      style:
                      const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.emailAddress,
                      controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Enter Email',
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    TextField(
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.phone,
                      controller: _mobile_controller,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10)
                      ],
                      style:
                      const TextStyle(color: Color(0xFFFFAE00)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Mobile number',
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    TextField(
                      obscureText: true,
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.visiblePassword,
                      controller: _password_controller,
                      style:
                      const TextStyle(color: Color(0xFFFFAE00)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Password',
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    TextField(
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.visiblePassword,
                      controller: _confirm_password_controller,
                      style:
                      const TextStyle(color: Color(0xFFFFAE00)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Re-confirm Password',
                        isDense: true,

                      ),
                    ),

                    Visibility(

                      visible: type == "Business Partner" ? true : false,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.02),

                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xFF3A3A3A),
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
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
                          style: const TextStyle(
                              color: Color(0xFFFFAE00), fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              selected_type =
                                  data ?? "Select Business Type";
                            });


                          },
                          items: business_type_list
                              .map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    TextField(
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.text,
                      controller: _ref_controller,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10)
                      ],
                      style:
                      const TextStyle(color: Color(0xFFFFAE00)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Referal Code',
                        isDense: true,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(
                    top: 10.0),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "New Employee?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: navyBlueColor,
                          fontSize: 18.0,),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      child: const Text(
                        "Please Contact HR Team",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: navyBlueColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                /*TextField(
                                          cursorColor: const Color(0xFFFFAE00),
                                          controller: _employee_code_controller,
                                          style:
                                          const TextStyle(color: Color(0xFFFFAE00)),
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFFFAE00)),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFFFAE00)),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFFFAE00)),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFFFAE00)),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            labelStyle: const TextStyle(
                                                color: Color(0xFFFFAE00)),
                                            // hintText: 'Email / Mobile No.',
                                            labelText: 'Employee Code',
                                            isDense: true,
                                          ),
                                        ),*/
              ),
              Visibility(
                visible: Etype == "Employee" ? false : true,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: navyBlueColor,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Text(
                            "I Agree to the ",
                            style: TextStyle(
                              color: greyColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (showWeb) {
                                  showWeb = false;
                                } else {
                                  showWeb = true;
                                }
                              });
                            },
                            child: const Text(
                              "Terms & Conditions.",
                              style: TextStyle(
                                color: navyBlueColor,
                                decoration:
                                TextDecoration.underline,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        DeviceInfoPlugin deviceInfo =
                        DeviceInfoPlugin();
                        var model,
                            manufacturer,
                            release,
                            sdkInt,
                            id;
                        if (Platform.isAndroid) {
                          AndroidDeviceInfo androidInfo =
                          await deviceInfo.androidInfo;
                          model = androidInfo.model;
                          manufacturer = androidInfo.manufacturer;
                          release = androidInfo.version.release;
                          sdkInt = androidInfo.version.sdkInt;
                          id = androidInfo.androidId;
                        } else {
                          IosDeviceInfo iosDevice =
                          await deviceInfo.iosInfo;
                          model = iosDevice.name;
                          manufacturer = iosDevice.model;
                          release = iosDevice.systemName;
                          sdkInt = iosDevice.systemVersion;
                          id = iosDevice.identifierForVendor;
                        }

                        String sdk = "$sdkInt";
                        if (_email_controller.text.isNotEmpty) {
                          if (_mobile_controller.text.isNotEmpty) {
                            if (_mobile_controller.text.length == 10) {
                              if (_password_controller
                                  .text.isNotEmpty) {
                                if (_confirm_password_controller
                                    .text.isNotEmpty) {
                                  if (_password_controller.text ==
                                      _confirm_password_controller.text) {
                                    if (type == "Customer") {
                                      setState(() {
                                        isProgress = true;
                                      });
                                      // ignore: use_build_context_synchronously
                                      bool status = await networkCall.fetchRegistrationPosts(
                                          _email_controller.text,
                                          _mobile_controller.text,
                                          _password_controller.text,
                                          release + " (" + sdk + ")",
                                          model,
                                          latitude,
                                          longitude,
                                          _currentAddress,

                                          "Customer",
                                          type,
                                          _ref_controller.text.toString(),
                                          _identifier.toString(),
                                          context);
                                      setState(() {


                                        isProgress = false;
                                      });
                                      print("status : "+status.toString());
                                      if (status) {
                                        getUSERfer();

                                        // ignore: use_build_context_synchronously
                                        Navigator.pushAndRemoveUntil<dynamic>(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) => SignInScreen("0"),
                                          ),
                                              (route) => false,
                                        );
                                      }
                                    }
                                    else if (type == "Employee") {
                                      setState(() {
                                        isProgress = true;
                                      });
                                      // ignore: use_build_context_synchronously
                                      bool status = await networkCall.fetchRegistrationPosts(
                                          _email_controller.text,
                                          _mobile_controller.text,
                                          _password_controller.text,
                                          release + " (" + sdk + ")",
                                          model,
                                          latitude,
                                          longitude,
                                          _currentAddress,
                                          "",
                                          "employee",
                                          type,
                                          "",
                                          context);
                                      setState(() {
                                        isProgress = false;
                                      });
                                      print("status : "+status.toString());
                                      if (status) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushAndRemoveUntil<dynamic>(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) => SignInScreen("2"),
                                          ),
                                              (route) => false,
                                        );
                                      }
                                    } else {
                                      setState(() {
                                        isProgress = true;
                                      });
                                      // ignore: use_build_context_synchronously
                                      bool status = await networkCall
                                          .fetchRegistrationPosts(
                                          _email_controller.text,
                                          _mobile_controller.text,
                                          _password_controller.text,
                                          release + " (" + sdk + ")",
                                          model,
                                          latitude,
                                          longitude,
                                          _currentAddress,
                                          selected_type,
                                          type,
                                          _ref_controller.text,
                                          _identifier.toString(),

                                          context);
                                      setState(() {
                                        isProgress = false;
                                      });
                                      if (status) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushAndRemoveUntil<dynamic>(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) => SignInScreen("1"),
                                          ),
                                              (route) => false,
                                        );
                                      }
                                    }
                                  } else {
                                    _createToast(
                                        "Password does not match");
                                  }
                                } else {
                                  _createToast(
                                      "Please enter re-confirm password");
                                }
                              } else {
                                _createToast(
                                    "Please enter password");
                              }
                            } else {
                              _createToast(
                                  "Please enter valid mobile number");
                            }
                          } else {
                            _createToast(
                                "Please enter mobile number");
                          }
                        } else {
                          _createToast("Please enter email id");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width, 40.0),
                        primary: const Color(0xFFFFAE00),
                        shadowColor: const Color(0xFFFFAE00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  Future<void> getim() async {
    String? identifier;
    try {
      identifier = await UniqueIdentifier.serial;
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }

    if (!mounted) return;

    setState(() {
      _identifier = identifier;

    });
    print("identifier"+_identifier!);
  }
}

class HeaderCurvedContainer extends CustomPainter {
  double height;
  double curve;
  BuildContext context;


  HeaderCurvedContainer(this.context, this.height, this.curve);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = navyBlueColor;
    Path path = Path()
      ..relativeLineTo(0, height)
      ..quadraticBezierTo(size.width / 2, curve, size.width, height)
      ..relativeLineTo(0, -height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
_launchURL() async {
  const url = 'https://geniemoneyy.com/terms/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}