// import 'dart:io';

// import 'package:device_info/device_info.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:genie_money/Screens/otp_screen.dart';
// import 'package:genie_money/Screens/signin_screen.dart';
// // ignore: unused_import
// import 'package:shared_preferences/shared_preferences.dart';

// // ignore: unused_import
// import '../home.dart';
// import '../utils/network.dart';
// import 'forgot_password_screen.dart';
// // ignore: unused_import
// import 'onboard_screen.dart';

// class HomePagee extends StatefulWidget {

//   @override
//   State<HomePagee> createState() => _HomePageeState();
// }

// class _HomePageeState extends State<HomePagee> with TickerProviderStateMixin{
//   bool isFirst = false;
//   late String title = "Business Partner";
//   bool isVisible = true; final TextEditingController _email_mobile_controller = TextEditingController();
//   final TextEditingController _password_controller = TextEditingController();
//   final TextEditingController _employee_code_controller = TextEditingController();
//   late String longitude = '00.00000';
//   late String latitude = '00.00000';
//   //late LocationPermission permission;
//   // ignore: unused_field
//   late bool serviceEnabled = false, _isLoading = false;

//   // ignore: unused_field
//   late TabController _tabController;
//  // late String title = "Customer";

//   late double curve;
//   late double height_angle;

//   late String selected_type = "Partner";

//   List<String> business_type_list = [
//     'Partner',
//     'Associate Partner',
//     'Merchant'
//   ];
//   // late double curve;
//   // late double height_angle;
//   List<Tab> tabs = [
//     const Tab(child: Text("Customer")),
//     const Tab(child: Text("Business Partner")),
//     const Tab(child: Text("Employee")),

//   ];

//   List<Widget> tabsContent = [
//     Container(color: Colors.teal),
//     Container(color: Colors.green),
//     Container(color: Colors.blue),

//   ];

//   @override
//   Widget build(BuildContext context) {
//     TabController tabController = TabController(length: 3, vsync: this);
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     print("height : "+height.toString());
//     if (isFirst) {
//       if (height <= 593) {
//         curve = height * 0.65;
//         height_angle = height * 0.55;
//       } else if (height > 593 && height <= 672) {
//         curve = height * 0.55;
//         height_angle = height * 0.50;
//       } else {
//         curve = height * 0.45;
//         height_angle = height * 0.40;
//       }
//       isFirst = false;
//     }else{
//       if (title == "Business Partner") {
//         if (height <= 593) {
//           curve = height * 0.79;
//           height_angle = height * 0.69;
//         } else if (height > 593 && height <= 672) {
//           curve = height * 0.70;
//           height_angle = height * 0.65;
//         } else {
//           curve = height * 0.58;
//           height_angle = height * 0.51;
//         }
//       } else {
//         if (height <= 593) {
//           curve = height * 0.77;
//           height_angle = height * 0.67;
//         } else if (height > 593 && height <= 672) {
//           curve = height * 0.65;
//           height_angle = height * 0.58;
//         } else {
//           curve = height * 0.55;
//           height_angle = height * 0.48;
//         }
//       }
//     }
//     return Scaffold(
//       body: Column(
//         children: [
//           TabBar(
//             indicator: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10)),
//                 color: Color(0xFFFFAE00)),
//             onTap: (value) {
//               setState(() {
//                 if (value == 0) {
//                   isVisible = true;
//                   title = "UPI / QR Payment";
//                   if (height <= 593) {
//                     curve = height * 0.65;
//                     height_angle = height * 0.55;
//                   } else if (height > 593 && height <= 672) {

//                     curve = height * 0.55;
//                     height_angle = height * 0.50;
//                   } else {
//                     curve = height * 0.52;
//                     height_angle = height * 0.42;
//                   }
//                 } else if (value == 1) {
//                   isVisible = false;

