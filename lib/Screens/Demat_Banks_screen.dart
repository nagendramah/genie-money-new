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

class DematAccountBankScreen extends StatefulWidget {
  const DematAccountBankScreen({Key? key}) : super(key: key);

  @override
  State<DematAccountBankScreen> createState() => _DematAccountBankScreenState();
}

class _DematAccountBankScreenState extends State<DematAccountBankScreen> {
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
          "Demat Accounts ",
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
                    return GestureDetector(
                      onTap: () async {
                        if (homepageList[index].name ==
                            "Upstox Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Upstox",
                                      )));
                        } else if (homepageList[index].name ==
                            "Paytm Money Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "PayTMMoney",
                                      )));
                        } else if (homepageList[index].name ==
                            "AngelOne Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "AngelOne Demat Account",
                                      )));                        
                            } 
                            else if (homepageList[index].name ==
                            "Nuvama Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Nuvama",
                                      )));                                 
                        } 
                        else if (homepageList[index].name ==
                            "Kotak Securities") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Kotak Securities",
                                      )));                            
                        } 
                        else if (homepageList[index].name ==
                            "Samco Securities") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Samco Securities",
                                      )));                            
                        }
                         else if (homepageList[index].name ==
                            "SBI Securities") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "SBI Securities",
                                      )));                            
                        }                     
                        else if (homepageList[index].name ==
                            "Groww Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Grow",
                                      )));
                        } else if (homepageList[index].name ==
                            "ICICI Direct Markets App") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "icicidirect",
                                      )));
                        } else if (homepageList[index].name ==
                            "Edelweiss Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Edelweiss",
                                      )));
                        } else if (homepageList[index].name ==
                            "Yes Securities Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "YessSecure",
                                      )));
                        } else if (homepageList[index].name ==
                            "m,Stock Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "MStock",
                                      )));
                        } else if (homepageList[index].name ==
                            "HDFC securities") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "hdfcsecurities",
                                      )));
                        } else if (homepageList[index].name == "ICICI Direct") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "icicidirect",
                                      )));
                        } else if (homepageList[index].name == "NAVI MF") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "navimf",
                                      )));
                        } else if (homepageList[index].name ==
                            "Anand Rathi Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "AnandRathi",
                                      )));
                        } else if (homepageList[index].name ==
                            "Alice Blue Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Alice",
                                      )));
                        } else if (homepageList[index].name ==
                            "Bank Of India Demat") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "BOID",
                                      )));
                        } else if (homepageList[index].name == "LXME Demat Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "LXME Demat Account",
                                      )));
                        } else if (homepageList[index].name == "Samco") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Samco",
                                      )));
                        }
                        else if (homepageList[index].name == "Bajaj Finserv Securities") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BankProductDetailsScreen(
                                        bankName: "Bajaj Finserv Securities",
                                      )));
                        }
                        

                        /*if (homepageList[index].name == "HDFC Bank") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration(bankname: homepageList[index].name, leadtype: 'credit card' ,account:  homepageList[tempindex].type,)));

                        }
                        else   if (homepageList[index].name == "ICICI Bank") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'credit card' ,account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "Bajaj RBL") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'credit card' ,account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "Axis Bank") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'credit card' ,account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "Standard Chartered") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'credit card' ,account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "SBI Bank") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'credit card' ,account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "AU Finance") {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'credit card', account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "Yes Bank") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'credit card' ,account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "IndusInd") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'credit card' ,account:  homepageList[tempindex].type,)));

                        }
                        else   if (homepageList[index].name == "Citi Bank (Pune & Mumbai)") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'personal loan' ,account:  homepageList[tempindex].type,)));
                        }





                        else if (homepageList[index].name == "ICICI Direct") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BankProductDetailsScreen(bankName: "icicidirect",)));

                        }else if (homepageList[index].name == "Kotak Securities") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BankProductDetailsScreen(bankName: "KotakSecurities",)));

                        }else if (homepageList[index].name == "Nuvama") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BankProductDetailsScreen(bankName: "Nuvama",)));

                        }else if (homepageList[index].name == "PayTM Money") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BankProductDetailsScreen(bankName: "PayTMMoney",)));

                        }else if (homepageList[index].name == "Anand Rathi") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BankProductDetailsScreen(bankName: "AnandRathi",)));

                        }else if (homepageList[index].name == "M Stock") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BankProductDetailsScreen(bankName: "MStock",)));

                        }else if (homepageList[index].name == "Angel One") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BankProductDetailsScreen(bankName: "AngelOne",)));

                        }else if (homepageList[index].name == "Zerodha Kite") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BankProductDetailsScreen(bankName: "ZerodhaKite",)));

                        }else if (homepageList[index].name == "IIFL") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BankProductDetailsScreen(bankName: "IIFL",)));

                        }else if (homepageList[index].name == "5Pasia") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BankProductDetailsScreen(bankName: "5Pasia",)));

                        }
                        else {
                         // _alertDialog();

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
                                child: Image.network(
                                  homepageList[index].image,
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
                                    top: 10, left: 5.0, right: 5.0, bottom: 5),
                                child: Text(
                                  homepageList[index].name,
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 18.0,
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
    /*  homepageList = [*/
    /*HomePageList(
          id: "8", name: "ICICI Direct", image: "images/icicibank.png", type: ''),
      HomePageList(
          id: "4", name: "Kotak Securities", image: "images/kotak.png", type: ''),
      HomePageList(
          id: "4", name: "Nuvama", image: "images/nuvama.png", type: ''),
      HomePageList(
          id: "4", name: "PayTM Money", image: "images/Paytmmoney.png", type: ''),
      HomePageList(
          id: "4", name: "Angel One", image: "images/GM_Angle1.png", type: ''),
      HomePageList(
          id: "4", name: "Anand Rathi", image: "images/AnandRathi.png", type: ''),
      HomePageList(
          id: "5", name: "Zerodha Kite", image: "images/GM-Kite-2.png", type: ''),
      HomePageList(
          id: "8", name: "IIFL", image: "images/iffl.png", type: ''),
      HomePageList(
          id: "4", name: "M Stock", image: "images/MStock.png", type: ''),
      HomePageList(
          id: "8", name: "5Pasia", image: "images/fivepaisa.png", type: ''),
*/

    /// comenting below sunil code
    /* HomePageList(
          id: "8", name: "ICICI Bank", image: "images/icicibank.png"),
      HomePageList(
          id: "8", name: "HDFC Bank", image: "images/hdfc-bank-limited.png"),
      HomePageList(
          id: "8", name: "Citi Bank (Pune & Mumbai)", image: "images/Citi.png"),
      HomePageList(
          id: "8", name: "Bajaj RBL", image: "images/RBL_logo_262.png"),
      HomePageList(
          id: "8", name: "Axis Bank", image: "images/axis.png"),
      HomePageList(
          id: "8", name: "Standard Chartered", image: "images/charted.png"),
      HomePageList(
          id: "8", name: "SBI Bank", image: "images/sbi.png"),
      HomePageList(
          id: "8", name: "AU Finance", image: "images/au.png"),
      HomePageList(
          id: "8", name: "Yes Bank", image: "images/yesbank.png"),
      HomePageList(
          id: "8", name: "IndusInd", image: "images/indusind-bank--600.png"),*/

    /*  ];*/
    BindData();
    super.initState();
  }

  List<productData.Data>? data = <productData.Data>[];
  Future<void> BindData() async {
    try {
      String url =
          "https://leadapi.banksathi.com/api/b2b/productByCategory?category_id=17";
      final response = await ApiHandler.shared.getProductbyCategory(url);
      data = response!.data;
      for (var dataList in data!) {
        homepageList.add(HomePageList(
            id: dataList.productId.toString(),
            name: dataList.title,
            image: dataList.logo,
            type: "demat_account"));
      }
      setState(() {});
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
