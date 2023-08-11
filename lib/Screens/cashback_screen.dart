import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:genie_money/Model/payment_offers_model.dart';
import 'package:genie_money/Model/shopping_model.dart';

class CashbackScreen extends StatefulWidget {
  const CashbackScreen({Key? key}) : super(key: key);

  @override
  _CashbackScreenState createState() => _CashbackScreenState();
}

class _CashbackScreenState extends State<CashbackScreen> {
  late List<PaymentModel> paymentrechargeList;
  late List<PaymentModel> paymentcashbackList;
  late List<ShoppingModel> paymentshoppingList;

  @override
  void initState() {
    paymentrechargeList = [
      PaymentModel(
        "Pay credit card bill",
        "Get upto 1000 Cashback Points",
        const Icon(
          CupertinoIcons.creditcard,
          color: Color(0xFFFFAE00),
          size: 50.0,
        ),
      ),
      PaymentModel(
        "Pay Rent",
        "Get upto \u20B910000",
        const Icon(
          CupertinoIcons.home,
          color: Color(0xFFFFAE00),
          size: 50.0,
        ),
      ),
      PaymentModel(
        "Pay Rent",
        "Get upto \u20B91000 Cashback",
        const Icon(
          CupertinoIcons.home,
          color: Color(0xFFFFAE00),
          size: 50.0,
        ),
      ),
      PaymentModel(
        "Pay electricity bill",
        "Get upto \u20B9100 Cashback",
        const Icon(
          CupertinoIcons.lightbulb,
          color: Color(0xFFFFAE00),
          size: 50.0,
        ),
      ),
    ];

    paymentcashbackList = [
      PaymentModel(
        "Pay electricity bill",
        "Get upto \u20B9100 Cashback",
        const Icon(
          CupertinoIcons.lightbulb,
          color: Color(0xFFFFAE00),
          size: 50.0,
        ),
      ),
      PaymentModel(
        "Pay Rent",
        "Get upto \u20B910000",
        const Icon(
          CupertinoIcons.home,
          color: Color(0xFFFFAE00),
          size: 50.0,
        ),
      ),
      PaymentModel(
        "Pay Rent",
        "Get upto \u20B91000 Cashback",
        const Icon(
          CupertinoIcons.home,
          color: Color(0xFFFFAE00),
          size: 50.0,
        ),
      ),
      PaymentModel(
        "Pay credit card bill",
        "Get upto 1000 Cashback Points",
        const Icon(
          CupertinoIcons.creditcard,
          color: Color(0xFFFFAE00),
          size: 50.0,
        ),
      ),
    ];

    paymentshoppingList = [
      ShoppingModel(
        "Pay on Flipkart",
        "Get upto \u20B9100 Cashback",
        "images/flipkart.png"
      ),
      ShoppingModel(
          "Pay on Grofers",
          "Get upto \u20B9500 Cashback",
          "images/grofers.png"
      ),
      ShoppingModel(
          "Pay on Dominos",
          "Get upto \u20B9500 Cashback",
          "images/dominos.png"
      ),
      ShoppingModel(
          "Pay on Zomato",
          "Get upto \u20B9500 Cashback",
          "images/zomato.png"
      ),
      ShoppingModel(
          "Pay on Swiggy",
          "Get upto \u20B9750 Cashback",
          "images/swiggy.png"
      ),
    ];
    super.initState();
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
          "Cashback & Offers",
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
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: width * 0.307,
                      child: Card(
                        color: const Color(0xFF3A3A3A),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          side: BorderSide(
                            color: Color(0xFFFFAE00),
                            width: 2.0,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "₹10",
                                style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: const Text(
                                  "Cashback Won",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 16.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.307,
                      child: Card(
                        color: const Color(0xFF3A3A3A),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          side: BorderSide(
                            color: Color(0xFFFFAE00),
                            width: 2.0,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "1,698",
                                style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: const Text(
                                  "Cashback Points",
                                  style: TextStyle(
                                      color: Color(0xFFFFAE00), fontSize: 16.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.307,
                      child: Card(
                        color: const Color(0xFF3A3A3A),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          side: BorderSide(
                            color: Color(0xFFFFAE00),
                            width: 2.0,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "10",
                                style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: const Text(
                                  "Vouchers & Deals",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 16.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.04),
                  child: const Text(
                    "Recharge and Bill Payment Offers",
                    style: TextStyle(
                      color: Color(0xFFFFAE00),
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: SizedBox(
                    height: 200,
                    child: ListView.separated(
                      itemCount: paymentrechargeList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 200,
                          width: 155.0,
                          child: Card(
                            color: const Color(0xFF3A3A3A),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              side: BorderSide(
                                color: Color(0xFFFFAE00),
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 30.0),
                                    child: paymentrechargeList[index].icon,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * 0.03),
                                    child: Text(
                                      paymentrechargeList[index].name,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height * 0.01,
                                        left: width * 0.01,
                                        right: width * 0.01,
                                        bottom: height * 0.02),
                                    child: Text(
                                      paymentrechargeList[index].offer,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 20.0,
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.04),
                  child: const Text(
                    "Cashback Points Offers",
                    style: TextStyle(
                      color: Color(0xFFFFAE00),
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: SizedBox(
                    height: 200,
                    child: ListView.separated(
                      itemCount: paymentcashbackList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 200,
                          width: 155.0,
                          child: Card(
                            color: const Color(0xFF3A3A3A),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              side: BorderSide(
                                color: Color(0xFFFFAE00),
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 30.0),
                                    child: paymentcashbackList[index].icon,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * 0.03),
                                    child: Text(
                                      paymentcashbackList[index].name,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height * 0.01,
                                        left: width * 0.01,
                                        right: width * 0.01,
                                        bottom: height * 0.01),
                                    child: Text(
                                      paymentcashbackList[index].offer,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 20.0,
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.04),
                  child: const Text(
                    "Online Shopping Offers",
                    style: TextStyle(
                      color: Color(0xFFFFAE00),
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView.separated(
                      itemCount: paymentshoppingList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 200,
                          width: 155.0,
                          child: Card(
                            color: const Color(0xFF3A3A3A),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              side: BorderSide(
                                color: Color(0xFFFFAE00),
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 30.0),
                                    child: Image(
                                      image: AssetImage(paymentshoppingList[index].image),
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * 0.03),
                                    child: Text(
                                      paymentshoppingList[index].name,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height * 0.01,
                                        left: width * 0.01,
                                        right: width * 0.01,
                                        bottom: height * 0.01),
                                    child: Text(
                                      paymentshoppingList[index].offer,
                                      style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 20.0,
                        );
                      },
                    ),
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
