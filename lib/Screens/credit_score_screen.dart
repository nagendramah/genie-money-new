import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:genie_money/Model/pre_approved_offers_model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CreditScoreScreen extends StatefulWidget {
  const CreditScoreScreen({Key? key}) : super(key: key);

  @override
  _CreditScoreScreenState createState() => _CreditScoreScreenState();
}

class _CreditScoreScreenState extends State<CreditScoreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late List<PreApprovedOffers> preoffersList;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    preoffersList = [
      PreApprovedOffers(
          "images/personal_loan_offer.png",
          "Personal Loan Offer",
          "images/kredit_bee_offer.png",
          "You have a Pre-Approved loan of \u20B98,000",
          "No Documentation",
          "Hassle Free Process",
          "Instant Money Transfer"),
      PreApprovedOffers(
          "images/credit_card_offer.png",
          "Credit Card Offer",
          "images/credit_card_indusind.png",
          "IndusInd Bank Platinum Aura Edge Credit Card",
          "Lifetime Free",
          "4x Reward Points",
          "Savings on Fuel"),
    ];
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
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "Credit Score",
          style: TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFFFAE00),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xFF3A3A3A),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.7388,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text:
                                  "We have updated out T&C for Genie Moneyy Credit Score Services, By continuing your use of Genie Moneyy account, you agree with the updated ",
                              style: TextStyle(
                                  color: Color(0xFFFFAE00), fontSize: 12.0),
                            ),
                            TextSpan(
                                text:
                                    "Terms of Service - Genie Moneyy Credit Score.",
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: ElevatedButton(
                        child: const Text(
                          "OK",
                          style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width * 0.10, 25.0),
                          primary: const Color(0xFFFFAE00),
                          shadowColor: const Color(0xFFFFAE00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const SignInScreen()),
                          // );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicatorColor: Color(0xFFFFAE00),
                        controller: _tabController,
                        labelColor: Color(0xFFFFAE00),
                        unselectedLabelColor: Colors.white,
                        tabs: const [
                          Tab(
                            child: Text(
                              "CIBIL",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "EQUIFAX",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "EXPERIAN",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "HIGHMARK",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 750,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            cibil_screen(width, height),
                            equifax_screen(width, height),
                            experian_screen(width, height),
                            highmark_screen(width, height),
                            // Text(
                            //   "Tab 2",
                            //   style: TextStyle(
                            //     color: Color(0xFFFFAE00),
                            //   ),
                            // ),
                            // Text(
                            //   "Tab 3",
                            //   style: TextStyle(
                            //     color: Color(0xFFFFAE00),
                            //   ),
                            // ),
                            // Text(
                            //   "Tab 4",
                            //   style: TextStyle(
                            //     color: Color(0xFFFFAE00),
                            //   ),
                            // ),
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
      ),
    );
  }

  Widget cibil_screen(double width, double height) {
    double value = 799;
    return Container(
      height: height * 0.20,
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
            Center(
              child: Text(
                "Hi Arvind, your Dec '21 score is up by 1 points",
                style: const TextStyle(
                  color: Color(0xFFFFAE00),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Score as of",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      Text(
                        "Dec '21",
                        style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Next update on",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      Text(
                        "24 Jan '22",
                        style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.10,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    interval: 600,
                    labelsPosition: ElementsPosition.outside,
                    showLabels: true,
                    showTicks: true,
                    maximumLabels: 2,
                    labelOffset: 20.0,
                    showFirstLabel: true,
                    showLastLabel: true,
                    axisLabelStyle: GaugeTextStyle(
                        color: Color(0xFFFFAE00), fontSize: 18.0),
                    startAngle: 175,
                    endAngle: 5,
                    radiusFactor: 2.9,
                    canScaleToFit: true,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.5,
                      color: Colors.black,
                      thicknessUnit: GaugeSizeUnit.factor,
                      cornerStyle: CornerStyle.startCurve,
                    ),
                    minimum: 300,
                    maximum: 900,
                    ranges: [
                      GaugeRange(
                          startValue: 300,
                          endValue: 350,
                          color: (value >= 300 && value <= 350) || value > 350
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 351,
                          endValue: 400,
                          color: (value >= 351 && value <= 400) || value > 400
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 401,
                          endValue: 450,
                          color: (value >= 401 && value <= 450) || value > 450
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 451,
                          endValue: 500,
                          color: (value >= 451 && value <= 500) || value > 500
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 501,
                          endValue: 550,
                          color: (value >= 501 && value <= 550) || value > 550
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 551,
                          endValue: 600,
                          color: (value >= 551 && value <= 600) || value > 600
                              ? Colors.orange
                              : Colors.grey),
                      GaugeRange(
                          startValue: 601,
                          endValue: 650,
                          color: (value >= 601 && value <= 650) || value > 650
                              ? Colors.orange
                              : Colors.grey),
                      GaugeRange(
                          startValue: 651,
                          endValue: 700,
                          color: (value >= 651 && value <= 700) || value > 700
                              ? Colors.yellow
                              : Colors.grey),
                      GaugeRange(
                          startValue: 701,
                          endValue: 750,
                          color: (value >= 701 && value <= 750) || value > 750
                              ? Colors.yellow
                              : Colors.grey),
                      GaugeRange(
                          startValue: 751,
                          endValue: 800,
                          color: (value >= 751 && value <= 800) || value > 800
                              ? Colors.green
                              : Colors.grey),
                      GaugeRange(
                          startValue: 801,
                          endValue: 850,
                          color: (value >= 801 && value <= 850) || value > 850
                              ? Colors.green
                              : Colors.grey),
                      GaugeRange(
                          startValue: 851,
                          endValue: 900,
                          color: (value >= 850 && value <= 900)
                              ? Colors.green
                              : Colors.grey),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFFAE00)),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.0),
                      const GaugeAnnotation(
                          widget: Text(
                            "Good",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          angle: 90,
                          positionFactor: 0.3),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                child: const Text(
                  "Download Report",
                  style: TextStyle(
                      color: Color(0xFFFFAE00),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xFFFFAE00)),
                    ),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SignInScreen()),
                  // );
                },
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    child: Container(
                      width: width * 0.472,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFAE00),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Credit Factors",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: width * 0.472,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFAE00),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Score Trends",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Image(
                    image: AssetImage("images/achievement_offer.png"),
                    width: 30.0,
                    height: 30.0,
                  ),
                  SizedBox(
                    width: width * 0.86,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.90,
                          child: Text(
                            "Pre-Approved & Pre-Qualified Offers",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: const Text(
                            "Carefully chosen offers based on your profile",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 408,
                width: width,
                child: ListView.builder(
                  itemCount: preoffersList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 240,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        color: const Color(0xFF3A3A3A),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                color: Colors.deepOrange,
                              ),
                              padding: const EdgeInsets.all(2.0),
                              width: width,
                              child: const Text(
                                "Pre-Approved",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      preoffersList[index].icon,
                                    ),
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].title,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Image(
                                  image: AssetImage(
                                    preoffersList[index].company_image,
                                  ),
                                  width: 120.0,
                                  height: 70.0,
                                  fit: BoxFit.fill),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              child: Text(
                                preoffersList[index].big_title,
                                style: const TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_1,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_2,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_3,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                child: Container(
                                  width: 133,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFFFAE00),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Know More",
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10.0),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xFFFFAE00),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
      ),
    );
  }

  Widget equifax_screen(double width, double height) {
    double value = 799;
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Hi Arvind, your Dec '21 score is up by 1 points",
                style: const TextStyle(
                  color: Color(0xFFFFAE00),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Score as of",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      Text(
                        "Dec '21",
                        style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Next update on",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      Text(
                        "24 Jan '22",
                        style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.10,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    interval: 600,
                    labelsPosition: ElementsPosition.outside,
                    showLabels: true,
                    showTicks: true,
                    maximumLabels: 2,
                    labelOffset: 20.0,
                    showFirstLabel: true,
                    showLastLabel: true,
                    axisLabelStyle: GaugeTextStyle(
                        color: Color(0xFFFFAE00), fontSize: 18.0),
                    startAngle: 175,
                    endAngle: 5,
                    radiusFactor: 2.9,
                    canScaleToFit: true,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.5,
                      color: Colors.black,
                      thicknessUnit: GaugeSizeUnit.factor,
                      cornerStyle: CornerStyle.startCurve,
                    ),
                    minimum: 300,
                    maximum: 900,
                    ranges: [
                      GaugeRange(
                          startValue: 300,
                          endValue: 350,
                          color: (value >= 300 && value <= 350) || value > 350
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 351,
                          endValue: 400,
                          color: (value >= 351 && value <= 400) || value > 400
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 401,
                          endValue: 450,
                          color: (value >= 401 && value <= 450) || value > 450
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 451,
                          endValue: 500,
                          color: (value >= 451 && value <= 500) || value > 500
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 501,
                          endValue: 550,
                          color: (value >= 501 && value <= 550) || value > 550
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 551,
                          endValue: 600,
                          color: (value >= 551 && value <= 600) || value > 600
                              ? Colors.orange
                              : Colors.grey),
                      GaugeRange(
                          startValue: 601,
                          endValue: 650,
                          color: (value >= 601 && value <= 650) || value > 650
                              ? Colors.orange
                              : Colors.grey),
                      GaugeRange(
                          startValue: 651,
                          endValue: 700,
                          color: (value >= 651 && value <= 700) || value > 700
                              ? Colors.yellow
                              : Colors.grey),
                      GaugeRange(
                          startValue: 701,
                          endValue: 750,
                          color: (value >= 701 && value <= 750) || value > 750
                              ? Colors.yellow
                              : Colors.grey),
                      GaugeRange(
                          startValue: 751,
                          endValue: 800,
                          color: (value >= 751 && value <= 800) || value > 800
                              ? Colors.green
                              : Colors.grey),
                      GaugeRange(
                          startValue: 801,
                          endValue: 850,
                          color: (value >= 801 && value <= 850) || value > 850
                              ? Colors.green
                              : Colors.grey),
                      GaugeRange(
                          startValue: 851,
                          endValue: 900,
                          color: (value >= 850 && value <= 900)
                              ? Colors.green
                              : Colors.grey),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFFAE00)),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.0),
                      const GaugeAnnotation(
                          widget: Text(
                            "Good",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          angle: 90,
                          positionFactor: 0.3),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                child: const Text(
                  "Download Report",
                  style: TextStyle(
                      color: Color(0xFFFFAE00),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xFFFFAE00)),
                    ),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SignInScreen()),
                  // );
                },
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    child: Container(
                      width: width * 0.472,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFAE00),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Credit Factors",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: width * 0.472,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFAE00),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Score Trends",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Image(
                    image: AssetImage("images/achievement_offer.png"),
                    width: 30.0,
                    height: 30.0,
                  ),
                  SizedBox(
                    width: width * 0.86,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.90,
                          child: Text(
                            "Pre-Approved & Pre-Qualified Offers",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: const Text(
                            "Carefully chosen offers based on your profile",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 408,
                width: width,
                child: ListView.builder(
                  itemCount: preoffersList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 240,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        color: const Color(0xFF3A3A3A),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                color: Colors.deepOrange,
                              ),
                              padding: const EdgeInsets.all(2.0),
                              width: width,
                              child: const Text(
                                "Pre-Approved",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      preoffersList[index].icon,
                                    ),
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].title,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Image(
                                  image: AssetImage(
                                    preoffersList[index].company_image,
                                  ),
                                  width: 120.0,
                                  height: 70.0,
                                  fit: BoxFit.fill),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              child: Text(
                                preoffersList[index].big_title,
                                style: const TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_1,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_2,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_3,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                child: Container(
                                  width: 133,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFFFAE00),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Know More",
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10.0),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xFFFFAE00),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget experian_screen(double width, double height) {
    double value = 799;
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Hi Arvind, your Dec '21 score is up by 1 points",
                style: const TextStyle(
                  color: Color(0xFFFFAE00),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Score as of",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      Text(
                        "Dec '21",
                        style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Next update on",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      Text(
                        "24 Jan '22",
                        style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.10,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    interval: 600,
                    labelsPosition: ElementsPosition.outside,
                    showLabels: true,
                    showTicks: true,
                    maximumLabels: 2,
                    labelOffset: 20.0,
                    showFirstLabel: true,
                    showLastLabel: true,
                    axisLabelStyle: GaugeTextStyle(
                        color: Color(0xFFFFAE00), fontSize: 18.0),
                    startAngle: 175,
                    endAngle: 5,
                    radiusFactor: 2.9,
                    canScaleToFit: true,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.5,
                      color: Colors.black,
                      thicknessUnit: GaugeSizeUnit.factor,
                      cornerStyle: CornerStyle.startCurve,
                    ),
                    minimum: 300,
                    maximum: 900,
                    ranges: [
                      GaugeRange(
                          startValue: 300,
                          endValue: 350,
                          color: (value >= 300 && value <= 350) || value > 350
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 351,
                          endValue: 400,
                          color: (value >= 351 && value <= 400) || value > 400
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 401,
                          endValue: 450,
                          color: (value >= 401 && value <= 450) || value > 450
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 451,
                          endValue: 500,
                          color: (value >= 451 && value <= 500) || value > 500
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 501,
                          endValue: 550,
                          color: (value >= 501 && value <= 550) || value > 550
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 551,
                          endValue: 600,
                          color: (value >= 551 && value <= 600) || value > 600
                              ? Colors.orange
                              : Colors.grey),
                      GaugeRange(
                          startValue: 601,
                          endValue: 650,
                          color: (value >= 601 && value <= 650) || value > 650
                              ? Colors.orange
                              : Colors.grey),
                      GaugeRange(
                          startValue: 651,
                          endValue: 700,
                          color: (value >= 651 && value <= 700) || value > 700
                              ? Colors.yellow
                              : Colors.grey),
                      GaugeRange(
                          startValue: 701,
                          endValue: 750,
                          color: (value >= 701 && value <= 750) || value > 750
                              ? Colors.yellow
                              : Colors.grey),
                      GaugeRange(
                          startValue: 751,
                          endValue: 800,
                          color: (value >= 751 && value <= 800) || value > 800
                              ? Colors.green
                              : Colors.grey),
                      GaugeRange(
                          startValue: 801,
                          endValue: 850,
                          color: (value >= 801 && value <= 850) || value > 850
                              ? Colors.green
                              : Colors.grey),
                      GaugeRange(
                          startValue: 851,
                          endValue: 900,
                          color: (value >= 850 && value <= 900)
                              ? Colors.green
                              : Colors.grey),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFFAE00)),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.0),
                      const GaugeAnnotation(
                          widget: Text(
                            "Good",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          angle: 90,
                          positionFactor: 0.3),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                child: const Text(
                  "Download Report",
                  style: TextStyle(
                      color: Color(0xFFFFAE00),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xFFFFAE00)),
                    ),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SignInScreen()),
                  // );
                },
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    child: Container(
                      width: width * 0.472,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFAE00),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Credit Factors",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: width * 0.472,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFAE00),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Score Trends",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Image(
                    image: AssetImage("images/achievement_offer.png"),
                    width: 30.0,
                    height: 30.0,
                  ),
                  SizedBox(
                    width: width * 0.86,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.90,
                          child: Text(
                            "Pre-Approved & Pre-Qualified Offers",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: const Text(
                            "Carefully chosen offers based on your profile",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 408,
                width: width,
                child: ListView.builder(
                  itemCount: preoffersList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 240,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        color: const Color(0xFF3A3A3A),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                color: Colors.deepOrange,
                              ),
                              padding: const EdgeInsets.all(2.0),
                              width: width,
                              child: const Text(
                                "Pre-Approved",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      preoffersList[index].icon,
                                    ),
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].title,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Image(
                                  image: AssetImage(
                                    preoffersList[index].company_image,
                                  ),
                                  width: 120.0,
                                  height: 70.0,
                                  fit: BoxFit.fill),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              child: Text(
                                preoffersList[index].big_title,
                                style: const TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_1,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_2,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_3,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                child: Container(
                                  width: 133,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFFFAE00),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Know More",
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10.0),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xFFFFAE00),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget highmark_screen(double width, double height) {
    double value = 799;
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Hi Arvind, your Dec '21 score is up by 1 points",
                style: const TextStyle(
                  color: Color(0xFFFFAE00),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Score as of",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      Text(
                        "Dec '21",
                        style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Next update on",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      Text(
                        "24 Jan '22",
                        style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.10,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    interval: 600,
                    labelsPosition: ElementsPosition.outside,
                    showLabels: true,
                    showTicks: true,
                    maximumLabels: 2,
                    labelOffset: 20.0,
                    showFirstLabel: true,
                    showLastLabel: true,
                    axisLabelStyle: GaugeTextStyle(
                        color: Color(0xFFFFAE00), fontSize: 18.0),
                    startAngle: 175,
                    endAngle: 5,
                    radiusFactor: 2.9,
                    canScaleToFit: true,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.5,
                      color: Colors.black,
                      thicknessUnit: GaugeSizeUnit.factor,
                      cornerStyle: CornerStyle.startCurve,
                    ),
                    minimum: 300,
                    maximum: 900,
                    ranges: [
                      GaugeRange(
                          startValue: 300,
                          endValue: 350,
                          color: (value >= 300 && value <= 350) || value > 350
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 351,
                          endValue: 400,
                          color: (value >= 351 && value <= 400) || value > 400
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 401,
                          endValue: 450,
                          color: (value >= 401 && value <= 450) || value > 450
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 451,
                          endValue: 500,
                          color: (value >= 451 && value <= 500) || value > 500
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 501,
                          endValue: 550,
                          color: (value >= 501 && value <= 550) || value > 550
                              ? Colors.red
                              : Colors.grey),
                      GaugeRange(
                          startValue: 551,
                          endValue: 600,
                          color: (value >= 551 && value <= 600) || value > 600
                              ? Colors.orange
                              : Colors.grey),
                      GaugeRange(
                          startValue: 601,
                          endValue: 650,
                          color: (value >= 601 && value <= 650) || value > 650
                              ? Colors.orange
                              : Colors.grey),
                      GaugeRange(
                          startValue: 651,
                          endValue: 700,
                          color: (value >= 651 && value <= 700) || value > 700
                              ? Colors.yellow
                              : Colors.grey),
                      GaugeRange(
                          startValue: 701,
                          endValue: 750,
                          color: (value >= 701 && value <= 750) || value > 750
                              ? Colors.yellow
                              : Colors.grey),
                      GaugeRange(
                          startValue: 751,
                          endValue: 800,
                          color: (value >= 751 && value <= 800) || value > 800
                              ? Colors.green
                              : Colors.grey),
                      GaugeRange(
                          startValue: 801,
                          endValue: 850,
                          color: (value >= 801 && value <= 850) || value > 850
                              ? Colors.green
                              : Colors.grey),
                      GaugeRange(
                          startValue: 851,
                          endValue: 900,
                          color: (value >= 850 && value <= 900)
                              ? Colors.green
                              : Colors.grey),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFFAE00)),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.0),
                      const GaugeAnnotation(
                          widget: Text(
                            "Good",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          angle: 90,
                          positionFactor: 0.3),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                child: const Text(
                  "Download Report",
                  style: TextStyle(
                      color: Color(0xFFFFAE00),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xFFFFAE00)),
                    ),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SignInScreen()),
                  // );
                },
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    child: Container(
                      width: width * 0.472,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFAE00),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Credit Factors",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: width * 0.472,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFAE00),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Score Trends",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Image(
                    image: AssetImage("images/achievement_offer.png"),
                    width: 30.0,
                    height: 30.0,
                  ),
                  SizedBox(
                    width: width * 0.86,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.90,
                          child: Text(
                            "Pre-Approved & Pre-Qualified Offers",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: const Text(
                            "Carefully chosen offers based on your profile",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 408,
                width: width,
                child: ListView.builder(
                  itemCount: preoffersList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 240,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        color: const Color(0xFF3A3A3A),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                color: Colors.deepOrange,
                              ),
                              padding: const EdgeInsets.all(2.0),
                              width: width,
                              child: const Text(
                                "Pre-Approved",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      preoffersList[index].icon,
                                    ),
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].title,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Image(
                                  image: AssetImage(
                                    preoffersList[index].company_image,
                                  ),
                                  width: 120.0,
                                  height: 70.0,
                                  fit: BoxFit.fill),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              child: Text(
                                preoffersList[index].big_title,
                                style: const TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_1,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_2,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, right: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFFFFAE00),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      preoffersList[index].point_3,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                child: Container(
                                  width: 133,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFFFAE00),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Know More",
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10.0),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xFFFFAE00),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
