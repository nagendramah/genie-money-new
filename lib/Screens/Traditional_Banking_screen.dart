import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/Demat_Banks_screen.dart';
import 'package:genie_money/Screens/InsuranceNew.dart';
import 'package:genie_money/Screens/NBFC_screen.dart';
import 'package:genie_money/Screens/TransactionalServices.dart';
import 'package:genie_money/Screens/bank_service.dart';
import 'package:genie_money/Screens/cowin_screen.dart';
import 'package:genie_money/Screens/install_screen.dart';
import 'package:genie_money/Screens/insurance_screen.dart';
import 'package:genie_money/Screens/investment_services.dart';
import 'package:genie_money/Screens/loan_service.dart';
import 'package:genie_money/Screens/money_transfer.dart';
import 'package:genie_money/Screens/new_crditcard_screen.dart';
import 'package:genie_money/Screens/offer_screen.dart';
import 'package:genie_money/Screens/optionsfile.dart';
import 'package:genie_money/Screens/qr_code_scanner_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/constants.dart';
import 'package:genie_money/utils/silver_delegate.dart';

class TraditionalBankingScreen extends StatefulWidget {
  const TraditionalBankingScreen({Key? key}) : super(key: key);

  @override
  State<TraditionalBankingScreen> createState() => _TraditionalBankingScreenState();
}

