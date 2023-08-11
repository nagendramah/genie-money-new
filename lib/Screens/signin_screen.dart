import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/forgot_password_screen.dart';
import 'package:genie_money/Screens/onboard_screen.dart';
// ignore: unused_import
import 'package:genie_money/Screens/signup_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/network.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';
import 'otp_screen.dart';

// ignore: must_be_immutable
class SignInScreen extends StatefulWidget {
  String which_page;

  SignInScreen(this.which_page, {Key? key}) : super(key: key);

  @override
  _SignInScreen createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> with TickerProviderStateMixin {
  final TextEditingController _email_mobile_controller =
      TextEditingController();
  final TextEditingController _bemail_mobile_controller =
      TextEditingController();
  final TextEditingController _eemail_mobile_controller =
      TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _bpassword_controller = TextEditingController();
  final TextEditingController _epassword_controller = TextEditingController();
  final TextEditingController _employee_code_controller =
      TextEditingController();

  late String longitude = '00.00000';
  late String latitude = '00.00000';
  late LocationPermission permission;
  late bool serviceEnabled = false, _isLoading = false;

  late TabController _tabController;
  late String title = "Customer";
  late String btitle = "Business Partner";
  late String etitle = "Employee";

  late double curve;
  late double height_angle;
  late double bcurve;
  late double bheight_angle;
  late double ecurve;
  late double eheight_angle;

  late String selected_type = "Partner";

  List<String> business_type_list = [
    'Partner',
    'Associate Partner',
    'Merchant'
  ];

  bool isFirst = false;

  Future<void> _getLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (serviceEnabled) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
      } else {
        await Geolocator.openLocationSettings();
      }
    } else {
      permission = await Geolocator.requestPermission();
    }
  }

  @override
  void initState() {
    setState(() {
      isFirst = true;
    });
    _tabController = TabController(length: 3, vsync: this);
    if (widget.which_page == "1") {
      _tabController.animateTo(1);
      // title = "Customer";
      isFirst = false;
    } else if (widget.which_page == "2") {
      _tabController.animateTo(2);
      // title = "Employee";
      isFirst = false;
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    /* double bwidth = MediaQuery.of(context).size.width;
    double bheight = MediaQuery.of(context).size.height;
    double ewidth = MediaQuery.of(context).size.width;
    double eheight = MediaQuery.of(context).size.height;*/

    print("height : " + height.toString());
    if (title == "Customer") {
      if (height <= 593) {
        curve = height * 0.85;
        height_angle = height * 0.75;
      } else if (height > 593 && height <= 672) {
        curve = height * 0.63;
        height_angle = height * 0.57;
      } else {
        curve = height * 0.55;
        height_angle = height * 0.50;
      }
      isFirst = false;
    } else if (title != "Business Partner") {
      if (height <= 593) {
        curve = height * 0.95;
        height_angle = height * 0.100;
      } else if (height > 593 && height <= 672) {
        curve = height * 0.85;
        height_angle = height * 0.80;
      } else {
        curve = height * 0.93;
        height_angle = height * 0.75;
      }
    } else {
      if (height <= 593) {
        ecurve = height * 0.85;
        eheight_angle = height * 0.74;
      } else if (height > 593 && height <= 672) {
        ecurve = height * 0.75;
        eheight_angle = height * 0.70;
      } else {
        ecurve = height * 0.63;
        eheight_angle = height * 0.55;
      }
    }

    _getLocation();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TabBar(
                      indicator: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color:navyBlueColor),
                      onTap: (value) {
                        setState(() {
                          if (value == 0) {
                            title = "Customer";
                            if (height <= 593) {
                              curve = height * 0.65;
                              height_angle = height * 0.55;
                            } else if (height > 593 && height <= 672) {
                              curve = height * 0.55;
                              height_angle = height * 0.50;
                            } else {
                              curve = height * 0.52;
                              height_angle = height * 0.42;
                            }
                          } else if (title != "Business Partner") {
                            if (height <= 593) {
                              curve = height * 0.79;
                              height_angle = height * 0.69;
                            } else if (height > 593 && height <= 672) {
                              curve = height * 0.70;
                              height_angle = height * 0.65;
                            } else {
                              curve = height * 0.75;
                              height_angle = height * 0.60;
                            }
                          } else {
                            etitle = "Employee";
                            if (height <= 593) {
                              ecurve = height * 0.77;
                              eheight_angle = height * 0.67;
                            } else if (height > 593 && height <= 672) {
                              ecurve = height * 0.65;
                              eheight_angle = height * 0.58;
                            } else {
                              ecurve = height * 0.55;
                              eheight_angle = height * 0.48;
                            }
                          }
                        });
                      },
                      isScrollable: false,
                      indicatorColor: Colors.white,
                      controller: _tabController,
                      labelColor: kWhite,
                      unselectedLabelColor: navyBlueColor,
                      tabs: [
                        Tab(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            btitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            etitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
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
                )),

/*
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text(
                                "OR",
                                style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                right: MediaQuery.of(context).size.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Visibility(
                                  visible: title=="Employee" ?false:true,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top:10),
                                        child: ElevatedButton(
                                          child: const Text(
                                            "SIGN UP",
                                            style: TextStyle(
                                                color: Color(0xFF111111),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //fixedSize: Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
                                            primary: const Color(0xFFFFAE00),
                                            shadowColor: const Color(0xFFFFAE00),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            Route newRoute = MaterialPageRoute(
                                                builder: (context) => OnBoardScreen("signin", title == "Customer" ? "0" : title == "Business Partner" ? "1" : "2"));
                                            Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top:10),
                                        child: ElevatedButton(
                                          child: const Text(
                                            "DEMO",
                                            style: TextStyle(
                                                color: Color(0xFF111111),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //fixedSize: Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
                                            primary: const Color(0xFFFFAE00),
                                            shadowColor: const Color(0xFFFFAE00),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          onPressed: () async{
                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                            if(title=="Customer"){
                                              prefs.setString("type",title);

                                            }else{
                                              prefs.setString("type",selected_type);
                                            }

                                            Navigator.pushAndRemoveUntil<dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder: (BuildContext context) => const Home(),
                                              ),
                                                  (route) => false,);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                    visible: title=="Employee"?true:false,
                                    child: Container(
                                      child: Column(
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
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )*/
                //customer_login_ui(height, context, width),
              ],
            ),
            Visibility(
              visible: _isLoading,
              child: Center(
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

  Widget customer_login_ui(double height, BuildContext context, double width) {
    return CustomPaint(
      child: Container(
        margin: EdgeInsets.only(
            top: 10.0,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to",
              style: TextStyle(
                  color:kWhite,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Genie Moneyy',
              style: TextStyle(
                fontSize: 36.0,
                color: kWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please login to continue',
              style: const TextStyle(
                  fontSize: 18.0,
                  color: kWhite,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                   style: const TextStyle(color:kWhite),
                  cursorColor:kWhite,
                controller: _email_mobile_controller,
                decoration: InputDecoration(
                 focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelStyle: const TextStyle(color:kWhite),
                  labelText: 'Email / Mobile No.',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                 style: const TextStyle(color:kWhite),
                  cursorColor:kWhite,
                controller: _password_controller,
                decoration: InputDecoration(
                 focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                      labelStyle: const TextStyle(color:kWhite),
                  labelText: 'Password',
                  isDense: true,
                ),
                obscureText: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: ElevatedButton(
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      color: navyBlueColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                      width * 0.90, MediaQuery.of(context).size.height * 0.05), 
                      backgroundColor: kWhite,
                //  shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () async {
                  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                  var model, manufacturer, release, sdkInt, id;
                  if (Platform.isAndroid) {
                    AndroidDeviceInfo androidInfo =
                        await deviceInfo.androidInfo;
                    model = androidInfo.model;
                    manufacturer = androidInfo.manufacturer;
                    release = androidInfo.version.release;
                    sdkInt = androidInfo.version.sdkInt;
                    id = androidInfo.androidId;
                  } else {
                    IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
                    model = iosDevice.name;
                    manufacturer = iosDevice.model;
                    release = iosDevice.systemName;
                    sdkInt = iosDevice.systemVersion;
                    id = iosDevice.identifierForVendor;
                  }
                  String sdk = "$sdkInt";
                  if (_email_mobile_controller.text.isNotEmpty) {
                    if (_password_controller.text.isNotEmpty) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_email_mobile_controller.text);
                      bool mobileValid = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                          .hasMatch(_email_mobile_controller.text);
                      if (emailValid || mobileValid) {
                        if (title == "Business Partner") {
                          NetworkCall networdCall = NetworkCall();
                          setState(() {
                            _isLoading = true;
                          });
                          bool status = await networdCall.generateOtp(
                              _bemail_mobile_controller.text,
                              _bpassword_controller.text,
                              btitle,
                              "",
                              context);
                          setState(() {
                            _isLoading = false;
                          });
                          //var status =true;
                          //if(selected_type=='Retailer'){
                          if (status) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                    _email_mobile_controller.text,
                                    _password_controller.text,
                                    selected_type,
                                    ""),
                              ),
                            );
                          }
                          //}
                          /*if (status) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type),),);
                            }*/
                        } else if (title == "Employee") {
                          NetworkCall networdCall = NetworkCall();
                          setState(() {
                            _isLoading = true;
                          });
                          bool status = await networdCall.generateOtp(
                              _eemail_mobile_controller.text,
                              _epassword_controller.text,
                              title,
                              _employee_code_controller.text,
                              context);
                          setState(() {
                            _isLoading = false;
                          });
                          if (status) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                    _eemail_mobile_controller.text,
                                    _epassword_controller.text,
                                    title,
                                    _employee_code_controller.text),
                              ),
                            );
                          }
                        } else {
                          NetworkCall networdCall = NetworkCall();
                          setState(() {
                            _isLoading = true;
                          });
                          bool status = await networdCall.generateOtp(
                              _email_mobile_controller.text,
                              _password_controller.text,
                              title,
                              "",
                              context);
                          setState(() {
                            _isLoading = false;
                          });
                          if (status) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                    _email_mobile_controller.text,
                                    _password_controller.text,
                                    title,
                                    ""),
                              ),
                            );
                          }
                        }
                      } else {
                        _createToast("Please enter valid email id / mobile no");
                      }
                    } else {
                      _createToast("Please enter password");
                    }
                  } else {
                    _createToast("Please enter your email id / mobile no");
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()));
                },
                child: const Text(
                  "FORGOT PASSWORD ?",
                  style: TextStyle(
                    color:kWhite,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ),
              
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 130),
                        child: Center(
                          child: Text(
                            "OR",
                            style: TextStyle(
                                color: navyBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Visibility(
                              visible: title == "Employee" ? false : true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      child: const Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                            color:kWhite,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        //fixedSize: Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
                                        backgroundColor: navyBlueColor,
                                        //shadowColor: const Color(0xFFFFAE00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        Route newRoute = MaterialPageRoute(
                                            builder: (context) => OnBoardScreen(
                                                "signin",
                                                title == "Customer"
                                                    ? "0"
                                                    : btitle ==
                                                            "Business Partner"
                                                        ? "1"
                                                        : "2"));
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                newRoute, (route) => false);
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      child: const Text(
                                        "DEMO",
                                        style: TextStyle(
                                            color:kWhite,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        //fixedSize: Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
                                        backgroundColor: navyBlueColor,
                                        //shadowColor: const Color(0xFFFFAE00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      onPressed: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        if (title == "Customer") {
                                          prefs.setString("type", title);
                                        } else {
                                          prefs.setString(
                                              "type", selected_type);
                                        }

                                        Navigator.pushAndRemoveUntil<dynamic>(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) =>
                                                Home(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                                visible: title == "Employee" ? true : false,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "New Employee?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
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
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )

            /*const SizedBox(
                height: 100.0,
              ),*/
          ],
        ),
      ),
      painter: HeaderCurvedContainer(context, height_angle, curve),
    );
    // return/* CustomPaint(
    //   child:*/
    //   Container(
    //     /*margin: EdgeInsets.only(
    //         top: 10.0,
    //         left: MediaQuery.of(context).size.width * 0.05,
    //         right: MediaQuery.of(context).size.width * 0.05),*/
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         CustomPaint(
    //           child: Container(
    //             margin: EdgeInsets.only(
    //                 top: 10.0,
    //                 left: MediaQuery.of(context).size.width * 0.05,
    //                 right: MediaQuery.of(context).size.width * 0.05),
    //             padding: EdgeInsets.only(bottom: 10),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 const Text(
    //                   "Welcome to",
    //                   style: TextStyle(
    //                       color: Color(0xFF111111),
    //                       fontSize: 18.0,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //                 const Text(
    //                   'Genie Moneyy',
    //                   style: TextStyle(
    //                     fontSize: 36.0,
    //                     color: Color(0xFF111111),
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Text(
    //                   'Please Login As $title To Continue',
    //                   style: const TextStyle(
    //                       fontSize: 18.0,
    //                       color: Color(0xFF111111),
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(top: 30.0),
    //                   child: TextFormField(
    //                     controller: _email_mobile_controller,
    //                     decoration: InputDecoration(
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                       ),
    //                       labelText: 'Email / Mobile No.',
    //                       isDense: true,
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(
    //                       top: 10.0),
    //                   child: TextField(
    //                     controller: _password_controller,
    //                     decoration: InputDecoration(
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                       ),
    //                       labelText: 'Password',
    //                       isDense: true,
    //                     ),
    //                     obscureText: true,
    //                   ),
    //                 ),
    //                 Visibility(
    //                   visible: title == "Business Partner" ? true : false,
    //                   child: Container(
    //                     margin: const EdgeInsets.only(top: 10.0),
    //                     child: DropdownButtonFormField<String>(
    //                       dropdownColor: const Color(0xFFFFAE00),
    //                       isExpanded: true,
    //                       decoration: const InputDecoration(
    //                         focusedBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         disabledBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         enabledBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         border: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         isDense: true,
    //                       ),
    //                       value: selected_type,
    //                       isDense: true,
    //                       icon: const Icon(
    //                         Icons.arrow_drop_down,
    //                         color: Color(0xFF111111),
    //                       ),
    //                       iconSize: 24,
    //                       elevation: 16,
    //                       style: const TextStyle(color: Color(0xFF111111), fontSize: 18),
    //                       onChanged: (String? data) {
    //                         setState(() {
    //                           selected_type = data ?? "Merchant";
    //                         });
    //                       },
    //                       items: business_type_list
    //                           .map<DropdownMenuItem<String>>((String value) {
    //                         return DropdownMenuItem<String>(
    //                           value: value,
    //                           child: Text(value),
    //                         );
    //                       }).toList(),
    //                     ),
    //                   ),
    //                 ),
    //                 Visibility(
    //                   visible: title == "Employee" ? true : false,
    //                   child: Container(
    //                     margin: const EdgeInsets.only(
    //                         top: 10.0),
    //                     child: TextField(
    //                       controller: _employee_code_controller,
    //                       decoration: InputDecoration(
    //                         border: OutlineInputBorder(
    //                           borderRadius: BorderRadius.circular(10.0),
    //                         ),
    //                         labelText: 'Employee Code',
    //                         isDense: true,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(
    //                       top: 20.0),
    //                   child: ElevatedButton(
    //                     child: const Text(
    //                       "LOGIN",
    //                       style: TextStyle(
    //                           color: Color(0xFFFFAE00),
    //                           fontSize: 15.0,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     style: ElevatedButton.styleFrom(
    //                       fixedSize: Size(
    //                           width * 0.90, MediaQuery.of(context).size.height * 0.05),
    //                       primary: const Color(0xFF111111),
    //                       shadowColor: const Color(0xFFFFAE00),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(5.0),
    //                       ),
    //                     ),
    //                     onPressed: () async {
    //                       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //                       var model, manufacturer, release, sdkInt, id;
    //                       if (Platform.isAndroid) {
    //                         AndroidDeviceInfo androidInfo =
    //                         await deviceInfo.androidInfo;
    //                         model = androidInfo.model;
    //                         manufacturer = androidInfo.manufacturer;
    //                         release = androidInfo.version.release;
    //                         sdkInt = androidInfo.version.sdkInt;
    //                         id = androidInfo.androidId;
    //                       } else {
    //                         IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
    //                         model = iosDevice.name;
    //                         manufacturer = iosDevice.model;
    //                         release = iosDevice.systemName;
    //                         sdkInt = iosDevice.systemVersion;
    //                         id = iosDevice.identifierForVendor;
    //                       }
    //
    //                       String sdk = "$sdkInt";
    //
    //                       if (_email_mobile_controller.text.isNotEmpty) {
    //                         if (_password_controller.text.isNotEmpty) {
    //                           bool emailValid = RegExp(
    //                               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //                               .hasMatch(_email_mobile_controller.text);
    //                           bool mobileValid =
    //                           RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
    //                               .hasMatch(_email_mobile_controller.text);
    //                           if (emailValid || mobileValid) {
    //                             if (title == "Business Partner") {
    //                               NetworkCall networdCall = NetworkCall();
    //                               setState(() {
    //                                 _isLoading = true;
    //                               });
    //                               bool status = await networdCall.generateOtp(
    //                                   _email_mobile_controller.text,
    //                                   _password_controller.text,
    //                                   title,
    //                                   "",
    //                                   context);
    //                                status =true;
    //                               //if(selected_type=='Retailer'){
    //                                 if (status) {
    //                                   Navigator.push(
    //                                     context,
    //                                     MaterialPageRoute(
    //                                       builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type,""),),);
    //                                 }
    //                               //}
    //
    //                             }else if (title == "Employee"){
    //                               NetworkCall networdCall = NetworkCall();
    //                               setState(() {
    //                                 _isLoading = true;
    //                               });
    //                               bool status = await networdCall.generateOtp(
    //                                   _email_mobile_controller.text,
    //                                   _password_controller.text,
    //                                   title,
    //                                   _employee_code_controller.text,
    //                                   context);
    //                               setState(() {
    //                                 _isLoading = false;
    //                               });
    //                               if (status) {
    //                                 Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                     builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,_employee_code_controller.text),),);
    //                               }
    //                             } else {
    //                               NetworkCall networdCall = NetworkCall();
    //                               setState(() {
    //                                 _isLoading = true;
    //                               });
    //                               bool status = await networdCall.generateOtp(
    //                                   _email_mobile_controller.text,
    //                                   _password_controller.text,
    //                                   title,
    //                                   "",
    //                                   context);
    //                               setState(() {
    //                                 _isLoading = false;
    //                               });
    //                               if (status) {
    //                                 Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                     builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,""),),);
    //                               }
    //                             }
    //                           } else {
    //                             _createToast(
    //                                 "Please enter valid email id / mobile no");
    //                           }
    //                         } else {
    //                           _createToast("Please enter password");
    //                         }
    //                       } else {
    //                         _createToast("Please enter your email id / mobile no");
    //                       }
    //                     },
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(
    //                       top: 10.0),
    //                   child: InkWell(
    //                     onTap: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => const ForgotPassword()));
    //                     },
    //                     child: const Text(
    //                       "FORGOT PASSWORD ?",
    //                       style: TextStyle(
    //                         color: Color(0xFF111111),
    //                         fontSize: 15.0,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 /*const SizedBox(
    //                   height: 100.0,
    //                 ),*/
    //
    //               ],
    //             ),
    //           ),
    //           //painter: HeaderCurvedContainer(context, height_angle, curve),
    //         ),
    //         Center(
    //           child: Text(
    //             "OR",
    //             style: TextStyle(
    //                 color: Color(0xFFFFAE00),
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 20.0),
    //           ),
    //         ),
    //         Container(
    //           margin: EdgeInsets.only(
    //               top: 10.0,
    //               left: MediaQuery.of(context).size.width * 0.05,
    //               right: MediaQuery.of(context).size.width * 0.05),
    //           child: Column(
    //             children: [
    //               Visibility(
    //                 visible: title=="Employee" ?false:true,
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       margin: EdgeInsets.only(top: height * 0.10),
    //                       child: ElevatedButton(
    //                         child: const Text(
    //                           "SIGN UP",
    //                           style: TextStyle(
    //                               color: Color(0xFF111111),
    //                               fontSize: 15.0,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         style: ElevatedButton.styleFrom(
    //                           fixedSize:
    //                           Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
    //                           primary: const Color(0xFFFFAE00),
    //                           shadowColor: const Color(0xFFFFAE00),
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(5.0),
    //                           ),
    //                         ),
    //                         onPressed: () {
    //                           Route newRoute = MaterialPageRoute(
    //                               builder: (context) => OnBoardScreen("signin", title == "Customer" ? "0" : title == "Business Partner" ? "1" : "2"));
    //                           Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
    //                         },
    //                       ),
    //                     ),
    //                     Container(
    //                       margin: EdgeInsets.only(top:10),
    //                       child: ElevatedButton(
    //                         child: const Text(
    //                           "DEMO",
    //                           style: TextStyle(
    //                               color: Color(0xFF111111),
    //                               fontSize: 15.0,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         style: ElevatedButton.styleFrom(
    //                           fixedSize:
    //                           Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
    //                           primary: const Color(0xFFFFAE00),
    //                           shadowColor: const Color(0xFFFFAE00),
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(5.0),
    //                           ),
    //                         ),
    //                         onPressed: () async{
    //                           SharedPreferences prefs = await SharedPreferences.getInstance();
    //                           if(title=="Customer"){
    //                             prefs.setString("type",title);
    //
    //                           }else{
    //                             prefs.setString("type",selected_type);
    //                           }
    //
    //                           Navigator.pushAndRemoveUntil<dynamic>(
    //                               context,
    //                               MaterialPageRoute<dynamic>(
    //                               builder: (BuildContext context) => const Home(),
    //                           ),
    //                           (route) => false,);
    //                         },
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Visibility(
    //                 visible: title=="Employee"?true:false,
    //                   child: Container(
    //                     margin: EdgeInsets.only(top: 10),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.stretch,
    //                       children: [
    //                         Container(
    //                           margin: EdgeInsets.only(top: 10),
    //                           child: Text(
    //                               "New Employee?",
    //                               textAlign: TextAlign.center,
    //                               style: TextStyle(
    //                                 color: Color(0xFFFFAE00),
    //                                 fontSize: 18.0,),
    //                           ),
    //                         ),
    //                         Container(
    //                           margin: EdgeInsets.only(top: 10, bottom: 10),
    //                           child: Text(
    //                             "Please Contact HR Team",
    //                             textAlign: TextAlign.center,
    //                             style: TextStyle(
    //                                 color: Color(0xFFFFAE00),
    //                                 fontSize: 18.0,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   )
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    /*painter: HeaderCurvedContainer(context, height_angle, curve),
    );*/
  }

  Widget business_login_ui(double bheight, BuildContext context, double width) {
    return CustomPaint(
      painter: HeaderCurvedContainer(context, height_angle, curve),
      child: Container(
        margin: EdgeInsets.only(
            top: 10.0,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to",
              style: TextStyle(
                  color: kWhite,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Genie Moneyy',
              style: TextStyle(
                fontSize: 36.0,
                color: kWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Please Login with your Business Partner login credentials to continue',
              style: TextStyle(
                  fontSize: 18.0,
                  color:kWhite,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                 style: const TextStyle(color:kWhite),
                  cursorColor:kWhite,
                controller: _bemail_mobile_controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                     labelStyle: const TextStyle(color:kWhite),
                  labelText: 'Email / Mobile No.',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                 style: const TextStyle(color:kWhite),
                  cursorColor:kWhite,
                controller: _bpassword_controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                     labelStyle: const TextStyle(color:kWhite),
                  labelText: 'Password',
                  isDense: true,
                ),
                obscureText: true,
              ),
            ),
            Visibility(
              visible: btitle == "Business Partner" ? true : false,
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: DropdownButtonFormField<String>(
                  dropdownColor: navyBlueColor,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    isDense: true,
                  ),
                  value: selected_type,
                  isDense: true,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color:kWhite,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style:
                      const TextStyle(color: kWhite, fontSize: 18),
                  onChanged: (String? data) {
                    setState(() {
                      selected_type = data ??
                          "Partner"
                              "";
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: ElevatedButton(
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      color: navyBlueColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                      width * 0.90, MediaQuery.of(context).size.height * 0.05), backgroundColor: kWhite,
                 // shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () async {
                  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                  var model, manufacturer, release, sdkInt, id;
                  if (Platform.isAndroid) {
                    AndroidDeviceInfo androidInfo =
                        await deviceInfo.androidInfo;
                    model = androidInfo.model;
                    manufacturer = androidInfo.manufacturer;
                    release = androidInfo.version.release;
                    sdkInt = androidInfo.version.sdkInt;

                    id = androidInfo.androidId;
                  } else {
                    IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
                    model = iosDevice.name;
                    manufacturer = iosDevice.model;
                    release = iosDevice.systemName;
                    sdkInt = iosDevice.systemVersion;
                    id = iosDevice.identifierForVendor;
                  }

                  String sdk = "$sdkInt";

                  if (_bemail_mobile_controller.text.isNotEmpty) {
                    if (_bpassword_controller.text.isNotEmpty) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_bemail_mobile_controller.text);
                      bool mobileValid = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                          .hasMatch(_bemail_mobile_controller.text);
                      if (emailValid || mobileValid) {
                        if (btitle == "Business Partner") {
                          NetworkCall networdCall = NetworkCall();
                          setState(() {
                            _isLoading = true;
                          });
                          // ignore: use_build_context_synchronously
                          bool status = await networdCall.generateOtp(
                              _bemail_mobile_controller.text,
                              _bpassword_controller.text,
                              btitle,
                              "",
                              context);
                          setState(() {
                            _isLoading = false;
                          });
                          //var status =true;
                          //if(selected_type=='Retailer'){
                          if (status) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                    _bemail_mobile_controller.text,
                                    _bpassword_controller.text,
                                    selected_type,
                                    ""),
                              ),
                            );
                          }
                          //}
                          /*if (status) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type),),);
                            }*/
                        } else if (title == "Employee") {
                          NetworkCall networdCall = NetworkCall();
                          setState(() {
                            _isLoading = true;
                          });
                          bool status = await networdCall.generateOtp(
                              _email_mobile_controller.text,
                              _password_controller.text,
                              title,
                              _employee_code_controller.text,
                              context);
                          setState(() {
                            _isLoading = false;
                          });
                          if (status) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                    _eemail_mobile_controller.text,
                                    _epassword_controller.text,
                                    etitle,
                                    _employee_code_controller.text),
                              ),
                            );
                          }
                        } else {
                          NetworkCall networdCall = NetworkCall();
                          setState(() {
                            _isLoading = true;
                          });
                          bool status = await networdCall.generateOtp(
                              _eemail_mobile_controller.text,
                              _epassword_controller.text,
                              etitle,
                              "",
                              context);
                          setState(() {
                            _isLoading = false;
                          });
                          if (status) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                    _email_mobile_controller.text,
                                    _password_controller.text,
                                    title,
                                    ""),
                              ),
                            );
                          }
                        }
                      } else {
                        _createToast("Please enter valid email id / mobile no");
                      }
                    } else {
                      _createToast("Please enter password");
                    }
                  } else {
                    _createToast("Please enter your email id / mobile no");
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()));
                },
                child: Column(
                  children: [
                    const Text(
                      "FORGOT PASSWORD ?",
                      style: TextStyle(
                        color:kWhite,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                        SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Center(
                          child: Text(
                            "OR",
                            style: TextStyle(
                                color: navyBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Visibility(
                              visible: title == "Employee" ? false : true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      child: const Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                            color: kWhite,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        //fixedSize: Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
                                        backgroundColor: navyBlueColor,
                                        //shadowColor: const Color(0xFFFFAE00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        Route newRoute = MaterialPageRoute(
                                            builder: (context) => OnBoardScreen(
                                                "signin",
                                                btitle == "Business Partner"
                                                    ? "1"
                                                    : "2"));
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                newRoute, (route) => false);
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      child: const Text(
                                        "DEMO",
                                        style: TextStyle(
                                            color: kWhite,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        //fixedSize: Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
                                        backgroundColor: navyBlueColor,
                                        //shadowColor: const Color(0xFFFFAE00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      onPressed: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        if (btitle == "Business Partner") {
                                          prefs.setString(
                                              "type", selected_type);
                                        } else {
                                          prefs.setString(
                                              "type", selected_type);
                                        }

                                        Navigator.pushAndRemoveUntil<dynamic>(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) =>
                                                const Home(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                                visible: title == "Employee" ? true : false,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "New Employee?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: navyBlueColor,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Text(
                                          "Please Contact HR Team",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:navyBlueColor,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
            /*const SizedBox(
                height: 100.0,
              ),*/
          ],
        ),
      ),
    );
    // return/* CustomPaint(
    //   child:*/
    //   Container(
    //     /*margin: EdgeInsets.only(
    //         top: 10.0,
    //         left: MediaQuery.of(context).size.width * 0.05,
    //         right: MediaQuery.of(context).size.width * 0.05),*/
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         CustomPaint(
    //           child: Container(
    //             margin: EdgeInsets.only(
    //                 top: 10.0,
    //                 left: MediaQuery.of(context).size.width * 0.05,
    //                 right: MediaQuery.of(context).size.width * 0.05),
    //             padding: EdgeInsets.only(bottom: 10),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 const Text(
    //                   "Welcome to",
    //                   style: TextStyle(
    //                       color: Color(0xFF111111),
    //                       fontSize: 18.0,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //                 const Text(
    //                   'Genie Moneyy',
    //                   style: TextStyle(
    //                     fontSize: 36.0,
    //                     color: Color(0xFF111111),
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Text(
    //                   'Please Login As $title To Continue',
    //                   style: const TextStyle(
    //                       fontSize: 18.0,
    //                       color: Color(0xFF111111),
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(top: 30.0),
    //                   child: TextFormField(
    //                     controller: _email_mobile_controller,
    //                     decoration: InputDecoration(
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                       ),
    //                       labelText: 'Email / Mobile No.',
    //                       isDense: true,
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(
    //                       top: 10.0),
    //                   child: TextField(
    //                     controller: _password_controller,
    //                     decoration: InputDecoration(
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                       ),
    //                       labelText: 'Password',
    //                       isDense: true,
    //                     ),
    //                     obscureText: true,
    //                   ),
    //                 ),
    //                 Visibility(
    //                   visible: title == "Business Partner" ? true : false,
    //                   child: Container(
    //                     margin: const EdgeInsets.only(top: 10.0),
    //                     child: DropdownButtonFormField<String>(
    //                       dropdownColor: const Color(0xFFFFAE00),
    //                       isExpanded: true,
    //                       decoration: const InputDecoration(
    //                         focusedBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         disabledBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         enabledBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         border: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         isDense: true,
    //                       ),
    //                       value: selected_type,
    //                       isDense: true,
    //                       icon: const Icon(
    //                         Icons.arrow_drop_down,
    //                         color: Color(0xFF111111),
    //                       ),
    //                       iconSize: 24,
    //                       elevation: 16,
    //                       style: const TextStyle(color: Color(0xFF111111), fontSize: 18),
    //                       onChanged: (String? data) {
    //                         setState(() {
    //                           selected_type = data ?? "Merchant";
    //                         });
    //                       },
    //                       items: business_type_list
    //                           .map<DropdownMenuItem<String>>((String value) {
    //                         return DropdownMenuItem<String>(
    //                           value: value,
    //                           child: Text(value),
    //                         );
    //                       }).toList(),
    //                     ),
    //                   ),
    //                 ),
    //                 Visibility(
    //                   visible: title == "Employee" ? true : false,
    //                   child: Container(
    //                     margin: const EdgeInsets.only(
    //                         top: 10.0),
    //                     child: TextField(
    //                       controller: _employee_code_controller,
    //                       decoration: InputDecoration(
    //                         border: OutlineInputBorder(
    //                           borderRadius: BorderRadius.circular(10.0),
    //                         ),
    //                         labelText: 'Employee Code',
    //                         isDense: true,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(
    //                       top: 20.0),
    //                   child: ElevatedButton(
    //                     child: const Text(
    //                       "LOGIN",
    //                       style: TextStyle(
    //                           color: Color(0xFFFFAE00),
    //                           fontSize: 15.0,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     style: ElevatedButton.styleFrom(
    //                       fixedSize: Size(
    //                           width * 0.90, MediaQuery.of(context).size.height * 0.05),
    //                       primary: const Color(0xFF111111),
    //                       shadowColor: const Color(0xFFFFAE00),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(5.0),
    //                       ),
    //                     ),
    //                     onPressed: () async {
    //                       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //                       var model, manufacturer, release, sdkInt, id;
    //                       if (Platform.isAndroid) {
    //                         AndroidDeviceInfo androidInfo =
    //                         await deviceInfo.androidInfo;
    //                         model = androidInfo.model;
    //                         manufacturer = androidInfo.manufacturer;
    //                         release = androidInfo.version.release;
    //                         sdkInt = androidInfo.version.sdkInt;
    //                         id = androidInfo.androidId;
    //                       } else {
    //                         IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
    //                         model = iosDevice.name;
    //                         manufacturer = iosDevice.model;
    //                         release = iosDevice.systemName;
    //                         sdkInt = iosDevice.systemVersion;
    //                         id = iosDevice.identifierForVendor;
    //                       }
    //
    //                       String sdk = "$sdkInt";
    //
    //                       if (_email_mobile_controller.text.isNotEmpty) {
    //                         if (_password_controller.text.isNotEmpty) {
    //                           bool emailValid = RegExp(
    //                               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //                               .hasMatch(_email_mobile_controller.text);
    //                           bool mobileValid =
    //                           RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
    //                               .hasMatch(_email_mobile_controller.text);
    //                           if (emailValid || mobileValid) {
    //                             if (title == "Business Partner") {
    //                               NetworkCall networdCall = NetworkCall();
    //                               setState(() {
    //                                 _isLoading = true;
    //                               });
    //                               bool status = await networdCall.generateOtp(
    //                                   _email_mobile_controller.text,
    //                                   _password_controller.text,
    //                                   title,
    //                                   "",
    //                                   context);
    //                                status =true;
    //                               //if(selected_type=='Retailer'){
    //                                 if (status) {
    //                                   Navigator.push(
    //                                     context,
    //                                     MaterialPageRoute(
    //                                       builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type,""),),);
    //                                 }
    //                               //}
    //
    //                             }else if (title == "Employee"){
    //                               NetworkCall networdCall = NetworkCall();
    //                               setState(() {
    //                                 _isLoading = true;
    //                               });
    //                               bool status = await networdCall.generateOtp(
    //                                   _email_mobile_controller.text,
    //                                   _password_controller.text,
    //                                   title,
    //                                   _employee_code_controller.text,
    //                                   context);
    //                               setState(() {
    //                                 _isLoading = false;
    //                               });
    //                               if (status) {
    //                                 Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                     builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,_employee_code_controller.text),),);
    //                               }
    //                             } else {
    //                               NetworkCall networdCall = NetworkCall();
    //                               setState(() {
    //                                 _isLoading = true;
    //                               });
    //                               bool status = await networdCall.generateOtp(
    //                                   _email_mobile_controller.text,
    //                                   _password_controller.text,
    //                                   title,
    //                                   "",
    //                                   context);
    //                               setState(() {
    //                                 _isLoading = false;
    //                               });
    //                               if (status) {
    //                                 Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                     builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,""),),);
    //                               }
    //                             }
    //                           } else {
    //                             _createToast(
    //                                 "Please enter valid email id / mobile no");
    //                           }
    //                         } else {
    //                           _createToast("Please enter password");
    //                         }
    //                       } else {
    //                         _createToast("Please enter your email id / mobile no");
    //                       }
    //                     },
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(
    //                       top: 10.0),
    //                   child: InkWell(
    //                     onTap: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => const ForgotPassword()));
    //                     },
    //                     child: const Text(
    //                       "FORGOT PASSWORD ?",
    //                       style: TextStyle(
    //                         color: Color(0xFF111111),
    //                         fontSize: 15.0,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 /*const SizedBox(
    //                   height: 100.0,
    //                 ),*/
    //
    //               ],
    //             ),
    //           ),
    //           //painter: HeaderCurvedContainer(context, height_angle, curve),
    //         ),
    //         Center(
    //           child: Text(
    //             "OR",
    //             style: TextStyle(
    //                 color: Color(0xFFFFAE00),
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 20.0),
    //           ),
    //         ),
    //         Container(
    //           margin: EdgeInsets.only(
    //               top: 10.0,
    //               left: MediaQuery.of(context).size.width * 0.05,
    //               right: MediaQuery.of(context).size.width * 0.05),
    //           child: Column(
    //             children: [
    //               Visibility(
    //                 visible: title=="Employee" ?false:true,
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       margin: EdgeInsets.only(top: height * 0.10),
    //                       child: ElevatedButton(
    //                         child: const Text(
    //                           "SIGN UP",
    //                           style: TextStyle(
    //                               color: Color(0xFF111111),
    //                               fontSize: 15.0,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         style: ElevatedButton.styleFrom(
    //                           fixedSize:
    //                           Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
    //                           primary: const Color(0xFFFFAE00),
    //                           shadowColor: const Color(0xFFFFAE00),
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(5.0),
    //                           ),
    //                         ),
    //                         onPressed: () {
    //                           Route newRoute = MaterialPageRoute(
    //                               builder: (context) => OnBoardScreen("signin", title == "Customer" ? "0" : title == "Business Partner" ? "1" : "2"));
    //                           Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
    //                         },
    //                       ),
    //                     ),
    //                     Container(
    //                       margin: EdgeInsets.only(top:10),
    //                       child: ElevatedButton(
    //                         child: const Text(
    //                           "DEMO",
    //                           style: TextStyle(
    //                               color: Color(0xFF111111),
    //                               fontSize: 15.0,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         style: ElevatedButton.styleFrom(
    //                           fixedSize:
    //                           Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
    //                           primary: const Color(0xFFFFAE00),
    //                           shadowColor: const Color(0xFFFFAE00),
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(5.0),
    //                           ),
    //                         ),
    //                         onPressed: () async{
    //                           SharedPreferences prefs = await SharedPreferences.getInstance();
    //                           if(title=="Customer"){
    //                             prefs.setString("type",title);
    //
    //                           }else{
    //                             prefs.setString("type",selected_type);
    //                           }
    //
    //                           Navigator.pushAndRemoveUntil<dynamic>(
    //                               context,
    //                               MaterialPageRoute<dynamic>(
    //                               builder: (BuildContext context) => const Home(),
    //                           ),
    //                           (route) => false,);
    //                         },
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Visibility(
    //                 visible: title=="Employee"?true:false,
    //                   child: Container(
    //                     margin: EdgeInsets.only(top: 10),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.stretch,
    //                       children: [
    //                         Container(
    //                           margin: EdgeInsets.only(top: 10),
    //                           child: Text(
    //                               "New Employee?",
    //                               textAlign: TextAlign.center,
    //                               style: TextStyle(
    //                                 color: Color(0xFFFFAE00),
    //                                 fontSize: 18.0,),
    //                           ),
    //                         ),
    //                         Container(
    //                           margin: EdgeInsets.only(top: 10, bottom: 10),
    //                           child: Text(
    //                             "Please Contact HR Team",
    //                             textAlign: TextAlign.center,
    //                             style: TextStyle(
    //                                 color: Color(0xFFFFAE00),
    //                                 fontSize: 18.0,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   )
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    /*painter: HeaderCurvedContainer(context, height_angle, curve),
    );*/
  }

  Widget employe_login_ui(double eheight, BuildContext context, double width) {
    return CustomPaint(
      child: Container(
        margin: EdgeInsets.only(
            top: 10.0,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to",
              style: TextStyle(
                  color: kWhite,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Genie Moneyy',
              style: TextStyle(
                fontSize: 36.0,
                color:kWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please login to continue',
              style: const TextStyle(
                  fontSize: 18.0,
                  color: kWhite,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                 style: const TextStyle(color:kWhite),
                  cursorColor:kWhite,
                controller: _eemail_mobile_controller,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                     labelStyle: const TextStyle(color:kWhite),
                  labelText: 'Email / Mobile No.',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                 style: const TextStyle(color:kWhite),
                  cursorColor:kWhite,
                controller: _epassword_controller,
                decoration:  InputDecoration(
                    focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: kWhite),
                    ),
                   disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:  kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:  kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:  kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                     labelStyle: const TextStyle(color:kWhite),
                  labelText: 'Password',
                  isDense: true,
                ),
                obscureText: true,
              ),
            ),
            Visibility(
              visible: title == "Business Partner" ? true : false,
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: DropdownButtonFormField<String>(
                  dropdownColor: navyBlueColor,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:  kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:  kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:  kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    isDense: true,
                  ),
                  value: selected_type,
                  isDense: true,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color:  kWhite,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style:
                      const TextStyle(color:  kWhite, fontSize: 18),
                  onChanged: (String? data) {
                    setState(() {
                      selected_type = data ??
                          "Partner"
                              "";
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
            ),
            Visibility(
              visible: etitle == "Employee" ? true : false,
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                   style: const TextStyle(color:kWhite),
                  cursorColor:kWhite,
          
                  controller: _employee_code_controller,
                  decoration: InputDecoration(
                  
                     focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: kWhite),
                    ),
                   disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:  kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:  kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:  kWhite),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                       labelStyle: const TextStyle(color:kWhite),
                    labelText: 'Employee Code',
                    isDense: true,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: ElevatedButton(
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      color: navyBlueColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                      width * 0.90, MediaQuery.of(context).size.height * 0.05),
                  primary: kWhite,
                 // shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () async {
                  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                  var model, manufacturer, release, sdkInt, id;
                  if (Platform.isAndroid) {
                    AndroidDeviceInfo androidInfo =
                        await deviceInfo.androidInfo;
                    model = androidInfo.model;
                    manufacturer = androidInfo.manufacturer;
                    release = androidInfo.version.release;
                    sdkInt = androidInfo.version.sdkInt;

                    id = androidInfo.androidId;
                  } else {
                    IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
                    model = iosDevice.name;
                    manufacturer = iosDevice.model;
                    release = iosDevice.systemName;
                    sdkInt = iosDevice.systemVersion;
                    id = iosDevice.identifierForVendor;
                  }

                  String sdk = "$sdkInt";

                  if (_eemail_mobile_controller.text.isNotEmpty) {
                    if (_epassword_controller.text.isNotEmpty) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_eemail_mobile_controller.text);
                      bool mobileValid = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                          .hasMatch(_eemail_mobile_controller.text);
                      if (emailValid || mobileValid) {
                        if (etitle == "Employee") {
                          NetworkCall networdCall = NetworkCall();
                          setState(() {
                            _isLoading = true;
                          });
                          bool status = await networdCall.generateOtp(
                              _eemail_mobile_controller.text,
                              _epassword_controller.text,
                              etitle,
                              _employee_code_controller.text,
                              context);
                          setState(() {
                            _isLoading = false;
                          });
                          if (status) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                    _email_mobile_controller.text,
                                    _password_controller.text,
                                    title,
                                    _employee_code_controller.text),
                              ),
                            );
                          }
                        } else {
                          NetworkCall networdCall = NetworkCall();
                          setState(() {
                            _isLoading = true;
                          });
                          bool status = await networdCall.generateOtp(
                              _email_mobile_controller.text,
                              _password_controller.text,
                              title,
                              "",
                              context);
                          setState(() {
                            _isLoading = false;
                          });
                          if (status) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                    _email_mobile_controller.text,
                                    _password_controller.text,
                                    title,
                                    ""),
                              ),
                            );
                          }
                        }
                      } else {
                        _createToast("Please enter valid email id / mobile no");
                      }
                    } else {
                      _createToast("Please enter password");
                    }
                  } else {
                    _createToast("Please enter your email id / mobile no");
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()));
                },
                child: const Text(
                  "FORGOT PASSWORD ?",
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            /*const SizedBox(
                height: 100.0,
              ),*/
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        child: Center(
                          child: Text(
                            "OR",
                            style: TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Visibility(
                              visible: etitle == "Employee" ? false : true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      child: const Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                            color: kWhite,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        //fixedSize: Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
                                        primary: navyBlueColor,
                                       // shadowColor: const Color(0xFFFFAE00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        Route newRoute = MaterialPageRoute(
                                            builder: (context) => OnBoardScreen(
                                                "signin",
                                                title == "Customer"
                                                    ? "0"
                                                    : btitle ==
                                                            "Business Partner"
                                                        ? "1"
                                                        : "2"));
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                newRoute, (route) => false);
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      child: const Text(
                                        "DEMO",
                                        style: TextStyle(
                                            color:navyBlueColor,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        //fixedSize: Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
                                        primary: kWhite,
                                       // shadowColor: const Color(0xFFFFAE00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      onPressed: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        if (title == "Customer") {
                                          prefs.setString("type", title);
                                        } else {
                                          prefs.setString(
                                              "type", selected_type);
                                        }

                                        Navigator.pushAndRemoveUntil<dynamic>(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) =>
                                                const Home(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                                visible: etitle == "Employee" ? true : false,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "New Employee?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:navyBlueColor,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Text(
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
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      painter: HeaderCurvedContainer(context, height_angle, curve),
    );
    // return/* CustomPaint(
    //   child:*/
    //   Container(
    //     /*margin: EdgeInsets.only(
    //         top: 10.0,
    //         left: MediaQuery.of(context).size.width * 0.05,
    //         right: MediaQuery.of(context).size.width * 0.05),*/
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         CustomPaint(
    //           child: Container(
    //             margin: EdgeInsets.only(
    //                 top: 10.0,
    //                 left: MediaQuery.of(context).size.width * 0.05,
    //                 right: MediaQuery.of(context).size.width * 0.05),
    //             padding: EdgeInsets.only(bottom: 10),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 const Text(
    //                   "Welcome to",
    //                   style: TextStyle(
    //                       color: Color(0xFF111111),
    //                       fontSize: 18.0,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //                 const Text(
    //                   'Genie Moneyy',
    //                   style: TextStyle(
    //                     fontSize: 36.0,
    //                     color: Color(0xFF111111),
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Text(
    //                   'Please Login As $title To Continue',
    //                   style: const TextStyle(
    //                       fontSize: 18.0,
    //                       color: Color(0xFF111111),
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(top: 30.0),
    //                   child: TextFormField(
    //                     controller: _email_mobile_controller,
    //                     decoration: InputDecoration(
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                       ),
    //                       labelText: 'Email / Mobile No.',
    //                       isDense: true,
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(
    //                       top: 10.0),
    //                   child: TextField(
    //                     controller: _password_controller,
    //                     decoration: InputDecoration(
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                       ),
    //                       labelText: 'Password',
    //                       isDense: true,
    //                     ),
    //                     obscureText: true,
    //                   ),
    //                 ),
    //                 Visibility(
    //                   visible: title == "Business Partner" ? true : false,
    //                   child: Container(
    //                     margin: const EdgeInsets.only(top: 10.0),
    //                     child: DropdownButtonFormField<String>(
    //                       dropdownColor: const Color(0xFFFFAE00),
    //                       isExpanded: true,
    //                       decoration: const InputDecoration(
    //                         focusedBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         disabledBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         enabledBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         border: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Color(0xFF111111)),
    //                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                         ),
    //                         isDense: true,
    //                       ),
    //                       value: selected_type,
    //                       isDense: true,
    //                       icon: const Icon(
    //                         Icons.arrow_drop_down,
    //                         color: Color(0xFF111111),
    //                       ),
    //                       iconSize: 24,
    //                       elevation: 16,
    //                       style: const TextStyle(color: Color(0xFF111111), fontSize: 18),
    //                       onChanged: (String? data) {
    //                         setState(() {
    //                           selected_type = data ?? "Merchant";
    //                         });
    //                       },
    //                       items: business_type_list
    //                           .map<DropdownMenuItem<String>>((String value) {
    //                         return DropdownMenuItem<String>(
    //                           value: value,
    //                           child: Text(value),
    //                         );
    //                       }).toList(),
    //                     ),
    //                   ),
    //                 ),
    //                 Visibility(
    //                   visible: title == "Employee" ? true : false,
    //                   child: Container(
    //                     margin: const EdgeInsets.only(
    //                         top: 10.0),
    //                     child: TextField(
    //                       controller: _employee_code_controller,
    //                       decoration: InputDecoration(
    //                         border: OutlineInputBorder(
    //                           borderRadius: BorderRadius.circular(10.0),
    //                         ),
    //                         labelText: 'Employee Code',
    //                         isDense: true,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(
    //                       top: 20.0),
    //                   child: ElevatedButton(
    //                     child: const Text(
    //                       "LOGIN",
    //                       style: TextStyle(
    //                           color: Color(0xFFFFAE00),
    //                           fontSize: 15.0,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     style: ElevatedButton.styleFrom(
    //                       fixedSize: Size(
    //                           width * 0.90, MediaQuery.of(context).size.height * 0.05),
    //                       primary: const Color(0xFF111111),
    //                       shadowColor: const Color(0xFFFFAE00),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(5.0),
    //                       ),
    //                     ),
    //                     onPressed: () async {
    //                       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //                       var model, manufacturer, release, sdkInt, id;
    //                       if (Platform.isAndroid) {
    //                         AndroidDeviceInfo androidInfo =
    //                         await deviceInfo.androidInfo;
    //                         model = androidInfo.model;
    //                         manufacturer = androidInfo.manufacturer;
    //                         release = androidInfo.version.release;
    //                         sdkInt = androidInfo.version.sdkInt;
    //                         id = androidInfo.androidId;
    //                       } else {
    //                         IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
    //                         model = iosDevice.name;
    //                         manufacturer = iosDevice.model;
    //                         release = iosDevice.systemName;
    //                         sdkInt = iosDevice.systemVersion;
    //                         id = iosDevice.identifierForVendor;
    //                       }
    //
    //                       String sdk = "$sdkInt";
    //
    //                       if (_email_mobile_controller.text.isNotEmpty) {
    //                         if (_password_controller.text.isNotEmpty) {
    //                           bool emailValid = RegExp(
    //                               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //                               .hasMatch(_email_mobile_controller.text);
    //                           bool mobileValid =
    //                           RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
    //                               .hasMatch(_email_mobile_controller.text);
    //                           if (emailValid || mobileValid) {
    //                             if (title == "Business Partner") {
    //                               NetworkCall networdCall = NetworkCall();
    //                               setState(() {
    //                                 _isLoading = true;
    //                               });
    //                               bool status = await networdCall.generateOtp(
    //                                   _email_mobile_controller.text,
    //                                   _password_controller.text,
    //                                   title,
    //                                   "",
    //                                   context);
    //                                status =true;
    //                               //if(selected_type=='Retailer'){
    //                                 if (status) {
    //                                   Navigator.push(
    //                                     context,
    //                                     MaterialPageRoute(
    //                                       builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type,""),),);
    //                                 }
    //                               //}
    //
    //                             }else if (title == "Employee"){
    //                               NetworkCall networdCall = NetworkCall();
    //                               setState(() {
    //                                 _isLoading = true;
    //                               });
    //                               bool status = await networdCall.generateOtp(
    //                                   _email_mobile_controller.text,
    //                                   _password_controller.text,
    //                                   title,
    //                                   _employee_code_controller.text,
    //                                   context);
    //                               setState(() {
    //                                 _isLoading = false;
    //                               });
    //                               if (status) {
    //                                 Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                     builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,_employee_code_controller.text),),);
    //                               }
    //                             } else {
    //                               NetworkCall networdCall = NetworkCall();
    //                               setState(() {
    //                                 _isLoading = true;
    //                               });
    //                               bool status = await networdCall.generateOtp(
    //                                   _email_mobile_controller.text,
    //                                   _password_controller.text,
    //                                   title,
    //                                   "",
    //                                   context);
    //                               setState(() {
    //                                 _isLoading = false;
    //                               });
    //                               if (status) {
    //                                 Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                     builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,""),),);
    //                               }
    //                             }
    //                           } else {
    //                             _createToast(
    //                                 "Please enter valid email id / mobile no");
    //                           }
    //                         } else {
    //                           _createToast("Please enter password");
    //                         }
    //                       } else {
    //                         _createToast("Please enter your email id / mobile no");
    //                       }
    //                     },
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(
    //                       top: 10.0),
    //                   child: InkWell(
    //                     onTap: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => const ForgotPassword()));
    //                     },
    //                     child: const Text(
    //                       "FORGOT PASSWORD ?",
    //                       style: TextStyle(
    //                         color: Color(0xFF111111),
    //                         fontSize: 15.0,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 /*const SizedBox(
    //                   height: 100.0,
    //                 ),*/
    //
    //               ],
    //             ),
    //           ),
    //           //painter: HeaderCurvedContainer(context, height_angle, curve),
    //         ),
    //         Center(
    //           child: Text(
    //             "OR",
    //             style: TextStyle(
    //                 color: Color(0xFFFFAE00),
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 20.0),
    //           ),
    //         ),
    //         Container(
    //           margin: EdgeInsets.only(
    //               top: 10.0,
    //               left: MediaQuery.of(context).size.width * 0.05,
    //               right: MediaQuery.of(context).size.width * 0.05),
    //           child: Column(
    //             children: [
    //               Visibility(
    //                 visible: title=="Employee" ?false:true,
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       margin: EdgeInsets.only(top: height * 0.10),
    //                       child: ElevatedButton(
    //                         child: const Text(
    //                           "SIGN UP",
    //                           style: TextStyle(
    //                               color: Color(0xFF111111),
    //                               fontSize: 15.0,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         style: ElevatedButton.styleFrom(
    //                           fixedSize:
    //                           Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
    //                           primary: const Color(0xFFFFAE00),
    //                           shadowColor: const Color(0xFFFFAE00),
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(5.0),
    //                           ),
    //                         ),
    //                         onPressed: () {
    //                           Route newRoute = MaterialPageRoute(
    //                               builder: (context) => OnBoardScreen("signin", title == "Customer" ? "0" : title == "Business Partner" ? "1" : "2"));
    //                           Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
    //                         },
    //                       ),
    //                     ),
    //                     Container(
    //                       margin: EdgeInsets.only(top:10),
    //                       child: ElevatedButton(
    //                         child: const Text(
    //                           "DEMO",
    //                           style: TextStyle(
    //                               color: Color(0xFF111111),
    //                               fontSize: 15.0,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         style: ElevatedButton.styleFrom(
    //                           fixedSize:
    //                           Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
    //                           primary: const Color(0xFFFFAE00),
    //                           shadowColor: const Color(0xFFFFAE00),
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(5.0),
    //                           ),
    //                         ),
    //                         onPressed: () async{
    //                           SharedPreferences prefs = await SharedPreferences.getInstance();
    //                           if(title=="Customer"){
    //                             prefs.setString("type",title);
    //
    //                           }else{
    //                             prefs.setString("type",selected_type);
    //                           }
    //
    //                           Navigator.pushAndRemoveUntil<dynamic>(
    //                               context,
    //                               MaterialPageRoute<dynamic>(
    //                               builder: (BuildContext context) => const Home(),
    //                           ),
    //                           (route) => false,);
    //                         },
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Visibility(
    //                 visible: title=="Employee"?true:false,
    //                   child: Container(
    //                     margin: EdgeInsets.only(top: 10),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.stretch,
    //                       children: [
    //                         Container(
    //                           margin: EdgeInsets.only(top: 10),
    //                           child: Text(
    //                               "New Employee?",
    //                               textAlign: TextAlign.center,
    //                               style: TextStyle(
    //                                 color: Color(0xFFFFAE00),
    //                                 fontSize: 18.0,),
    //                           ),
    //                         ),
    //                         Container(
    //                           margin: EdgeInsets.only(top: 10, bottom: 10),
    //                           child: Text(
    //                             "Please Contact HR Team",
    //                             textAlign: TextAlign.center,
    //                             style: TextStyle(
    //                                 color: Color(0xFFFFAE00),
    //                                 fontSize: 18.0,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   )
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    /*painter: HeaderCurvedContainer(context, height_angle, curve),
    );*/
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
}

class HeaderCurvedContainer extends CustomPainter {
  BuildContext context;
  double height;
  double curve;

  HeaderCurvedContainer(this.context, this.height, this.curve);

  @override
  void paint(Canvas canvas, Size size) {
    //Paint paint = Paint()..color = const Color(0xFFFFAE00);
       Paint paint = Paint()..color = navyBlueColor;
        double increasedHeight = height + 40; // Adjust this value to increase the height of the curved area
    double increasedCurve = curve + 40;
    Path path = Path()
       ..relativeLineTo(0, increasedHeight)
      ..quadraticBezierTo(size.width / 2, increasedCurve, size.width, increasedHeight)
      ..relativeLineTo(0, -increasedHeight)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