//                   title = "Online Payment";
//                   if (height <= 593) {
//                     curve = height * 0.79;
//                     height_angle = height * 0.69;
//                   } else if (height > 593 && height <= 672) {
//                     curve = height * 0.70;
//                     height_angle = height * 0.65;
//                   } else {
//                     curve = height * 0.58;
//                     height_angle = height * 0.51;
//                   }
//                 } else {
//                   isVisible = false;

//                   title = "Cash Payment";
//                   if (height <= 593) {
//                     curve = height * 0.77;
//                     height_angle = height * 0.67;
//                   } else if (height > 593 && height <= 672) {
//                     curve = height * 0.65;
//                     height_angle = height * 0.58;
//                   } else {
//                     curve = height * 0.55;
//                     height_angle = height * 0.48;
//                   }
//                 }
//               });
//             },
//             isScrollable: true,
//             indicatorColor: Colors.white,
//             controller: tabController,
//             labelColor: const Color(0xFF111111),
//             unselectedLabelColor: const Color(0xFFFFAE00),
//             tabs: const [
//               Tab(
//                 child: Text(
//                   "UPI/Qr Payment",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//               Tab(
//                 child: Text(
//                   "Online Payment ",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//               Tab(
//                 child: Text(
//                   "Cash Payment ",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//             ],
            
//           ),
//          Expanded(child:
//          TabBarView(
//            controller: tabController,
//            children: [

//          customer_login_ui(height, context, width),
//              business_login_ui(height, context, width),
//              employe_login_ui(height, context, width),

//          ],

//          )),


//         ],
//       ),

    
//     );

//   }
//   Widget customer_login_ui(double height, BuildContext context, double width) {
//     return   CustomPaint(
//       painter: HeaderCurvedContainer(context, height_angle, curve),
//       child: Container(
//         margin: EdgeInsets.only(
//             top: 10.0,
//             left: MediaQuery.of(context).size.width * 0.05,
//             right: MediaQuery.of(context).size.width * 0.05),
//         padding: const EdgeInsets.only(bottom: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Welcome to",
//               style: TextStyle(
//                   color: Color(0xFF111111),
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               'Genie Moneyy',
//               style: TextStyle(
//                 fontSize: 36.0,
//                 color: Color(0xFF111111),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Please Login As $title To Continue',
//               style: const TextStyle(
//                   fontSize: 18.0,
//                   color: Color(0xFF111111),
//                   fontWeight: FontWeight.bold),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 30.0),
//               child: TextFormField(
//                 controller: _email_mobile_controller,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   labelText: 'Email / Mobile No.',
//                   isDense: true,
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                   top: 10.0),
//               child: TextField(
//                 controller: _password_controller,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   labelText: 'Password',
//                   isDense: true,
//                 ),
//                 obscureText: true,
//               ),
//             ),
//             Visibility(
//               visible: title == "Business Partner" ? true : false,
//               child: Container(
//                 margin: const EdgeInsets.only(top: 10.0),
//                 child: DropdownButtonFormField<String>(
//                   dropdownColor: const Color(0xFFFFAE00),
//                   isExpanded: true,
//                   decoration: const InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     disabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     isDense: true,
//                   ),
//                   value: selected_type,
//                   isDense: true,
//                   icon: const Icon(
//                     Icons.arrow_drop_down,
//                     color: Color(0xFF111111),
//                   ),
//                   iconSize: 24,
//                   elevation: 16,
//                   style: const TextStyle(color: Color(0xFF111111), fontSize: 18),
//                   onChanged: (String? data) {
//                     setState(() {
//                       selected_type = data ?? "Partner"
//                           "";
//                     });
//                   },
//                   items: business_type_list
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: title == "Employee" ? true : false,
//               child: Container(
//                 margin: const EdgeInsets.only(
//                     top: 10.0),
//                 child: TextField(
//                   controller: _employee_code_controller,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     labelText: 'Employee Code',
//                     isDense: true,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                   top: 20.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(
//                       width * 0.90, MediaQuery.of(context).size.height * 0.05),
//                   primary: const Color(0xFF111111),
//                   shadowColor: const Color(0xFFFFAE00),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onPressed: () async {
//                   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//                   // ignore: unused_local_variable
//                   var model, manufacturer, release, sdkInt, id;
//                   if (Platform.isAndroid) {
//                     AndroidDeviceInfo androidInfo =
//                     await deviceInfo.androidInfo;
//                     model = androidInfo.model;
//                     manufacturer = androidInfo.manufacturer;
//                     release = androidInfo.version.release;
//                     sdkInt = androidInfo.version.sdkInt;

