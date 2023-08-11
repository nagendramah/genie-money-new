import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/Bank_Product_details_screen.dart';
import 'package:genie_money/Screens/Credit_Card_Lead_Generation_Page.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/data/remote/network/ApiHandler.dart';
import 'package:genie_money/utils/silver_delegate.dart';
import 'package:genie_money/Model/product_by_category_model.dart'
    as productData;

class CreditLinesBankScreen extends StatefulWidget {
  // const CreditLinesBankScreen({Key? key}) : super(key: key);
  var loanType;
//String account;
  CreditLinesBankScreen({
    required this.loanType,
  });
  @override
  State<CreditLinesBankScreen> createState() => _CreditLinesBankScreenState();
}

class _CreditLinesBankScreenState extends State<CreditLinesBankScreen> {
  List<HomePageList> homepageList = [];
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
          widget.loanType,
          // "Credit Lines Banks",
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
                margin: const EdgeInsets.only(top: 15.0,left: 25,right: 25),
                child: GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    height: height * 0.22,
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
            /*            if (homepageList[index].name == "Bajaj EMI Card") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "BajajEMICard",
                                      )));
                        } else if (homepageList[index].name ==
                            "Freecharge Pay Later") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreditCardLeadGeneration(
                                        bankname: homepageList[tempindex].name,
                                        leadtype: 'Frecharge Pay Later',
                                        account: homepageList[tempindex].type,
                                      )));
                        } else if (homepageList[index].name == "Money Tap") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "MoneyTap",
                                      )));
                        } else if (homepageList[index].name == "ICICI Bank") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "icicibankloan",
                                      )));
                        } else if (homepageList[index].name ==
                            "IndusInd Bank") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "IndusIndbankloan",
                                      )));
                        } else if (homepageList[index].name == "IDFC Bank") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "IDFCbankloan",
                                      )));
                        } else if (homepageList[index].name == "InstaMoney") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "InstaMoneybankloan",
                                      )));
                        } else if (homepageList[index].name == "MPocket") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "MPocketbankloan",
                                      )));
                        } else if (homepageList[index].name == "CASHe") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "CASHebankloan",
                                      )));
                        } else if (homepageList[index].name == "Fibe") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Fibebankloan",
                                      )));
                        } else if (homepageList[index].name == "Upwards") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Upwardsbankloan",
                                      )));
                        } else if (homepageList[index].name == "Nira") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Nirabankloan",
                                      )));
                        } else if (homepageList[index].name == "True Balance") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "TrueBalancebankloan",
                                      )));
                        } else if (homepageList[index].name == "Prefr") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Prefrbankloan",
                                      )));
                        } else if (homepageList[index].name == "Money Wide") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "MoneyWidebankloan",
                                      )));
                        } else if (homepageList[index].name == "Kredit Bee") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "KreditBeebankloan",
                                      )));
                        } else if (homepageList[index].name == "Money View") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "MoneyViewbankloan",
                                      )));
                        } else if (homepageList[index].name == "PaySense") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "PaySensebankloan",
                                      )));
                        } else if (homepageList[index].name == "Smart Coin") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "SmartCoinbankloan",
                                      )));
                        } else if (homepageList[index].name == "Finnable") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Finnablebankloan",
                                      )));
                        } else if (homepageList[index].name == "PayMe") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "PayMebankloan",
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
                                margin: const EdgeInsets.only(top: 20.0),
                                child: Image.network(homepageList[index].image,
                                width: 80.0,
                                  height: 80.0,
                                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                                    return Image.asset("images/geniemoney.png",
                                      width: 50.0,
                                      height: 50.0,
                                    );
                                  },
                                ) /* Image(
                                commented by Krishna
                                  image: AssetImage(homepageList[index].image),
                                  width: 50.0,
                                  height: 50.0,
                                ),*/
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0,bottom: 5),
                                child: Text(
                                  homepageList[index].name,
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 18.0,
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
String categoryID = "4";
if(widget.loanType == "Personal Loan") {
  BindData(categoryID);
}else if(widget.loanType == "Credit Lines"){
  categoryID = "30";
  BindData(categoryID);
}
/*
Commented by krishna for testing purpose
  if(widget.loanType=="Personal Loan"){
      homepageList = [
        HomePageList(
            id: "8", name: "ICICI Bank", image: "images/icicibank.png", type: 'personal_loan'),
        HomePageList(
            id: "8", name: "IndusInd Bank", image: "images/indusind-bank--600.png", type: 'personal_loan'),
        HomePageList(
            id: "8", name: "IDFC Bank", image: "images/idfc.png", type: 'personal_loan'),

        HomePageList(
            id: "8", name: "InstaMoney", image: "images/instamoney.png", type: ''),
        HomePageList(
            id: "8", name: "MPocket", image: "images/mpocket.png", type: ''),
        HomePageList(
            id: "8", name: "CASHe", image: "images/cashe.png", type: ''),
        HomePageList(
            id: "8", name: "Fibe", image: "images/Fibe.png", type: ''),
        HomePageList(
            id: "8", name: "Upwards", image: "images/Upwards.png", type: ''),
        HomePageList(
            id: "8", name: "Nira", image: "images/nira.png", type: ''),
        HomePageList(
            id: "8", name: "True Balance", image: "images/TrueBalance.png", type: ''),
        HomePageList(
            id: "8", name: "Prefr", image: "images/Prefr.png", type: ''),
        HomePageList(
            id: "8", name: "Money Wide", image: "images/Moneywide.png", type: ''),
        HomePageList(
            id: "8", name: "Kredit Bee", image: "images/Kreditbee.png", type: ''),
        HomePageList(
            id: "8", name: "Money View", image: "images/moneyview.png", type: ''),
        HomePageList(
            id: "8", name: "PaySense", image: "images/Paysense.png", type: ''),
        HomePageList(
            id: "8", name: "Smart Coin", image: "images/smartcoin.png", type: ''),
        HomePageList(
            id: "8", name: "Finnable", image: "images/finnable.png", type: ''),
        HomePageList(
            id: "8", name: "PayMe", image: "images/Payme.png", type: ''),

      ];
    }else if(widget.loanType=="Credit Lines"){
      homepageList = [
        HomePageList(
            id: "8", name: "Bajaj EMI Card", image: "images/RBL_logo_262.png", type: ''),
        HomePageList(
            id: "8", name: "Freecharge Pay Later", image: "images/freechargepaylater.png", type: ''),
        HomePageList(
            id: "8", name: "Money Tap", image: "images/Moneytap.png", type: ''),


      ];
    }*/
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

  List<productData.Data>? data = <productData.Data>[];
  Future<void> BindData(String CategoryID) async {
    try {
      String url =
          "https://leadapi.banksathi.com/api/b2b/productByCategory?category_id=$CategoryID";
      final response = await ApiHandler.shared.getProductbyCategory(url);
      data = response!.data;
      for (var dataList in data!) {
        homepageList.add(HomePageList(
            id: dataList.productId.toString(),
            name: dataList.title,
            image: dataList.logo,
            type: "personal_loan"));
      }
      setState(() {});
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
