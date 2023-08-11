import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Screens/AlternativeInvestment.dart';
import 'package:genie_money/Screens/BondScreen.dart';
import 'package:genie_money/Screens/DebentureScreen.dart';
import 'package:genie_money/Screens/Equity_Screen.dart';
import 'package:genie_money/Screens/InvestmentDetailScreen.dart';
import 'package:genie_money/Screens/UnlistedEquity_Screen.dart';
import 'package:genie_money/StockPage.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/home_menu_list_model.dart';
import '../utils/silver_delegate.dart';

class InvestmentServices extends StatefulWidget {
  const InvestmentServices({Key? key}) : super(key: key);

  @override
  State<InvestmentServices> createState() => _InvestmentServicesState();
}

class _InvestmentServicesState extends State<InvestmentServices> {
  late List<HomePageList> homepageList;
  String type="";
  @override
  void initState() {
    homepageList = [

      HomePageList(
          id: "113", name: "Mutual Fund", image: "images/Mutual Fund.png",type: "mutual_fund"),
      HomePageList(
          id: "114", name: "Direct Equity", image: "images/sip.png",type: "Direct Equity"),
           HomePageList(
          id: "3", name: "Unlisted Equity", image: "images/Equity.png", type: 'Unlisted Equity'),

      HomePageList(
          id: "116", name: "Bonds", image: "images/Bond.png", type: 'bonds'),
      HomePageList(
          id: "112", name: "Debenture", image: "images/Debenture.png", type: 'Debenture'),
    
      HomePageList(
          id: "119", name: "Alternative investment", image: "images/Alternative Investment.png", type: ''),
      ///comenting below sunil code
      /*HomePageList(
          id: "112", name: "DEMAT Account", image: "images/demat_account_gm.png"),
      HomePageList(
          id: "113", name: "Mutual Fund", image: "images/mutalfunds_gm.png"),
      HomePageList(
          id: "114", name: "SIP", image: "images/sip.png"),
*//*      HomePageList(
          id: "115", name: "SIP Calculator", image: "images/mutalfunds_gm.png"),*//*
      HomePageList(
          id: "116", name: "Bonds", image: "images/bond_gm.png"),
      HomePageList(
          id: "117", name: "NCDs", image: "images/bond_gm.png"),
      HomePageList(
          id: "118", name: "Corporate FDs", image: "images/bond_gm.png"),
      HomePageList(
          id: "119", name: "Alternative investment", image: "images/demat_account_gm.png"),*/

    ];
    getUserType();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: const Text(
          "Investments Service",
          style: TextStyle(
            color:kWhite,
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
                        if(homepageList[index].name == "DEMAT Account") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StockPage(name: "DEMAT Account",)));
                        }
                        else if(homepageList[index].name == "Corporate FDs") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StockPage( name: 'Corporate FDs',)));
                        } else if(homepageList[index].name == "Mutual Fund") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InvestmentDetailsScreen(InvestmentType: 'mutualfund',)));
                        }
                        else if(homepageList[index].name == "Direct Equity") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EquityScreen(InvestmentType: 'Direct Equity',)));
                        }
                         else if(homepageList[index].name == "Alternative investment") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AlternativeInvestment(InvestmentType: 'Alternative investment',)));
                        }
                        //   else if(homepageList[index].name == "Bonds") {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               BondScreen(InvestmentType: 'Bonds',)));
                        // }
                        //   else if(homepageList[index].name == "Debenture") {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               DebentureScreen(InvestmentType: 'Debenture',)));
                        // }
                        // else if(homepageList[index].name == "Unlisted Equity") {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               UnlistedEquity(InvestmentType: 'Unlisted Equity',)));
                        // }


                        else {
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
                                margin: const EdgeInsets.only(top: 15.0),
                                child: Image(
                                  image: AssetImage(homepageList[index].image),
                                  color: kWhite,
                                  width: 80.0,
                                  height: 80.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0,bottom: 5),
                                child: Text(
                                  homepageList[index].name,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _alertDialog() {
    showDialog(context: context, builder: (context){

      return AlertDialog(

        backgroundColor:  kWhite,
             shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(
          //   color: Colors.orange, // Set the border color here
          //   width: 2.0, // Set the border width here
          // ),
        ),

        content: Container(
          height: 100,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin:  EdgeInsets.only(top: 12,),

                child: Text(
                  "Getting Activated Soon",
                  style: TextStyle(color:navyBlueColor, fontSize: 20),
                ),
              ),
              Container(

                margin: const EdgeInsets.only(top: 20,bottom: 1),
                height: 40,
                width: 100,
                child: ElevatedButton(
                  child: const Text(
                    "Ok",
                    style: TextStyle(
                        color:
                        kWhite,
                        fontSize: 15.0,
                        fontWeight:
                        FontWeight.bold),
                  ),
                  style:
                  ElevatedButton.styleFrom(
                    fixedSize:
                    Size(30, 80.0), backgroundColor: navyBlueColor,
                   // shadowColor:
                   // const Color(0xFFFFAE00),
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                  ),
                  onPressed: () async {

                    Navigator.pop(context);

                  }


                  ,
                ),
              ),

            ],




          ),

        ),
      );

    });
  }

  Future getUserType()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = (prefs.get("type")?? "Customer").toString();

    });
    if(type=="Customer"){
      homepageList = [
        HomePageList(
            id: "113", name: "Mutual Fund", image: "images/Mutual Fund.png",type:"mutual_fund" ),
        HomePageList(
            id: "114", name: "SIP", image: "images/SIP.png",type: "sip"),
        HomePageList(
            id: "116", name: "Bonds", image: "images/Bond.png",type: ''),
        HomePageList(
            id: "112", name: "Debenture", image: "images/Debenture.png", type: ''),
        HomePageList(
            id: "3", name: "Unlisted Equity", image: "images/Equity.png", type: ''),
        HomePageList(
            id: "119", name: "Alternative investment", image: "images/Alternative Investment.png", type: ''),


        /// commentig below sunil code
 /*       HomePageList(
            id: "112", name: "DEMAT Account", image: "images/demat_account_gm.png"),
        HomePageList(
            id: "115", name: "SIP Calculator", image: "images/sipcalculater.png"),
        HomePageList(
            id: "117", name: "NCDs", image: "images/bond_gm.png"),
        HomePageList(
            id: "118", name: "Corporate FDs", image: "images/copratefd.png"),
        HomePageList(
            id: "119", name: "Alternative investment", image: "images/alternativeInvestment.png"),*/
       /* HomePageList(
            id: "1", name: "Mutual Fund", image: "images/mutalfunds_gm.png"),
        HomePageList(
            id: "2", name: "Bonds", image: "images/bond_gm.png"),
        HomePageList(
            id: "3", name: "Equity/Derivatives", image: "images/equity_gn.png"),
        HomePageList(
            id: "3", name: "Commodities", image: "images/commodities_gm.png"),
        HomePageList(
            id: "3", name: "Crypto", image: "images/crypto_gm.png"),*/
      ];
    }else if(type == "Retailer" || type == "Distributor" || type == "Super Distributor") {
      homepageList = [
        HomePageList(
            id: "113", name: "Mutual Fund", image: "images/mutalfunds_gm.png", type: "mutual_fund"),
        HomePageList(
            id: "114", name: "SIP", image: "images/sip.png",type: "sip"),
        HomePageList(
            id: "116", name: "Bonds", image: "images/ond.png", type: 'bonds'),
        HomePageList(
            id: "112", name: "Debenture", image: "images/demat_account_gm.png", type: ''),
        HomePageList(
            id: "3", name: "Unlisted Equity", image: "images/equity_gn.png", type: ''),
        HomePageList(
            id: "119", name: "Alternative investment", image: "images/alternativeInvestment.png", type: ''),

        ///comenting below sunil code
       /* HomePageList(
            id: "112", name: "DEMAT Account", image: "images/demat_account_gm.png"),
        HomePageList(
            id: "113", name: "Mutual Fund", image: "images/mutalfunds_gm.png"),
        HomePageList(
            id: "114", name: "SIP", image: "images/sip.png"),
        HomePageList(
            id: "115", name: "SIP Calculator", image: "images/sipcalculater.png"),
        HomePageList(
            id: "116", name: "Bonds", image: "images/bond_gm.png"),
        HomePageList(
            id: "117", name: "NCDs", image: "images/bond_gm.png"),
        HomePageList(
            id: "118", name: "Corporate FDs", image: "images/copratefd.png"),
        HomePageList(
            id: "119", name: "Alternative investment", image: "images/alternativeInvestment.png"),*/
      ];

    }
  }

}