class _TraditionalBankingScreenState extends State<TraditionalBankingScreen> {
  late List<HomePageList> homepageList;
  late String categoryID;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: const Text("Traditional Banking",
          //option.toString().endsWith(""),
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
            const SizedBox(height: 50,),
            Text("What you want to do?",style: TextStyle(color: navyBlueColor,fontSize: 22,fontWeight: FontWeight.bold),),
            
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 45.0,left: 25, right: 25),
                child: GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    //childAspectRatio:  1.0,
                    height: height * 0.22,
                  ),
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                      if (homepageList[index].name == "Insurance") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewInsurance()));
                         /* if (categoryID.isEmpty && type == "Merchant") {
                            _MobilenoController.text = Constants.phone;
                                 _emailController.text = Constants.email;

                           showRegistrationDailog();
                          }
                           else if(type == "Partner"||type == "Associate Partner")
                          else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewInsurance()));
                          }*/
                        } else if (homepageList[index].name ==
                            "COVID-19 Insurance") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InsuranceScreen("COVID-19 Insurance")));
                        } else if (homepageList[index].name == "Spy Camera" ||
                            homepageList[index].name == "Life Saver" ||
                            homepageList[index].name == "Secure Chat" ||
                            homepageList[index].name == "Anti Hacking" ||
                            homepageList[index].name == "Anti Virus" ||
                            homepageList[index].name == "Anti Theft" ||
                            homepageList[index].name == "Wi-Fi Protect") {
                          _alertDialog();

                          /*bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.genieshield");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                           */ /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));*/ /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DigitalSecurityDetailScren( name: homepageList[index].name,)));
                          }*/
                        } else if (homepageList[index].name ==
                            "YouTube Video") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.vanced.android.youtube");
                          if (installed) {
                            DeviceApps.openApp("com.vanced.android.youtube");
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name ==
                            "YouTube Music") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.vanced.android.apps.youtube.music");
                          if (installed) {
                            DeviceApps.openApp(
                                "com.vanced.android.apps.youtube.music");
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        }
                        /*else if (homepageList[index].name == "OTT") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OTTScreen()));
                        }*/
                        else if (homepageList[index].name ==
                            "YouTube Download" ||
                            homepageList[index].name == "News Channels" ||
                            homepageList[index].name == "Other Channels") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.entertainment");
                          if (installed) {
                            //launchNativeActivity(homepageList[index].name);
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name ==
                            "Financial Calculator") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.financecalculator");
                          if (installed) {
                            //launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "Education" ||
                            homepageList[index].name == "Jobs") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.education");
                          if (installed) {
                          //  launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name ==
                            "Money Transfer") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoneyTransfer(
                                    fromScreen: homepageList[index].name,
                                  )));
                        } else if (homepageList[index].name == "Payments") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoneyTransfer(
                                    fromScreen: homepageList[index].name,
                                  )));
                        } else if (homepageList[index].name == "Scan To Pay") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QRCodeScannerScreen()));
                        } else if (homepageList[index].name == "Offers") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OfferScreen()));
                        } else if (homepageList[index].name == "CoWIN") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CowinScreen()));
                        } else if (homepageList[index].name == "Game") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllOptions("Games")));
                        } else if (homepageList[index].name ==
                            "Entertainment") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AllOptions("Entertainment")));
                        } else if (homepageList[index].name ==
                            "Health / Fitness") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.gssfitness");
                          if (installed) {
                          //  launchNativeActivity(homepageList[index].name);
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name ==
                            "Accounts") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BankServices()));
                       /*   if (categoryID.isEmpty && type == "Merchant") {
                            _MobilenoController.text = Constants.phone;
                           _emailController.text = Constants.email;

                            showRegistrationDailog();
                          }
                          // else if(type == "Partner"||type == "Associate Partner")
                          else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BankServices()));
                          }*/
                        } else if (homepageList[index].name ==
                          "Deposits") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NbfcScreen()));
                        /*   if (categoryID.isEmpty && type == "Merchant") {
                            _MobilenoController.text = Constants.phone;
                           _emailController.text = Constants.email;

                            showRegistrationDailog();
                          }
                          // else if(type == "Partner"||type == "Associate Partner")
                          else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BankServices()));
                          }*/
                      }else if (homepageList[index].name ==
                            "Loan Services") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoanService()));
                         /* if (categoryID.isEmpty && type == "Merchant") {
                            _MobilenoController.text = Constants.phone;
                            _emailController.text = Constants.email;

                            showRegistrationDailog();
                          }
                          // else if(type == "Partner"||type == "Associate Partner")
                          else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoanService()));
                          }*/
                        } else if (homepageList[index].name == "Investments") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const InvestmentServices()));

                      /*    if (categoryID.isEmpty && type == "Merchant") {
                            _MobilenoController.text = Constants.phone;
                            _emailController.text = Constants.email;

                            showRegistrationDailog();
                          }
                          // else if(type == "Partner"||type == "Associate Partner")
                          else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InvestmentServices()));
                          }*/
                        } else if (homepageList[index].name == "Credit card") {
                          // if(categoryID.isEmpty&&type == "Merchant")
                          // {
                          //   _MobilenoController.text = Constants.phone;
                          //   _emailController.text = Constants.email;
                          //
                          //   showRegistrationDailog();
                          //
                          // }
                          // else if(type == "Partner"||type == "Associate Partner")
                          Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const NewCreditCardScreen(banktype: "Credit card", loanType: '',)));
                        } else if (homepageList[index].name ==
                            "geniemoney Neo Bank") {
                          _alertDialog();
                        }else if (homepageList[index].name ==
                            "Traditional Banking") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TraditionalBankingScreen()));
                        }  else if (homepageList[index].name ==
                            "Transactional Services") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     const TransactionalServices()));
                         /* if (categoryID.isEmpty && type == "Merchant") {
                            _MobilenoController.text = Constants.phone;
                            _emailController.text = Constants.email;

                            showRegistrationDailog();
                          }
                          // else if(type == "Partner"||type == "Associate Partner")
                          else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TransactionalServices()));
                          }*/
                        }  else if (homepageList[index].name ==
                          "Demat") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DematAccountBankScreen()));

                      }else {
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
                                child: Image(
                                  image: AssetImage(homepageList[index].image),
                                  color: kWhite,
                                  width: 60.0,
                                  height: 60.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0,bottom: 10),
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
         /*   Visibility(
              visible: securityVisibility,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text(
                        "Issue Code to Customer",
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18.0,
                        ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SalesPartnerScreen("Generate Code")));

                        *//*if (option == "OTT") {
                            _alertDialog();
                          } else {
                            _download();
                          }*//*
                      },
                      // Text(
                      //   "To activate this features for Customer. Please give the Activation code.",
                      //   style: const TextStyle(
                      //     color: Color(0xFFFFAE00),
                      //     fontSize: 18.0,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      *//*    Container(

                        height: 40,
                        width: 160,
                        child: ElevatedButton(
                          child:Container(
                            margin: EdgeInsets.only(left:23),
                            child: Text(
                              "Issue Code \nto Customer",
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 30.0),
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {

                            *//* *//*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SalesPartnerScreen("Generate Code")));
*//* *//*
                            *//* *//*if (option == "OTT") {
                              _alertDialog();
                            } else {
                              _download();
                            }*//* *//*
                          },
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 160,
                        child: ElevatedButton(
                          child: Text(
                            "Generate Code",
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 14.0,
                            ),
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

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SalesPartnerScreen("Generate Code")));

                            *//* *//*if (option == "OTT") {
                              _alertDialog();
                            } else {
                              _download();
                            }*//* *//*
                          },
                        ),
                      ),*//*
                    ),
                    ElevatedButton(
                      child: Text(
                        "Generate Code",
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18.0,
                        ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SalesPartnerScreen("Generate Code")));

                        *//*if (option == "OTT") {
                            _alertDialog();
                          } else {
                            _download();
                          }*//*
                      },
                      // Text(
                      //   "To activate this features for Customer. Please give the Activation code.",
                      //   style: const TextStyle(
                      //     color: Color(0xFFFFAE00),
                      //     fontSize: 18.0,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      *//*    Container(

                        height: 40,
                        width: 160,
                        child: ElevatedButton(
                          child:Container(
                            margin: EdgeInsets.only(left:23),
                            child: Text(
                              "Issue Code \nto Customer",
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 30.0),
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {

                            *//* *//*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SalesPartnerScreen("Generate Code")));
*//* *//*
                            *//* *//*if (option == "OTT") {
                              _alertDialog();
                            } else {
                              _download();
                            }*//* *//*
                          },
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 160,
                        child: ElevatedButton(
                          child: Text(
                            "Generate Code",
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 14.0,
                            ),
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

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SalesPartnerScreen("Generate Code")));

                            *//* *//*if (option == "OTT") {
                              _alertDialog();
                            } else {
                              _download();
                            }*//* *//*
                          },
                        ),
                      ),*//*
                    ),
                  ],
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    categoryID = Constants.category.toString();
    homepageList = [
    /*  HomePageList(
          id: "51",
          name: "geniemoney Neo Bank",
          image: "images/SmartNeoCard.png"),*/
     /* HomePageList(
          id: "52",
          name: "Traditional Banking",
          image: "images/GM-ProfessionalLoan.png"),*/
      HomePageList(
          id: "7",
          name: "Accounts",
          image: "images/Accounts.png", type: ''),
      HomePageList(
          id: "53",
          name: "Deposits",
          image: "images/Deposit.png", type: ''),
      HomePageList(
          id: "111", name: "Credit card", image: "images/Credit Card.png", type: ''),
      HomePageList(
          id: "9", name: "Loan Services", image: "images/Loan Services.png", type: ''),
      HomePageList(
          id: "54", name: "Demat", image: "images/demat_account_gm.png", type: ''),
      HomePageList(
          id: "11", name: "Insurance", image: "images/insurance1.png", type: ''),
      HomePageList(
          id: "12", name: "Investments", image: "images/Investments.png", type: ''),
    /*  HomePageList(
          id: "12",
          name: "Transactional Services",
          image: "images/tranactionalservices.png"),*/
///here above my code
      /*HomePageList(
            id: "9", name: "Instant Loan", image: "images/instant_loan.png"),
        HomePageList(
            id: "10", name: "Consumer Loans", image: "images/consumer_loan.png"),*/
      /*HomePageList(
            id: "7", name: "Scan To Pay", image: "images/scantopay_gm.png"),*/

      /* HomePageList(
            id: "13", name: "Stock & IPOs", image: "images/stock.png"),
        HomePageList(
            id: "14", name: "Credit Score", image: "images/cerdit_score.png"),
        HomePageList(
            id: "15", name: "Digi Locker", image: "images/digi_locker.png"),*/

      /*  HomePageList(
            id: "8",
            name: "Recharge/Bill Payment",
            image: "images/recharge_and_bill.png"),
        HomePageList(
            id: "6",
            name: "Money Transfer",
            image: "images/money_transfer.png"),
        HomePageList(
            id: "12", name: "Investments", image: "images/investment.png"),
        HomePageList(
            id: "16",
            name: "Financial Calculator",
            image: "images/finance_calculator.png")*/
    ];
    super.initState();
  }
  void _alertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: navyBlueColor,
            content: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 12,
                    ),
                    child: const Text(
                      "Getting Activated Soon",
                      style: TextStyle(color: kWhite, fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 1),
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(30, 80.0),
                        primary: const Color(0xFFFFAE00),
                        shadowColor: const Color(0xFFFFAE00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Ok",
                        style: TextStyle(
                            color: kWhite,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