//                     id = androidInfo.androidId;
//                   } else {
//                     IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
//                     model = iosDevice.name;
//                     manufacturer = iosDevice.model;
//                     release = iosDevice.systemName;
//                     sdkInt = iosDevice.systemVersion;
//                     id = iosDevice.identifierForVendor;
//                   }

//                   // ignore: unused_local_variable
//                   String sdk = "$sdkInt";

//                   if (_email_mobile_controller.text.isNotEmpty) {
//                     if (_password_controller.text.isNotEmpty) {
//                       bool emailValid = RegExp(
//                           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                           .hasMatch(_email_mobile_controller.text);
//                       bool mobileValid =
//                       RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
//                           .hasMatch(_email_mobile_controller.text);
//                       if (emailValid || mobileValid) {
//                         if (title == "Business Partner") {
//                           NetworkCall networdCall = NetworkCall();
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           bool status = await networdCall.generateOtp(
//                               _email_mobile_controller.text,
//                               _password_controller.text,
//                               title,
//                               "",
//                               context);
//                           setState(() {
//                             _isLoading = false;
//                           });
//                           //var status =true;
//                           //if(selected_type=='Retailer'){
//                           if (status) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type,""),),);
//                           }
//                           //}
//                           /*if (status) {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type),),);
//                             }*/
//                         } else if (title == "Employee"){
//                           NetworkCall networdCall = NetworkCall();
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           bool status = await networdCall.generateOtp(
//                               _email_mobile_controller.text,
//                               _password_controller.text,
//                               title,
//                               _employee_code_controller.text,
//                               context);
//                           setState(() {
//                             _isLoading = false;
//                           });
//                           if (status) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,_employee_code_controller.text),),);
//                           }
//                         }else {
//                           NetworkCall networdCall = NetworkCall();
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           bool status = await networdCall.generateOtp(
//                               _email_mobile_controller.text,
//                               _password_controller.text,
//                               title,
//                               "",
//                               context);
//                           setState(() {
//                             _isLoading = false;
//                           });
//                           if (status) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,""),),);
//                           }
//                         }
//                       } else {
//                         _createToast(
//                             "Please enter valid email id / mobile no");
//                       }
//                     } else {
//                       _createToast("Please enter password");
//                     }
//                   } else {
//                     _createToast("Please enter your email id / mobile no");
//                   }
//                 },
//                 child: const Text(
//                   "LOGIN",
//                   style: TextStyle(
//                       color: Color(0xFFFFAE00),
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                   top: 10.0),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ForgotPassword()));
//                 },
//                 child: const Text(
//                   "FORGOT PASSWORD ?",
//                   style: TextStyle(
//                     color: Color(0xFF111111),
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             /*const SizedBox(
//                 height: 100.0,
//               ),*/

//           ],
//         ),
//       ),
//     );





