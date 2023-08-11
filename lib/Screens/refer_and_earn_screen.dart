import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/personaldetailsscreen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReferAndEarnScreen extends StatefulWidget {

  const ReferAndEarnScreen({Key? key}) : super(key: key);

  @override
  _ReferAndEarnScreenState createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  String referalcode="";

  @override
  void initState() {
    // TODO: implement initState
    getreferal();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          backgroundColor: navyBlueColor,
          title: const Text(
            "Refer & Earn",
            style: TextStyle(color:kWhite),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: kWhite,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Text(
                    "REFER MORE, EARN MORE",
                    style: TextStyle(color: navyBlueColor, fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Image(
                    image: AssetImage("images/refer_and_earn_screen.png"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Text(
                    "Earn Rewards on every reference.",
                    style: TextStyle(color: navyBlueColor, fontSize: 16.0),
                  ),
                ),
                const Text(
                  "The more you refer the more you are rewarded.",
                  style: TextStyle(color: navyBlueColor, fontSize: 16.0),
                ),
                const Text(
                  "Please contact us for a detailed understanding",
                  style: TextStyle(color: navyBlueColor, fontSize: 16.0),
                ),
                const Text(
                  "on our Referral Reward programs...",
                  style: TextStyle(color: navyBlueColor, fontSize: 16.0),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.10),
                  width: width * 0.70,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lightbulb_sharp,
                        color: navyBlueColor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: const Text(
                          "Pro Tip to earn assured reward",
                          style: TextStyle(
                            color: navyBlueColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Card(
                    color: navyBlueColor,
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                          child: const Text("Refer a Business Partner who:",
                            style: TextStyle(color: kWhite),
                            textAlign: TextAlign.left,),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kWhite,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            "images/user_salaried.png"),
                                            color: kWhite,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Is a Business",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "entity",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kWhite,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            "images/earns_atleast.png"),
                                            color:kWhite ,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Looking for ",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                            Text(
                                              "additional biz",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0,
                              left: 5.0,
                              right: 5.0,
                              bottom: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kWhite,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            "images/above_21.png"),
                                            color: kWhite,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Is a Merchant/",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                            Text(
                                              "Self-Employed",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  // margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kWhite,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            "images/cheque_payment_receives.png"),
                                            color: kWhite,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Can refer local",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                            Text(
                                              "customers to us",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                          ],
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
                    ),
                  ),
                  
                ),
                 Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Card(
                    color: navyBlueColor,
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                          child: const Text("Refer a customer who:",
                            style: TextStyle(color: kWhite),
                            textAlign: TextAlign.left,),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kWhite,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            "images/user_salaried.png"),
                                            color: kWhite,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Is Salaried",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "full-time",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kWhite,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            "images/earns_atleast.png"),
                                            color: kWhite,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Earns atleast",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                            Text(
                                              "₹12000/month",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0,
                              left: 5.0,
                              right: 5.0,
                              bottom: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kWhite,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            "images/above_21.png"),
                                            color: kWhite,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Is above",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                            Text(
                                              "21 yrs of age",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  // margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kWhite,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            "images/cheque_payment_receives.png"),
                                            color: kWhite,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Receives salary",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                            Text(
                                              "via cheque/bank",
                                              style:
                                              TextStyle(
                                                  color: kWhite),
                                            ),
                                          ],
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
                    ),
                  ),
                  
                ),
                Container(
                  // width: width,
                  // decoration: BoxDecoration(
                  //     color: Color(0xFF3A3A3A),
                  //     borderRadius: BorderRadius.all(Radius.circular(20))
                  // ),
                  // margin: const EdgeInsets.only(top: 10.0),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(

                  //       margin: const EdgeInsets.all(10.0),
                  //       child: Text(

                  //          referalcode,
                  //         style: const TextStyle(
                  //             color: Color(0xFFFFAE00),
                  //             fontSize: 17.0
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       child: IconButton(icon: Image.asset("images/clipboard.png"), onPressed: () {
                  //         Clipboard.setData(ClipboardData(text: referalcode));
                  //         Fluttertoast.showToast(msg: "Copied to clipboard");
                  //       },),
                  //     )
                  //   ],
                  // ),
                     

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    margin: const EdgeInsets.all(10.0),
                    child: Text(

                      "Your Referal Code: " + referalcode,
                      style: const TextStyle(
                          color: navyBlueColor,
                          fontSize: 20.0
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(icon: Image.asset("images/clipboard.png", color: navyBlueColor)
                    , onPressed: () {
                      Clipboard.setData(ClipboardData(text: referalcode));
                      Fluttertoast.showToast(msg: "Copied to clipboard");
                    },),
                  )
                ],
              ),
            
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Container(
                      //   margin: const EdgeInsets.only(top: 10.0),
                      //   child: ElevatedButton(
                      //     onPressed: () {

                      //     },
                      //     child: const Text(
                      //       "Referal Status",
                      //       style: TextStyle(
                      //         color: Color(0xFFFFAE00),
                      //         fontSize: 16.0,
                      //       ),
                      //     ),
                      //     style: ElevatedButton.styleFrom(
                      //       side: BorderSide(
                      //         width: 2.0,
                      //         color: Color(0xFFFFAE00),
                      //       ),
                      //       fixedSize: Size(width * 0.40, 40.0),
                      //       primary: const Color(0xFF111111),
                      //       shadowColor: const Color(0xFF111111),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(5.0),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  const PersonalDetailsScreen(),
        ),
      );
                          },
                          child: const Text(
                            "Invite",
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 20.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.40, 40.0), backgroundColor: navyBlueColor,
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

  Future<void> getreferal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
       referalcode = sharedPreferences.getString('refer') ?? "";
      print("lalalalala" + referalcode.toString());
    });
  }
}
