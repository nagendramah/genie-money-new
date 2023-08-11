import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:genie_money/Screens/Bank_Product_details_screen.dart';
import 'package:genie_money/Screens/Credit_Card_Lead_Generation_Page.dart';
import 'package:genie_money/Screens/install_screen.dart';
import 'package:genie_money/Screens/traditional_credit_card.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/data/remote/network/ApiHandler.dart';
import 'package:genie_money/utils/silver_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/home_menu_list_model.dart';
import 'package:genie_money/Model/product_by_category_model.dart'
as productData;

class NewCreditCardScreen extends StatefulWidget {
  final String? banktype;
  const NewCreditCardScreen({Key? key, this.banktype, required String loanType}) : super(key: key);
  // String account;
  // NewCreditCardScreen({required this.account});

  @override
  State<NewCreditCardScreen> createState() => _NewCreditCardScreenState();
}

class _NewCreditCardScreenState extends State<NewCreditCardScreen> {
  List<HomePageList> homepageList = [];
  String type = "";
  var tempindex;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: Text(
          type == "Customer" ? "Credit Card" : "Credit Card",
          style: TextStyle(
            color: kWhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 15.0,left: 25,right: 25, ),
                child: GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    height: height * 0.25,
                  ),
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    tempindex = index;
                    return GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BankProductDetailsScreen(
                                      bankName: homepageList[index].name,
                                    )));
                       /* if (homepageList[index].name ==
                            "Traditional Credit Cards") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TraditionalCreditCards()));
                        }
                        if (homepageList[index].name == "HDFC Bank") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "hdfccredit",
                                      )));

                        } else if (homepageList[index].name == "IDFC Bank") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "IDFCBankcredit",
                                      )));

                        } else if (homepageList[index].name == "IDFC First") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "IDFCFirstcredit",
                                      )));

                        } else if (homepageList[index].name ==
                            "IndusInd Bank") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "IndusIndcredit",
                                      )));

                        } else if (homepageList[index].name == "SBI Bank") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "SBIcredit",
                                      )));


                        } else if (homepageList[index].name == "Yes Bank") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Yescredit",
                                      )));

                        } else if (homepageList[index].name ==
                            "Standard Chartered") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "StandardCharteredcredit",
                                      )));

                        } else if (homepageList[index].name == "Axis Bank") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Axiscredit",
                                      )));


                        } else if (homepageList[index].name ==
                            "American Express") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Americancredit"

                                      )));


                        } else if (homepageList[index].name == "Aspire") {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreditCardLeadGeneration(
                                        bankname: homepageList[tempindex].name,
                                        leadtype: 'aspire',
                                        account: homepageList[tempindex].type,
                                      )));
                        } else if (homepageList[index].name ==
                            "AU Small Finance Bank") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "AUSmallcredit",
                                      )));
                        } else if (homepageList[index].name == "BOB Cards") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "BOBcredit",
                                      )));
                        } else if (homepageList[index].name == "Bajaj RBL") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Bajajcredit",
                                      )));
                        } else if (homepageList[index].name == "GILD") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "gildcredit",
                                      )));
                        } else {
                          _alertDialog();
                        }*/
                      },
                      child: Card(
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            // side: BorderSide(
                            //   color: Color(0xFFFFAE00),
                            //   width: 2.0,
                            // )
                            ),
                        color: navyBlueColor,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 15.0),
                                child:  Image.network(homepageList[index].image,
                                  width: 80.0,
                                  height: 80.0,
                                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                                    return Image.asset("images/geniemoney.png",
                                      width: 50.0,
                                      height: 50.0,
                                    );
                                  },
                                )/*Image(
                                commented by Krishna
                                  image: AssetImage(homepageList[index].image),
                                  width: 50.0,
                                  height: 50.0,
                                ),*/
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 5, left: 5.0, right: 5.0,bottom: 20),
                                child: Text(
                                  homepageList[index].name,
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 15.0,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
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

  @override
  void initState() {
    BindData();
    /*homepageList = [

      HomePageList(
          id: "9",
          name: "Instant Personal Loan",
          image: "images/GM-InstantPersonalloan.png",
          type: 'personal_loan'),
      HomePageList(
          id: "10",
          name: "Instant Consumer Loan",
          image: "images/consumer_loan.png",
          type: 'personal_loan'),
      HomePageList(
          id: "11",
          name: "Business Loan",
          image: "images/bloan.png",
          type: 'personal_loan'),
      HomePageList(
          id: "12",
          name: "Professional Loan",
          image: "images/GM-ProfessionalLoan.png",
          type: 'personal_loan'),
      HomePageList(
          id: "77",
          name: "Bill Discounting",
          image: "images/discounting.png",
          type: 'personal_loan'),
      *//*  HomePageList(
          id: "78", name: "EMI Calculator", image: "images/GM-EMICalculator.png")
*//*
    ];*/
    getUserType();

    super.initState();
  }

  void _alertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFF3A3A3A),
            content: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 12,
                    ),
                    child: Text(
                      "Getting Activated Soon",
                      style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 1),
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      child: const Text(
                        "Ok",
                        style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(30, 80.0),
                        primary: const Color(0xFFFFAE00),
                        shadowColor: const Color(0xFFFFAE00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = (prefs.get("type") ?? "Customer").toString();
    });