//   }
//   Widget business_login_ui(double height, BuildContext context, double width) {
//     return   CustomPaint(
//       painter: HeaderCurvedContainer(context, height_angle, curve),
//       child: Container(
//         margin: EdgeInsets.only(
//             top: 10.0,
//             left: MediaQuery.of(context).size.width * 0.05,
//             right: MediaQuery.of(context).size.width * 0.05),
//         padding: const EdgeInsets.only(bottom: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Welcome to",
//               style: TextStyle(
//                   color: Color(0xFF111111),
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               'Genie Moneyy',
//               style: TextStyle(
//                 fontSize: 36.0,
//                 color: Color(0xFF111111),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Please Login As $title To Continue',
//               style: const TextStyle(
//                   fontSize: 18.0,
//                   color: Color(0xFF111111),
//                   fontWeight: FontWeight.bold),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 30.0),
//               child: TextFormField(
//                 controller: _email_mobile_controller,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   labelText: 'Email / Mobile No.',
//                   isDense: true,
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                   top: 10.0),
//               child: TextField(
//                 controller: _password_controller,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   labelText: 'Password',
//                   isDense: true,
//                 ),
//                 obscureText: true,
//               ),
//             ),
//             Visibility(
//               visible: title == "Business Partner" ? true : false,
//               child: Container(
//                 margin: const EdgeInsets.only(top: 10.0),
//                 child: DropdownButtonFormField<String>(
//                   dropdownColor: const Color(0xFFFFAE00),
//                   isExpanded: true,
//                   decoration: const InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     disabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     isDense: true,
//                   ),
//                   value: selected_type,
//                   isDense: true,
//                   icon: const Icon(
//                     Icons.arrow_drop_down,
//                     color: Color(0xFF111111),
//                   ),
//                   iconSize: 24,
//                   elevation: 16,
//                   style: const TextStyle(color: Color(0xFF111111), fontSize: 18),
//                   onChanged: (String? data) {
//                     setState(() {
//                       selected_type = data ?? "Partner"
//                           "";
//                     });
//                   },
//                   items: business_type_list
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: title == "Employee" ? true : false,
//               child: Container(
//                 margin: const EdgeInsets.only(
//                     top: 10.0),
//                 child: TextField(
//                   controller: _employee_code_controller,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     labelText: 'Employee Code',
//                     isDense: true,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                   top: 20.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(
//                       width * 0.90, MediaQuery.of(context).size.height * 0.05),
//                   primary: const Color(0xFF111111),
//                   shadowColor: const Color(0xFFFFAE00),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onPressed: () async {
//                   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//                   // ignore: unused_local_variable
//                   var model, manufacturer, release, sdkInt, id;
//                   if (Platform.isAndroid) {
//                     AndroidDeviceInfo androidInfo =
//                     await deviceInfo.androidInfo;
//                     model = androidInfo.model;
//                     manufacturer = androidInfo.manufacturer;
//                     release = androidInfo.version.release;
//                     sdkInt = androidInfo.version.sdkInt;

//                     id = androidInfo.androidId;
//                   } else {
//                     IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
//                     model = iosDevice.name;
//                     manufacturer = iosDevice.model;
//                     release = iosDevice.systemName;
//                     sdkInt = iosDevice.systemVersion;
//                     id = iosDevice.identifierForVendor;
//                   }

//                   // ignore: unused_local_variable
//                   String sdk = "$sdkInt";

