import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/VersionModel.dart';
import 'package:genie_money/Model/onboard_screen_model.dart';
import 'package:genie_money/Screens/portfolio.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/Screens/tabtest.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/data/remote/network/NetworkApiServiceNewVendor.dart';
import 'package:genie_money/utils/constants.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home.dart';
import 'signup_screen.dart';

class OnBoardScreen extends StatefulWidget {
  String from, type;

  OnBoardScreen(this.from, this.type, {Key? key}) : super(key: key);

  @override
  _OnBoardScreen createState() {
    // TODO: implement createState
    return _OnBoardScreen();
  }
}

class _OnBoardScreen extends State<OnBoardScreen> {
  List<Version> Vlist = [];
  late var vPath;
  late String vNo;

  late List<OnBoardScreenList> onboardlist;
  String versionnc = "";

  bool isLayoutVisible = false;
  

  void _checkLogin() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogedIn = false;
    var type = "Customer";
    Constants.userid = prefs.getString("userid") ?? "";
    Constants.name = prefs.getString("name") ?? "";
    Constants.email = prefs.getString("email") ?? "";
    Constants.phone = prefs.getString("phone") ?? "";
    Constants.type = prefs.getString("type") ?? "Customer";
    if (prefs.containsKey("isLoggedIn")) {
      isLogedIn = prefs.getBool("isLoggedIn") ?? false;
    }

    if (prefs.containsKey("type")) {
      type = prefs.getString("type") ?? "Customer";
    }

    setState(() {
      if (widget.from == "signin") {
        Route route = MaterialPageRoute(builder: (context) => SignupScreen(widget.type));
        Navigator.of(context).push(route);
      } else if (widget.from == "signup") {
        Route route = MaterialPageRoute(builder: (context) => SignInScreen(widget.type));
        Navigator.of(context).push(route);
      }
      if (isLogedIn) {
        isLayoutVisible = false;
        if (type == "Employee") {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => PortfolioScreen(type),
            ),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const Home(),
            ),
            (route) => false,
          );
        }
      } else {
        isLayoutVisible = true;
      }
    });
  }

  @override
  void initState() {

    _checkLogin();
    // onboardlist = [

    //   OnBoardScreenList("images/GM-Neobank.png", "Asia's 1st Hybrid Neo Bank",
    //    ""),
    //   OnBoardScreenList("images/lady.png", "One Stop solution for all basic Banking and Financial Needs.",
    //       ""),

    //   OnBoardScreenList("images/GM-Accounts.png", "Accounts",
    //       "Open Digital Accounts sitting right at your home or office"),

    //   OnBoardScreenList("images/finance_intro.png", "Deposits",
    //       "Wide variety of options to create Fixed Deposits digitally with higher interest rates and see your Savings and Growth of your money - Together."),

    //   OnBoardScreenList("images/GM-banner3.png", "Insurance",
    //       "we bring in the options for covering almost every aspect of your and your loved one's lives"),
    //   OnBoardScreenList(
    //       "images/GM-banner2.png",
    //       "Investments",
    //       "Not only we help you open Free Demat Accounts, we help you to grow your money with multiple Investments tools, such as Mutual Funds, Bonds, Shares etc.."),

    //   OnBoardScreenList("images/GM-Banner44.png", "Loans",
    //       " We bring to you happiness with fast and digital loans being served to you to meet all your immediate needs."),

    //   OnBoardScreenList("images/GM-Cards.png", "Cards",
    //       "We have variety of options for you with our curated Prepaid and Credit Card options."),

    // ];
    _getVersion();
    //  getDatas();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Visibility(
      visible: isLayoutVisible,
      child: Scaffold(
        backgroundColor:  kWhite,
        //appBar: AppBar(
          /*actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => const Home(),
                  ),
                  (route) => false,
                );
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  
                  padding: EdgeInsets.only(right: 20.0),
                  child: Center(
                    child: Text(
                      "SKIP",
                      style:
                          TextStyle(color: Color(0XFFFFAE00), fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ),
          ],*/
        //),
        body: Column(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

    SizedBox(height: 70),
              const Center(
                child: Image(
                  image: AssetImage("images/Logo.png"),
                  width: 250,
                ),
              ),
             // const SizedBox(height: 0.9),
              const Center(
                child: Image(
                  image: AssetImage("images/WhatsApp Image 2023-07-17 at 6.12.10 PM (2).jpeg"),
                  width: 300,
                 // height: 200, // Provide a fixed height or adjust as needed
                  fit: BoxFit.cover, // Adjust the image fitting behavior
                ),
              ),
               const SizedBox(height: 30),
                 Text(
            "Welcome to Genie Moneyy !",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:navyBlueColor,
            ),
          ),
             const SizedBox(height: 10), // Add spacing between the texts
          Text(
            "The future of banking is here",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
                 color:greyColor,
            ),
          ),

              
           SizedBox(height: 40),
                  // Expanded(
                  //   child: Container(
                  //     margin: const EdgeInsets.all(10.0),
                  //     child: CarouselSlider(
                  //       options: CarouselOptions(
                  //         height: height * 0.60,

                  //         viewportFraction: 1.0,
                  //         enlargeCenterPage: true,
                  //         enableInfiniteScroll: true,
                  //         autoPlayAnimationDuration: const Duration(seconds: 1),
                  //         autoPlay: true,
                  //         // onPageChanged: (index, reason) {
                  //         //   setState(() {
                  //         //     _currentPosition = index;
                  //         //   });
                  //         // },
                  //       ),
                  //       items: onboardlist
                  //           .map(
                  //             (e) => ClipRRect(
                  //               child: Column(
                  //                 children: <Widget>[
                  //                   Expanded(
                  //                     flex: 2,
                  //                     child: InkWell(
                  //                       child: Container(
                  //                         margin: EdgeInsets.all(10.0),
                  //                         child: Image(
                  //                           image: AssetImage(e.image),
                  //                           width: width,
                  //                           height: height,
                  //                             fit: BoxFit.fill                                      ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Container(
                  //                     margin: const EdgeInsets.only(top: 30.0),
                  //                     child: Center(
                  //                       child: Text(
                  //                         e.title,
                  //                         style: const TextStyle(
                  //                             color: Color(0xFFFFAE00),
                  //                             fontSize: 20.0,
                  //                             fontWeight: FontWeight.bold),
                  //                         textAlign: TextAlign.center,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Container(
                  //                     margin: const EdgeInsets.only(top: 20.0),
                  //                     child: Center(
                  //                       child: Text(e.subtitle,
                  //                           style: const TextStyle(
                  //                               color: Color(0xFFFFAE00),
                  //                               fontSize: 15.0),
                  //                           textAlign: TextAlign.center),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           )
                  //           .toList(),
                  //     ),
                  //   ),
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0),
                          
                        child: ElevatedButton(
                          child: const Text(
                            "SIGN IN",
                            style: TextStyle(
                                color: kWhite,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 25.0),
                            primary:navyBlueColor,
                            shadowColor: navyBlueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen("0")),
                                 // builder: (context) => HomePagee()),
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0),
                         //  margin: const EdgeInsets.only(top: 10.0),  
                        child: ElevatedButton(
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: navyBlueColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 25.0),
                            primary: kWhite,
                            shadowColor: kWhite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen("0")));
                          },
                        ),
                      ),
                        const SizedBox(height: 20),
                      /*Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0),
                        child: ElevatedButton(
                          child: const Text(
                            "DEMO",
                            style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 25.0),
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) => const Home(),
                              ),
                                  (route) => false,
                            );
                          },
                        ),
                      ),*/
                        Divider(
                color:greyColor, 
                thickness: 2.0, 
                indent: 80.0, 
                endIndent: 80.0, 
              ),
                const SizedBox(height: 2),
              Text.rich(
  TextSpan(
    text: "Ask for a ",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color:greyColor,
    ),
    children: [
      TextSpan(
        text: "Demo",
        style: TextStyle(
          color:navyBlueColor,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            
            // Handle the onTap event here
            // For example, navigate to a demo screen
          },
      ),
    ],
  ),
),

                    ],
                  ),
                ],
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

  Future<void> _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      versionnc = packageInfo.version.replaceAll(".", "" );
    //  versionnc.replaceAll(".", "" );