//Commented by Krishna
    /*homepageList = [
      ///comenting below sunil
      *//* HomePageList(
            id: "9", name: "Smart Neo Card", image: "images/SmartNeoCard.png"),
        HomePageList(
            id: "10", name: "Traditional Credit Cards", image: "images/Traditional Credit Card.png"),*//*

      ///ADDING BELOW CODE
      HomePageList(
          id: "8",
          name: "HDFC Bank",
          image: "images/hdfc-bank-limited.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "IDFC Bank",
          image: "images/idfc.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "IDFC First",
          image: "images/idfc.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "IndusInd Bank",
          image: "images/indusind-bank--600.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "SBI Bank",
          image: "images/sbi.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "Yes Bank",
          image: "images/yesbank.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "Standard Chartered",
          image: "images/charted.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "Axis Bank",
          image: "images/axis.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "American Express",
          image: "images/AmericanExpress.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "Aspire",
          image: "images/Aspire.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "AU Small Finance Bank",
          image: "images/au.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "BOB Cards",
          image: "images/BOB.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8",
          name: "Bajaj RBL",
          image: "images/RBL_logo_262.png",
          type: 'Credit Card'),
      HomePageList(
          id: "8", name: "GILD", image: "images/GILD.png", type: 'Credit Card'),

    ];*/

    /*   HomePageList(
            id: "11", name: "Business Loan", image: "images/bloan.png"),
        HomePageList(
            id: "12", name: "Professional Loan", image: "images/GM-ProfessionalLoan.png"),
        HomePageList(
            id: "77", name: "Bill Discounting", image: "images/discounting.png"),
        HomePageList(
            id: "78", name: "EMI Calculator", image: "images/GM-EMICalculator.png"),
*/
    /* homepageList = [
        HomePageList(
            id: "9", name: "Instant Personal Loan", image: "images/instant_loan.png"),
        HomePageList(
            id: "10", name: "Buy Now Pay Later", image: "images/consumer_loan.png")

      ];*/

    // else if(type == "Retailer" || type == "Distributor" || type == "Super Distributor") {
    //   homepageList = [
    //     HomePageList(
    //         id: "9", name: "Instant Personal Loan", image: "images/GM-InstantPersonalloan.png"),
    //     HomePageList(
    //         id: "10", name: "Instant Consumer Loan", image: "images/consumer_loan.png"),
    //     HomePageList(
    //         id: "11", name: "Business Loan", image: "images/bloan.png"),
    //     HomePageList(
    //         id: "12", name: "Professional Loan", image: "images/GM-ProfessionalLoan.png"),
    //     HomePageList(
    //         id: "77", name: "Bill Discounting", image: "images/discounting.png"),
    //     HomePageList(
    //         id: "78", name: "EMI Calculator", image: "images/GM-EMICalculator.png"),
    //
    //   ];
    // }
  }
  List<productData.Data>? data = <productData.Data>[];
  Future<void> BindData() async {
    try {
      String url =
          "https://leadapi.banksathi.com/api/b2b/productByCategory?category_id=3";
      final response = await ApiHandler.shared.getProductbyCategory(url);
      data = response!.data;
      for (var dataList in data!) {
        homepageList.add(HomePageList(
            id: dataList.productId.toString(),
            name: dataList.title,
            image: dataList.logo,
            type: "Credit Card"));
      }
      setState(() {});
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
