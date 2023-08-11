import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/savingaccountmodel.dart';
import 'package:genie_money/Model/utility/pay_statusModel.dart';
import 'package:genie_money/Screens/Bank_Product_details_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Model/home_menu_list_model.dart';
import '../data/remote/network/ApiEndPointsPaySprint.dart';
import '../data/remote/network/NetworkApiServicePaySprint.dart';
import '../utils/silver_delegate.dart';
import 'AxisBankAccountOpenPage.dart';

class SavingAccount extends StatefulWidget {
  final int banktype;
  final String account;

  const SavingAccount({Key? key, required this.banktype, required this.account})
      : super(key: key);

  // const SavingAccount({Key? key, required this.banktype}) : super(key: key);
  @override
  State<SavingAccount> createState() => _SavingAccountState();
}

class _SavingAccountState extends State<SavingAccount> {
  List<HomePageList> homepageList = [];
  String? productId;

  @override
  void initState() {
    // PoductListMethod(productId??"",title??"");
    //getBankSathi();
    bank();
    // BankDataList();

    super.initState();
  }

  /* void BankDataList(){
    if(widget.banktype==1){
      //getbanksathiproduct();
      homepageList = [
        HomePageList(
            id: proid.toString(), name: title.toString(), image: "images/kotak.png", type: 'saving_account'),
        // id: "4", name: banklist[0].title.toString()??"", image: "images/kotak.png", type: 'saving_account'),

        */ /*HomePageList(
            id: proid.toString(), name: title.toString(), image: "images/au.png", type: 'saving_account'),
        HomePageList(
            id: proid.toString(), name: title.toString(), image: "images/yesbank.png", type: 'saving_account'),
        HomePageList(
            id: proid.toString(), name: title.toString(), image: "images/federal.png", type: 'saving_account'),
*/ /*
      ];
    } else if(widget.banktype==2){
      homepageList = [
        HomePageList(
            id: "2", name: "Axis Bank", image: "images/axis.png", type: 'current_account'),





      ];
    }
  }*/
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
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: Text(
          widget.account.toString(),
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
                margin: const EdgeInsets.only(top: 20.0,left: 25,right: 25),
                child: (widget.account == "Savings Account") ? GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    height: height * 0.24,
                  ),
                  itemCount: savingList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        if (savingList[index].name ==
                            savingList[index].name) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: savingList[index].name,
                                      )));
                        } else {
                          _alertDialog();
                        }
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
                                child: Image.network(
                                  savingList[index].image,
                                  width: 80.0,
                                  height: 80.0,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    // Display an alternative icon or image
                                    return Image.asset(
                                      "images/saving_account_gm.png",
                                      width: 50.0,
                                      height: 50.0,
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0,bottom: 10),
                                child: Text(
                                  savingList[index].name,
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 20.0,
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
                ):GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    height: height * 0.22,
                  ),
                  itemCount: currentList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        if (currentList[index].name ==
                            currentList[index].name) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: currentList[index].name,
                                      )));
                        } else {
                          _alertDialog();
                        }
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
                                margin: const EdgeInsets.only(top: 10.0),
                                child: Image.network(
                                  currentList[index].image,
                                  width: 80.0,
                                  height: 80.0,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    // Display an alternative icon or image
                                    return Image.asset(
                                      "images/saving_account_gm.png",
                                      width: 50.0,
                                      height: 50.0,
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0,bottom: 15),
                                child: Text(
                                  currentList[index].name,
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

  var title;
  var imglogo;
  var proid;
  List<HomePageList> savingList = [];
  List<HomePageList> currentList = [];
  bank() async {
    final url = Uri.parse(
        'https://leadapi.banksathi.com/api/b2b/productByCategory?category_id=13');
    final response = await http.get(url, headers: {
      "x-api-key": "QkN5cGZFRWl4S1Mrb0g5V0dyWFlKNGJseW1sd3haTWhZUWVqOUxlek5qVT0",
      "IV": "YUp4OVJQam13Q0NnbUNTSFZPT0ZFUT09"
    });
    if (response.statusCode == 200) {
      var model = savingAccountModelFromJson(response.body);
      var data = model.data;

      for (var i in data) {
        var lowercaseTitle = i.title.toLowerCase();
        if (lowercaseTitle.contains("saving")) {
          savingList.add(HomePageList(
            id: i.productId.toString(),
            name: i.title.toString(),
            image: i.logo,
            type: "saving_account",
          ));
        } else if (lowercaseTitle.contains("current")) {
          currentList.add(HomePageList(
            id: i.productId.toString(),
            name: i.title.toString(),
            image: i.logo,
            type: "current_account",
          ));
        }
      }

      print("Saving List:");
      for (var item in savingList) {
        print(item.name);
      }

      print("Current List:");
      for (var item in currentList) {
        print(item.name);
      }

      print("Saving List Length: ${savingList.length}");
      print("Current List Length: ${currentList.length}");
    }

    setState(() {});
  }
}
void loadProgress() {}