//                   if (_email_mobile_controller.text.isNotEmpty) {
//                     if (_password_controller.text.isNotEmpty) {
//                       bool emailValid = RegExp(
//                           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                           .hasMatch(_email_mobile_controller.text);
//                       bool mobileValid =
//                       RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
//                           .hasMatch(_email_mobile_controller.text);
//                       if (emailValid || mobileValid) {
//                         if (title == "Business Partner") {
//                           NetworkCall networdCall = NetworkCall();
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           bool status = await networdCall.generateOtp(
//                               _email_mobile_controller.text,
//                               _password_controller.text,
//                               title,
//                               "",
//                               context);
//                           setState(() {
//                             _isLoading = false;
//                           });
//                           //var status =true;
//                           //if(selected_type=='Retailer'){
//                           if (status) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type,""),),);
//                           }
//                           //}
//                           /*if (status) {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type),),);
//                             }*/
//                         } else if (title == "Employee"){
//                           NetworkCall networdCall = NetworkCall();
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           bool status = await networdCall.generateOtp(
//                               _email_mobile_controller.text,
//                               _password_controller.text,
//                               title,
//                               _employee_code_controller.text,
//                               context);
//                           setState(() {
//                             _isLoading = false;
//                           });
//                           if (status) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,_employee_code_controller.text),),);
//                           }
//                         }else {
//                           NetworkCall networdCall = NetworkCall();
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           bool status = await networdCall.generateOtp(
//                               _email_mobile_controller.text,
//                               _password_controller.text,
//                               title,
//                               "",
//                               context);
//                           setState(() {
//                             _isLoading = false;
//                           });
//                           if (status) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,""),),);
//                           }
//                         }
//                       } else {
//                         _createToast(
//                             "Please enter valid email id / mobile no");
//                       }
//                     } else {
//                       _createToast("Please enter password");
//                     }
//                   } else {
//                     _createToast("Please enter your email id / mobile no");
//                   }
//                 },
//                 child: const Text(
//                   "LOGIN",
//                   style: TextStyle(
//                       color: Color(0xFFFFAE00),
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                   top: 10.0),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ForgotPassword()));
//                 },
//                 child: const Text(
//                   "FORGOT PASSWORD ?",
//                   style: TextStyle(
//                     color: Color(0xFF111111),
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             /*const SizedBox(
//                 height: 100.0,
//               ),*/

//           ],
//         ),
//       ),
//     );





//   }
//   Widget employe_login_ui(double height, BuildContext context, double width) {
//     return   CustomPaint(
//       painter: HeaderCurvedContainer(context, height_angle, curve),
//       child: Container(
//         margin: EdgeInsets.only(
//             top: 10.0,
//             left: MediaQuery.of(context).size.width * 0.05,
//             right: MediaQuery.of(context).size.width * 0.05),
//         padding: const EdgeInsets.only(bottom: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Welcome to",
//               style: TextStyle(
//                   color: Color(0xFF111111),
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               'Genie Moneyy',
//               style: TextStyle(
//                 fontSize: 36.0,
//                 color: Color(0xFF111111),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Please Login As $title To Continue',
//               style: const TextStyle(
//                   fontSize: 18.0,
//                   color: Color(0xFF111111),
//                   fontWeight: FontWeight.bold),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 30.0),
//               child: TextFormField(
//                 controller: _email_mobile_controller,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   labelText: 'Email / Mobile No.',
//                   isDense: true,
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                   top: 10.0),
//               child: TextField(
//                 controller: _password_controller,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   labelText: 'Password',
//                   isDense: true,
//                 ),
//                 obscureText: true,
//               ),
//             ),
//             Visibility(
//               visible: title == "Business Partner" ? true : false,
//               child: Container(
//                 margin: const EdgeInsets.only(top: 10.0),
//                 child: DropdownButtonFormField<String>(
//                   dropdownColor: const Color(0xFFFFAE00),
//                   isExpanded: true,
//                   decoration: const InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     disabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF111111)),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     isDense: true,
//                   ),
//                   value: selected_type,
//                   isDense: true,
//                   icon: const Icon(
//                     Icons.arrow_drop_down,
//                     color: Color(0xFF111111),
//                   ),
//                   iconSize: 24,
//                   elevation: 16,
//                   style: const TextStyle(color: Color(0xFF111111), fontSize: 18),
//                   onChanged: (String? data) {
//                     setState(() {
//                       selected_type = data ?? "Partner"
//                           "";
//                     });
//                   },
//                   items: business_type_list
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: title == "Employee" ? true : false,
//               child: Container(
//                 margin: const EdgeInsets.only(
//                     top: 10.0),
//                 child: TextField(
//                   controller: _employee_code_controller,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     labelText: 'Employee Code',
//                     isDense: true,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                   top: 20.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(
//                       width * 0.90, MediaQuery.of(context).size.height * 0.05),
//                   primary: const Color(0xFF111111),
//                   shadowColor: const Color(0xFFFFAE00),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onPressed: () async {
//                   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//                   // ignore: unused_local_variable
//                   var model, manufacturer, release, sdkInt, id;
//                   if (Platform.isAndroid) {
//                     AndroidDeviceInfo androidInfo =
//                     await deviceInfo.androidInfo;
//                     model = androidInfo.model;
//                     manufacturer = androidInfo.manufacturer;
//                     release = androidInfo.version.release;
//                     sdkInt = androidInfo.version.sdkInt;