/*
      Fluttertoast.showToast(
          msg: versionnc,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
*/

    });
  }

//   Future<void> getDatas() async {
//     String url =
//         "http://165.22.219.135/genie_money/public/index.php/getappversion";

//     var network = new NewVendorApiService();
//     var response = await network.getresponse(url);
//   //  print("" + response.toString());
//     print("" + url);
//     var Version_no = VersionModel.fromJson(response);
//     vNo = Version_no.version![0].versionNo.toString().replaceAll(".", "");

//     vNo.replaceAll(".", " ");
//     versionnc.replaceAll(".", "" );
//     setState(() {
//       print(vNo);
//       print(versionnc);

// int vno= int.parse(vNo);
// int kk= int.parse(versionnc);


//       /*  vPath = Vlist[0].path;
//       vNo = Vlist[0].versionNo;*/


//       if(vno>kk){
//   showDialog(context: context, builder: (context){
//     return AlertDialog(

//       backgroundColor:  Color(0xFF444343),

//       content: Container(
//         height: 104,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,

//           children: [
//             Text(
//               "New Update Available",
//               style: TextStyle(color: Color(
//                   0xFFFFFFFF),
//                   fontSize: 20),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(

//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 40,
//                   margin: EdgeInsets.all(10),
//                   child: Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Navigator.pop(context);
//                         //             Navigator.push(context, MaterialPageRoute(builder: context) => VendorPaymentPage));
//                         _launchURL();


//                       },
//                       child: Text(
//                         "Update",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
//                         primary: const Color(0xFFFFAE00),
//                         shadowColor: const Color(0xFFFFAE00),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 40,
//                   margin: EdgeInsets.all(10),
//                   child: Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Navigator.pop(context);
//                         //             Navigator.push(context, MaterialPageRoute(builder: context) => VendorPaymentPage));

//                         Navigator.pop(context);

//                       },
//                       child: Text(
//                         "Close",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
//                         primary: const Color(0xFFFFAE00),
//                         shadowColor: const Color(0xFFFFAE00),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),


//               ],
//             )

//           ],
//         ),

//       ),
//     );

//   });
// }
// else
//   {
//    print(vNo);
//    print(versionnc);
//   }

//     });



//   }

  _launchURL() async{
    const url = 'https://geniemoneyy.com/genie_money/apk/geniemoney.apk';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
