import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class RewardProgram extends StatefulWidget {
  const RewardProgram({Key? key}) : super(key: key);

  @override
  _RewardProgramState createState() => _RewardProgramState();
}

class _RewardProgramState extends State<RewardProgram> {
  final _pageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          backgroundColor: navyBlueColor,
          title: const Text(
            "Crown Rewards Program",
            style: TextStyle(
              color: kWhite,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.81,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage("images/crown_silver.png"),
                            width: width * 0.50,
                            //height: height * 0.40,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: const Text(
                              "Genie Moneyy - Silver",
                              style: TextStyle(
                                  color: navyBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: const Text(
                              "Loan repayment on due date",
                              style: TextStyle(
                                  color: navyBlueColor, fontSize: 22.0),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: const Text(
                              "Rs. 0 - 3 lakh",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:navyBlueColor,
                                  fontSize: 22.0),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.40,
                                  child: const Text(
                                    "Rs. 0 lakh / 3 lakh",
                                    style: TextStyle(
                                      color: navyBlueColor,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.40,
                                  child: const Text(
                                    "0 % Complete",
                                    style: TextStyle(
                                      color:navyBlueColor,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: width * 0.23,
                                  child: FAProgressBar(
                                    // animatedDuration: const Duration(seconds: 2),
                                    backgroundColor: const Color(0xFF3A3A3A),
                                    maxValue: 25,
                                    progressColor: navyBlueColor,
                                    currentValue: 0,
                                    size: 10.0,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.23,
                                  child: FAProgressBar(
                                    // animatedDuration: const Duration(seconds: 4),
                                    backgroundColor: const Color(0xFF3A3A3A),
                                    maxValue: 25,
                                    progressColor: navyBlueColor,
                                    currentValue: 0,
                                    size: 10.0,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.23,
                                  child: FAProgressBar(
                                    // animatedDuration: const Duration(seconds: 6),
                                    backgroundColor: const Color(0xFF3A3A3A),
                                    maxValue: 25,
                                    progressColor: navyBlueColor,
                                    currentValue: 0,
                                    size: 10.0,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.23,
                                  child: FAProgressBar(
                                    // animatedDuration: const Duration(seconds: 2),
                                    backgroundColor: const Color(0xFF3A3A3A),
                                    maxValue: 25,
                                    progressColor: navyBlueColor,
                                    currentValue: 0,
                                    size: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage("images/crown_gold.png"),
                              width: width * 0.40,
                              //height: height * 0.40,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: const Text(
                                "Genie Moneyy - Gold",
                                style: TextStyle(
                                    color: navyBlueColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: const Text(
                                "Loan repayment on due date",
                                style: TextStyle(
                                    color:navyBlueColor, fontSize: 22.0),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: const Text(
                                "Rs. 3 - 6 lakh",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: navyBlueColor,
                                    fontSize: 22.0),
                              ),
                            ),
                            Container(
                              width: width,
                              margin: const EdgeInsets.only(top: 30.0),
                              color: navyBlueColor,
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                "Benefits",
                                style: TextStyle(
                                    color: kWhite,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.30,
                                    child: const Text(
                                      "GenieMoney 90",
                                      style: TextStyle(color:navyBlueColor),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: SizedBox(
                                      width: width * 0.59,
                                      child: const Text(
                                        "Interest rate reduced from 7.5% to 7.05%",
                                        style: TextStyle(color: navyBlueColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.30,
                                    child: const Text(
                                      "GenieMoney 180",
                                      style: TextStyle(color: navyBlueColor),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: SizedBox(
                                      width: width * 0.59,
                                      child: const Text(
                                        "Interest rate reduced from 14.4% to 13.5%",
                                        style: TextStyle(color:navyBlueColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.30,
                                    child: const Text(
                                      "GenieMoney 270",
                                      style: TextStyle(color:navyBlueColor),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: SizedBox(
                                      width: width * 0.59,
                                      child: const Text(
                                        "Interest rate reduced from 20.25% to 18.9%",
                                        style: TextStyle(color:navyBlueColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.25,
                                    child: const Text(
                                      "GenieMoney 1 Year",
                                      style: TextStyle(color: navyBlueColor),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 25.0),
                                    child: SizedBox(
                                      width: width * 0.59,
                                      child: const Text(
                                        "Interest rate reduced from 27% to 25.2%",
                                        style: TextStyle(color: navyBlueColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage("images/crown_bronze.png"),
                              width: width * 0.40,
                              //height: height * 0.40,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: const Text(
                                "Genie Moneyy - Bronze",
                                style: TextStyle(
                                    color:navyBlueColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: const Text(
                                "Loan repayment on due date",
                                style: TextStyle(
                                    color:navyBlueColor, fontSize: 22.0),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: const Text(
                                "Rs. 6 - 10 lakh",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: navyBlueColor,
                                    fontSize: 22.0),
                              ),
                            ),
                            Container(
                              width: width,
                              margin: const EdgeInsets.only(top: 30.0),
                              color: navyBlueColor,
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                "Benefits",
                                style: TextStyle(
                                    color:kWhite,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.30,
                                    child: const Text(
                                      "GenieMoney 90",
                                      style: TextStyle(color: navyBlueColor),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: SizedBox(
                                      width: width * 0.59,
                                      child: const Text(
                                        "Interest rate reduced from 7.5% to 6.6%",
                                        style: TextStyle(color:  navyBlueColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.30,
                                    child: const Text(
                                      "GenieMoney 180",
                                      style: TextStyle(color:  navyBlueColor),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: SizedBox(
                                      width: width * 0.59,
                                      child: const Text(
                                        "Interest rate reduced from 14.4% to 12.6%",
                                        style: TextStyle(color:  navyBlueColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.30,
                                    child: const Text(
                                      "GenieMoney 270",
                                      style: TextStyle(color:  navyBlueColor),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: SizedBox(
                                      width: width * 0.59,
                                      child: const Text(
                                        "Interest rate reduced from 20.25% to 17.55%",
                                        style: TextStyle(color:  navyBlueColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.25,
                                    child: const Text(
                                      "GenieMoney 1 Year",
                                      style: TextStyle(color:  navyBlueColor),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 25.0),
                                    child: SizedBox(
                                      width: width * 0.59,
                                      child: const Text(
                                        "Interest rate reduced from 27% to 23.4%",
                                        style: TextStyle(color:  navyBlueColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                    onPageChanged: (int page) {
                      setState(() {
                        _pageNotifier.value = page;
                      });
                    },
                  ),
                ),
                Center(
                  child: CirclePageIndicator(
                    dotColor: const Color(0xFF3A3A3A),
                    selectedDotColor:  navyBlueColor,
                    currentPageNotifier: _pageNotifier,
                    itemCount: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