//                     id = androidInfo.androidId;
//                   } else {
//                     IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
//                     model = iosDevice.name;
//                     manufacturer = iosDevice.model;
//                     release = iosDevice.systemName;
//                     sdkInt = iosDevice.systemVersion;
//                     id = iosDevice.identifierForVendor;
//                   }

//                   // ignore: unused_local_variable
//                   String sdk = "$sdkInt";

//                   if (_email_mobile_controller.text.isNotEmpty) {
//                     if (_password_controller.text.isNotEmpty) {
//                       bool emailValid = RegExp(
//                           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                           .hasMatch(_email_mobile_controller.text);
//                       bool mobileValid =
//                       RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
//                           .hasMatch(_email_mobile_controller.text);
//                       if (emailValid || mobileValid) {
//                         if (title == "Business Partner") {
//                           NetworkCall networdCall = NetworkCall();
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           // ignore: use_build_context_synchronously
//                           bool status = await networdCall.generateOtp(
//                               _email_mobile_controller.text,
//                               _password_controller.text,
//                               title,
//                               "",
//                               context);
//                           setState(() {
//                             _isLoading = false;
//                           });
//                           //var status =true;
//                           //if(selected_type=='Retailer'){
//                           if (status) {
//                             // ignore: use_build_context_synchronously
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type,""),),);
//                           }
//                           //}
//                           /*if (status) {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, selected_type),),);
//                             }*/
//                         } else if (title == "Employee"){
//                           NetworkCall networdCall = NetworkCall();
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           // ignore: use_build_context_synchronously
//                           bool status = await networdCall.generateOtp(
//                               _email_mobile_controller.text,
//                               _password_controller.text,
//                               title,
//                               _employee_code_controller.text,
//                               context);
//                           setState(() {
//                             _isLoading = false;
//                           });
//                           if (status) {
//                             // ignore: use_build_context_synchronously
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,_employee_code_controller.text),),);
//                           }
//                         }else {
//                           NetworkCall networdCall = NetworkCall();
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           // ignore: use_build_context_synchronously
//                           bool status = await networdCall.generateOtp(
//                               _email_mobile_controller.text,
//                               _password_controller.text,
//                               title,
//                               "",
//                               context);
//                           setState(() {
//                             _isLoading = false;
//                           });
//                           if (status) {
//                             // ignore: use_build_context_synchronously
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OTPScreen(_email_mobile_controller.text, _password_controller.text, title,""),),);
//                           }
//                         }
//                       } else {
//                         _createToast(
//                             "Please enter valid email id / mobile no");
//                       }
//                     } else {
//                       _createToast("Please enter password");
//                     }
//                   } else {
//                     _createToast("Please enter your email id / mobile no");
//                   }
//                 },
//                 child: const Text(
//                   "LOGIN",
//                   style: TextStyle(
//                       color: Color(0xFFFFAE00),
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                   top: 10.0),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ForgotPassword()));
//                 },
//                 child: const Text(
//                   "FORGOT PASSWORD ?",
//                   style: TextStyle(
//                     color: Color(0xFF111111),
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             /*const SizedBox(
//                 height: 100.0,
//               ),*/

//           ],
//         ),
//       ),
//     );





//   }



//   void _createToast(String message) {
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1);
//   }

// }