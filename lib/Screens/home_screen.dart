import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/AlternativeInvestment.dart';
import 'package:genie_money/Screens/Credit_Lines_Banks_screen.dart';
import 'package:genie_money/Screens/Demat_Banks_screen.dart';
import 'package:genie_money/Screens/FundsIndia.dart';
import 'package:genie_money/Screens/General_InsuranceScreen.dart';
import 'package:genie_money/Screens/InsuranceNew.dart';
import 'package:genie_money/Screens/InvestmentDetailScreen.dart';
import 'package:genie_money/Screens/NBFC_Banks_Screen.dart';
import 'package:genie_money/Screens/NBFC_screen.dart';
import 'package:genie_money/Screens/Notifications.dart';
import 'package:genie_money/Screens/SavingAccount.dart';
import 'package:genie_money/Screens/Traditional_Banking_screen.dart';
import 'package:genie_money/Screens/bank_service.dart';
import 'package:genie_money/Screens/change_password_screen.dart';
import 'package:genie_money/Screens/distributor_retailer_screen.dart';
import 'package:genie_money/Screens/essentials_screen.dart';
import 'package:genie_money/Screens/bill_payment_screen.dart';
import 'package:genie_money/Screens/feedback_screen.dart';
import 'package:genie_money/Screens/loan_service.dart';
import 'package:genie_money/Screens/new_crditcard_screen.dart';
import 'package:genie_money/Screens/offer_screen.dart';
import 'package:genie_money/Screens/portfolio.dart';
import 'package:genie_money/Screens/profile_settings_screen.dart';
import 'package:genie_money/Screens/qr_code_scanner_screen.dart';
import 'package:genie_money/Screens/recharge_and_bill_payment_screen.dart';
import 'package:genie_money/Screens/sales_partner_screen.dart';
import 'package:genie_money/Screens/settings_screen.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/Screens/sub_catagories_screen.dart';
import 'package:genie_money/Screens/sub_sub_categories_screen.dart';
import 'package:genie_money/Screens/wallet_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'balance_inquiry_screen.dart';
import 'cash_withdrawal_screen.dart';
import 'credit_score_screen.dart';
import 'credit_to_bank.dart';
import 'essential_details_screen.dart';
import 'install_screen.dart';
import 'mini_statement_screen.dart';
import 'money_transfer.dart';
import 'optionsfile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomeClass();
  }
}

class MyHomeClass extends State<HomeScreen> {
  int _currentPosition = 0;
  String _result = "";
  late String pointss;

  late bool _load = true;
  late List<HomePageList> homepageList = [];
  var type;

  List<String> imgList = [
   // "images/banner1.png",
    "images/bannernew2.png",
    "images/HGM-Dashboard4.jpg",
    "images/HGM-Dashboard3.jpg"
  ];
  
  var title='';
  
  var message='';

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Future<void> _check_preference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = prefs.get("type") ?? "Customer";
    });
  }

  @override
  void initState() {
    _check_preference().then((value) => {
          if (type == "Customer")
            {
              homepageList = [
                HomePageList(
                    id: "1",
                    name: "Financial\nServices",
                    image: "images/Financial Services.png", type: ''),
                HomePageList(
                    id: "2",
                    name: "Merchant\nServices",
                    image: "images/Merchant Services.png", type: ''),
                /* HomePageList(
                    id: "7",
                    name: "Travel",
                    image: "images/travel.png"),
                HomePageList(
                    id: "3",
                    name: "Personal Security",
                    image: "images/personal_security.png"),
                HomePageList(
                    id: "4",
                    name: "Device Security",
                    image: "images/device_security.png"),*/
                /*HomePageList(
                    id: "3", name: "Personal Security", image: "images/personal_security.png"),*/
                HomePageList(
                    id: "5",
                    name: "Tools",
                    image: "images/Tools.png", type: ''),
                /* HomePageList(
                    id: "6",
                    name: "Entertainment",
                    image: "images/entertainment.png"),*/
                /* HomePageList(
                    id: "7",
                    name: "Offer",
                    image: "images/offers.png"),*/

                /* HomePageList(
                    id: "8",
                    name: "Games",
                    image: "images/games.png"),*/
              ]
            }
          else if (type == "Associate Partner" || type == "Partner")
            {
              homepageList = [
                HomePageList(
                    id: "1",
                    name: "Financial\nServices",
                    image: "images/Financial Services.png", type: ''),
                HomePageList(
                    id: "2",
                    name: "Merchant\nServices",
                    image: "images/Merchant Services.png", type: ''),
                HomePageList(
                    id: "5",
                    name: "Tools",
                    image: "images/Tools.png", type: ''),
              ]
            }
          else if (type == "Merchant")
            {
              homepageList = [
                HomePageList(
                    id: "1",
                    name: "Financial\nServices",
                    image: "images/Financial Services.png", type: ''),
                HomePageList(
                    id: "2",
                    name: "Merchant\nServices",
                    image: "images/Merchant Services.png", type: ''),
                HomePageList(
                    id: "5",
                    name: "Tools",
                    image: "images/Tools.png", type: ''),
              ]
            }
          else
            {
              homepageList = [
                HomePageList(
                    id: "1",
                    name: "Generate Code",
                    image: "images/generate_code.png", type: ''),
                HomePageList(
                    id: "2",
                    name: "Apps History",
                    image: "images/app_history.png", type: ''),
                HomePageList(
                    id: "3",
                    name: "Add Portfolio",
                    image: "images/profolio.png", type: ''),
                HomePageList(
                    id: "5", name: "Distributor", image: "images/retailer.png", type: '')
              ]
            },
          _showUi(),
        });
    getreferal();

    // _load = false;
    super.initState();
  }

  _showUi() {
    setState(() {
      _load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return WillPopScope(
 onWillPop: () => _onWillPop(context),
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: type == "Customer"
            ? AppBar(
                backgroundColor:  navyBlueColor ,
                title: const Text(
                  "Genie Moneyy",
                  style: TextStyle(color:kWhite),
                ),
                leading: InkWell(
                  onTap: () => ZoomDrawer.of(context)!.toggle(),
                  child: const Icon(
                    Icons.sort,
                    color:kWhite,
                  ),
                ),
                actions: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () async {
                          String? result = await showSearch(
                              context: context, delegate: DataSearch());
                          if (result! == "Merchant\nServices") {
                            print("rohaww");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         EssentialsScreen()));
                          } else if (result ==  "Merchant Services") {
                            print("858584847528");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         EssentialsScreen()));
                          }else if (result == "Financial Services") {
                            print("858584847528");
                          
                       Navigator.push(
                      context,
                       MaterialPageRoute(
              builder: (context) => AllOptions("Financial\nServices")));
                          }
                          else if (result == "Tools") {                         
                       Navigator.push(
                      context,
                       MaterialPageRoute(
                      builder: (context) => AllOptions( "Tools")));
                          }
                           else if (result == "Neo Banking") { 
                         _alert1Dialog();
                          }
                            else if (result == "Unlisted Equity") { 
                         _alert1Dialog();
                          }
                            else if (result == "Bonds") { 
                         _alert1Dialog();
                          }
                            else if (result == "Debenture") { 
                         _alert1Dialog();
                          }
                            else if (result == "Health Insurance") { 
                         _alert1Dialog();
                          }
                            else if (result == "Vehicle Insurance") { 
                         _alert1Dialog();
                          } 
                          else if (result == "Accidental/Death Insurance") { 
                         _alert1Dialog();
                          }
                          else if (result == "Home/Shop/Office Protection Insurance") { 
                         _alert1Dialog();
                          }   else if (result == "Job Loss Insurance") { 
                         _alert1Dialog();
                          } 
                          else if (result == "Cyber Fraud Insurance") { 
                         _alert1Dialog();
                          }  
                          else if (result == "EMI Calculator") { 
                         _alert1Dialog();
                          } 
                          else if (result == "SIP Calculator") { 
                         _alert1Dialog();
                          }  
                           else if (result == "FD Rate Chart") { 
                         _alert1Dialog();
                          }   
                          else if (result == "Change Language") { 
                         _alert1Dialog();
                          }
                       else if (result == "Traditional Banking") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => TraditionalBankingScreen()));
                         }
                          else if (result == "Savings Account") {   
                                                  
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  SavingAccount(account: 'Savings Account', banktype: 13)));
                         }
                         else if (result == "Current Account") {   
                                                  
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  SavingAccount(account: 'Current Account', banktype: 3)));
                         }
                         else if (result ==  "Deposits") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => NbfcScreen ()));
                         }
                         else if (result == "Credit Card") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => NewCreditCardScreen (loanType:  "Credit Card",)));
                         }
                           else if (result == "Credit Lines") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  CreditLinesBankScreen (loanType: "Credit Lines")));
                         }
                          else if (result == "Personal Loan") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  CreditLinesBankScreen (loanType: "Personal Loan")));
                         }
                         else if (result ==  "Life Insurance") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => GeneralInsurances (InsuranceType: 'Life Insurance',)));
                         }
                           else if (result ==  "General Insurance") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => GeneralInsurances (InsuranceType: 'General Insurance',)));
                         }
                          else if (result ==  "Demat") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  DematAccountBankScreen ()));
                         }
                           else if (result ==  "Mutual Fund") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>   InvestmentDetailsScreen  (InvestmentType: "mutualfund",)));
                         }
                        else if (result ==  "Alternative investment") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => AlternativeInvestment(InvestmentType: "Alternative investment",)));
                         }
                          else if (result ==  "NBFC Fixed Deposit") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => Nbfc_Bank_Screen()));
                         }
                         else if (result ==  "Loan Services") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  LoanService ()));
                         }
                          else if (result ==  "Insurance") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => NewInsurance ()));
                         }
                         else if (result ==  "Wallet") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => WalletScrreen ()));
                         }
                          else if (result ==  "Settings") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => SettingsScreen ("Customer")));
                         }
                         else if (result ==  "Profile") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => ProfileSettingsScreen ()));
                         }
                          else if (result ==  "Change Password") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  ChangePassword ()));
                         }
                          else if (result ==  "Help") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  FeedbackScreen ()));
                         }
                         else if (result ==  "Backend Dashboard") {                         
                        //  Navigator.push(
                        //    context,
                        //     MaterialPageRoute(
                        //     builder: (context) =>  FeedbackScreen ()));
                        _launch2URL() ;
                         }





                           else if (result == "Financial Services" ||
                             // result == "Personal Security" ||
                              result == "Digit Security" ||
                              result == "Value Added Services" ||
                              result == "Entertainment" ||
                              /*result == "Privilage Offer" ||*/
                              result == "Games") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllOptions(result)));
                                

                          } else if (result == "Financial Services" ||
                              result == "Digital Security Services" ||
                              result == "Value Added Services") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllOptions(result)));
                          } else if (result == "Money Transfer") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoneyTransfer(
                                          fromScreen: result,
                                        )));
                          } else if (result == "Recharge and Bill Payment") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RechargeAndBillPayment()));
                          } else if (result == "Credit Score") {
                            Route route = MaterialPageRoute(
                                builder: (context) => const CreditScoreScreen());
                            Navigator.push(context, route);
                          } else if (result == "Financial Calculator") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.gss.financecalculator");
                            if (installed) {
                              launchNativeActivity(result);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "Credit Card to Bank A/C") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CreditToBank()));
                          } else if (result == "Balance Inquiry") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BalanceInquiry()));
                          } else if (result == "Cash Withdrawal") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CashWithdrawalScreen()));
                          } else if (result == "Mini Statement") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MiniStatementScreen()));
                          } else if (result == "Mobile Prepaid" ||
                              result == "DTH" ||
                              result == "Electricity" ||
                              result == "GAS" ||
                              result == "Water" ||
                              result == "Landline Postpaid" ||
                              result == "BroadBand Postpaid" ||
                              result == "Mobile Postpaid") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BillPaymentScreen(result)));
                          } else if (result == "AC/ Appliance Repair") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubCatagoriesScreen(
                                          title: '',
                                          pincode: '',
                                          categoryId: '',
                                        )));
                          } else if (result == "General Store") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SubSubCategoriesScreen(result)));
                          } else if (result == "Dmart" ||
                              result == "Big Bazzar" ||
                              result == "Metro Mall" ||
                              result == "Harbans Karyana Store" ||
                              result == "Atharva Enterprises" ||
                              result == "Pawan Enterprises") {
                            Route route = MaterialPageRoute(
                                builder: (context) => EssentialDetailsScreen(
                                    result,
                                    result == "Dmart"
                                        ? 5.0
                                        : result == "Big Bazzar"
                                            ? 4.5
                                            : result == "Metro Mall"
                                                ? 4.0
                                                : result ==
                                                        "Harbans Karyana Store"
                                                    ? 3.5
                                                    : result ==
                                                            "Atharva Enterprises"
                                                        ? 4.5
                                                        : result ==
                                                                "Pawan Enterprises"
                                                            ? 3.5
                                                            : 0.0));
                            Navigator.push(context, route);
                          } else if (result == "Air Conditioner") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SubSubCategoriesScreen(result)));
                          } else if (result == "Spy Camera" ||
                              result == "Life Saver" ||
                              result == "Secure Chat" ||
                              result == "Anti Hacking" ||
                              result == "Anti Virus" ||
                              result == "Anti Theft" ||
                              result == "Wi-Fi Protect") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.gss.genieshield");
                            if (installed) {
                              launchNativeActivity(result);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "Offer") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OfferScreen()));
                          } else if (result == "Education" || result == "Jobs") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.gss.education");
                            if (installed) {
                              launchNativeActivity(result);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "Health / Fitness") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.gss.gssfitness");
                            if (installed) {
                              launchNativeActivity(result);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "YouTube Video") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.vanced.android.youtube");
                            if (installed) {
                              DeviceApps.openApp("com.vanced.android.youtube");
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "YouTube Music") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.vanced.android.apps.youtube.music");
                            if (installed) {
                              DeviceApps.openApp(
                                  "com.vanced.android.apps.youtube.music");
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "OTT") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OTTScreen()));
                          } else if (result == "YouTube Download" ||
                              result == "News Channels" ||
                              result == "Other Channels") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.gss.entertainment");
                            if (installed) {
                              launchNativeActivity(result);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else {
                            // _alert1Dialog();
                          }
                        },
                        child: const Icon(Icons.search,
                            size: 26.0, color:kWhite),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  NotificationPage()));
                      },
                      child: const Icon(
                        Icons.notifications,
                        color:kWhite,
                      ),
                    ),
                  ),
                     Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: ()async {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>  NotificationPage()));
                       
                         _showLogoutDialog(context);
                      
                       
                      },
                      child: const Icon(
                        Icons.logout,
                        color:kWhite,
                      ),
                    ),
                  ),

                ],
              )
            : AppBar(
                backgroundColor:  navyBlueColor ,
                title: Center(
                  child: type == null
                      ? const Text("")
                      : Text(
                          //"Genie Moneyy - " + 
                          type,
                          style: const TextStyle(color: kWhite),
                        ),
                ),
                        leading: InkWell(
                  onTap: () => ZoomDrawer.of(context)!.toggle(),
                  child: const Icon(
                    Icons.sort,
                    color:kWhite,
                  ),
                ),
                actions: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () async {
                          String? result = await showSearch(
                              context: context, delegate: DataSearch());
                          if (result! == "Merchant\nServices") {
                            print("rohaww");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         EssentialsScreen()));
                          } else if (result ==  "Merchant Services") {
                            print("858584847528");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         EssentialsScreen()));
                          }else if (result == "Financial Services") {
                            print("858584847528");
                          
                       Navigator.push(
                      context,
                       MaterialPageRoute(
              builder: (context) => AllOptions("Financial\nServices")));
                          }
                          else if (result == "Tools") {                         
                       Navigator.push(
                      context,
                       MaterialPageRoute(
                      builder: (context) => AllOptions( "Tools")));
                          }
                           else if (result == "Neo Banking") { 
                         _alert1Dialog();
                          }
                            else if (result == "Unlisted Equity") { 
                         _alert1Dialog();
                          }
                            else if (result == "Bonds") { 
                         _alert1Dialog();
                          }
                            else if (result == "Debenture") { 
                         _alert1Dialog();
                          }
                            else if (result == "Health Insurance") { 
                         _alert1Dialog();
                          }
                            else if (result == "Vehicle Insurance") { 
                         _alert1Dialog();
                          } 
                          else if (result == "Accidental/Death Insurance") { 
                         _alert1Dialog();
                          }
                          else if (result == "Home/Shop/Office Protection Insurance") { 
                         _alert1Dialog();
                          }   else if (result == "Job Loss Insurance") { 
                         _alert1Dialog();
                          } 
                          else if (result == "Cyber Fraud Insurance") { 
                         _alert1Dialog();
                          }  
                          else if (result == "EMI Calculator") { 
                         _alert1Dialog();
                          } 
                          else if (result == "SIP Calculator") { 
                         _alert1Dialog();
                          }  
                           else if (result == "FD Rate Chart") { 
                         _alert1Dialog();
                          }   
                          else if (result == "Change Language") { 
                         _alert1Dialog();
                          }
                       else if (result == "Traditional Banking") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => TraditionalBankingScreen()));
                         }
                          else if (result == "Savings Account") {   
                                                  
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  SavingAccount(account: 'Savings Account', banktype: 13)));
                         }
                         else if (result == "Current Account") {   
                                                  
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  SavingAccount(account: 'Current Account', banktype: 3)));
                         }
                         else if (result ==  "Deposits") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => NbfcScreen ()));
                         }
                         else if (result == "Credit Card") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => NewCreditCardScreen (loanType:  "Credit Card",)));
                         }
                           else if (result == "Credit Lines") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  CreditLinesBankScreen (loanType: "Credit Lines")));
                         }
                          else if (result == "Personal Loan") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  CreditLinesBankScreen (loanType: "Personal Loan")));
                         }
                         else if (result ==  "Life Insurance") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => GeneralInsurances (InsuranceType: 'Life Insurance',)));
                         }
                           else if (result ==  "General Insurance") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => GeneralInsurances (InsuranceType: 'General Insurance',)));
                         }
                          else if (result ==  "Demat") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  DematAccountBankScreen ()));
                         }
                           else if (result ==  "Mutual Fund") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>   InvestmentDetailsScreen  (InvestmentType: "mutualfund",)));
                         }
                        else if (result ==  "Alternative investment") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => AlternativeInvestment(InvestmentType: "Alternative investment",)));
                         }
                          else if (result ==  "NBFC Fixed Deposit") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => Nbfc_Bank_Screen()));
                         }
                         else if (result ==  "Loan Services") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  LoanService ()));
                         }
                          else if (result ==  "Insurance") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => NewInsurance ()));
                         }
                         else if (result ==  "Wallet") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => WalletScrreen ()));
                         }
                          else if (result ==  "Settings") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => SettingsScreen ("Customer")));
                         }
                         else if (result ==  "Profile") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) => ProfileSettingsScreen ()));
                         }
                          else if (result ==  "Change Password") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  ChangePassword ()));
                         }
                          else if (result ==  "Help") {                         
                         Navigator.push(
                           context,
                            MaterialPageRoute(
                            builder: (context) =>  FeedbackScreen ()));
                         }
                         else if (result ==  "Backend Dashboard") {                         
                        //  Navigator.push(
                        //    context,
                        //     MaterialPageRoute(
                        //     builder: (context) =>  FeedbackScreen ()));
                        _launch2URL() ;
                         }
                          
                          else if (result == "Financial Services" ||
                              result == "Personal Security" ||
                              result == "Digit Security" ||
                              result == "Value Added Services" ||
                              result == "Entertainment" ||
                              /*result == "Privilage Offer" ||*/
                              result == "Games") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllOptions(result)));
                          } else if (result == "Financial Services" ||
                              result == "Digital Security Services" ||
                              result == "Value Added Services") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllOptions(result)));
                          } else if (result == "Money Transfer") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoneyTransfer(
                                          fromScreen: result,
                                        )));
                          } else if (result == "Recharge and Bill Payment") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RechargeAndBillPayment()));
                          } else if (result == "Credit Score") {
                            Route route = MaterialPageRoute(
                                builder: (context) => const CreditScoreScreen());
                            Navigator.push(context, route);
                          } else if (result == "Financial Calculator") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.gss.financecalculator");
                            if (installed) {
                              launchNativeActivity(result);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "Credit Card to Bank A/C") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CreditToBank()));
                          } else if (result == "Balance Inquiry") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BalanceInquiry()));
                          } else if (result == "Cash Withdrawal") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CashWithdrawalScreen()));
                          } else if (result == "Mini Statement") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MiniStatementScreen()));
                          } else if (result == "Mobile Prepaid" ||
                              result == "DTH" ||
                              result == "Electricity" ||
                              result == "GAS" ||
                              result == "Water" ||
                              result == "Landline Postpaid" ||
                              result == "BroadBand Postpaid" ||
                              result == "Mobile Postpaid") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BillPaymentScreen(result)));
                          } else if (result == "AC/ Appliance Repair") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubCatagoriesScreen(
                                          title: '',
                                          pincode: '',
                                          categoryId: '',
                                        )));
                          } else if (result == "General Store") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SubSubCategoriesScreen(result)));
                          } else if (result == "Dmart" ||
                              result == "Big Bazzar" ||
                              result == "Metro Mall" ||
                              result == "Harbans Karyana Store" ||
                              result == "Atharva Enterprises" ||
                              result == "Pawan Enterprises") {
                            Route route = MaterialPageRoute(
                                builder: (context) => EssentialDetailsScreen(
                                    result,
                                    result == "Dmart"
                                        ? 5.0
                                        : result == "Big Bazzar"
                                            ? 4.5
                                            : result == "Metro Mall"
                                                ? 4.0
                                                : result ==
                                                        "Harbans Karyana Store"
                                                    ? 3.5
                                                    : result ==
                                                            "Atharva Enterprises"
                                                        ? 4.5
                                                        : result ==
                                                                "Pawan Enterprises"
                                                            ? 3.5
                                                            : 0.0));
                            Navigator.push(context, route);
                          } else if (result == "Air Conditioner") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SubSubCategoriesScreen(result)));
                          } else if (result == "Spy Camera" ||
                              result == "Life Saver" ||
                              result == "Secure Chat" ||
                              result == "Anti Hacking" ||
                              result == "Anti Virus" ||
                              result == "Anti Theft" ||
                              result == "Wi-Fi Protect") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.gss.genieshield");
                            if (installed) {
                              launchNativeActivity(result);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "Offer") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OfferScreen()));
                          } else if (result == "Education" || result == "Jobs") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.gss.education");
                            if (installed) {
                              launchNativeActivity(result);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "Health / Fitness") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.gss.gssfitness");
                            if (installed) {
                              launchNativeActivity(result);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "YouTube Video") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.vanced.android.youtube");
                            if (installed) {
                              DeviceApps.openApp("com.vanced.android.youtube");
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "YouTube Music") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.vanced.android.apps.youtube.music");
                            if (installed) {
                              DeviceApps.openApp(
                                  "com.vanced.android.apps.youtube.music");
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else if (result == "OTT") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OTTScreen()));
                          } else if (result == "YouTube Download" ||
                              result == "News Channels" ||
                              result == "Other Channels") {
                            bool installed = await DeviceApps.isAppInstalled(
                                "com.gss.entertainment");
                            if (installed) {
                              launchNativeActivity(result);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InstallApps(result)));
                            }
                          } else {
                            // _alert1Dialog();
                          }
                        },
                        child: const Icon(Icons.search,
                            size: 26.0, color: kWhite),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  NotificationPage()));

                        
                      },
                      child: const Icon(
                        Icons.notifications,
                        color:kWhite,
                      ),
                    ),
                    
                  ),
                   Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: ()async {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>  NotificationPage()));
                       
                         _showLogoutDialog(context);
                      
                       
                      },
                      child: const Icon(
                        Icons.logout,
                        color:kWhite,
                      ),
                    ),
                  ),
                ],
              ),
        body: SafeArea(
          child: SizedBox(
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: type == "Customer" ? true : false,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: height * 0.25,
                            viewportFraction: 0.85,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: const Duration(seconds: 3),
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentPosition = index;
                              });
                            },
                          ),
                          items: imgList
                              .map(
                                (e) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      InkWell(
                                        child: Image(
                                          image: AssetImage(e),
                                          width: width,
                                          height: height,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(
                          imgList,
                          (index, url) {
                            return Container(
                              width: 5.0,
                              height: 5.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPosition == index
                                    ?  navyBlueColor
                                    : greyColor ,
                              ),
                            );
                          },
                        ),
                      ),
                       const SizedBox(
                        height: 10,
                      ),
                      const Text(
                     'Welcome to Genie Moneyy!',
                    style: TextStyle(
                      fontSize: 25,
                    fontWeight: FontWeight.bold,
                   color: greyColor ,
                   ),
                   ),
                    const SizedBox(
                        height: 5,
                      ),
                    const Text(
                     'What would you like to do?',
                    style: TextStyle(
                      fontSize: 20,
                    fontWeight: FontWeight.w300,
                   color: greyColor ,
                   ),
                   ),

                       const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: type == "Customer" ? false : true,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WalletScrreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: navyBlueColor,
                            ),
                            color: navyBlueColor,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        width: width,
                        child: Center(
                          child: Text(
                            // "Balance : "+"\u20B9" +"0.0",
                            pointss.isEmpty
                                ? "Wallet : 0"
                                : "Wallet : " + pointss.toString(),
                            // "Wallet : " +pointss.toString(),
    
                            style: TextStyle(
                                color: kWhite,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _load
                      ? Center(
                          child: Container(
                            color: const Color(0xFF111111),
                            width: width,
                            height: 70.0,
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    navyBlueColor),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            
                           // margin: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                GridView.count(
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  crossAxisCount: 2,
                                  //childAspectRatio: width / 170,
                                   childAspectRatio:  1.0,

                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  
                                  children: homepageList.map((e) {
                                    return GestureDetector(
                                      onTap: () async {
                                        if (e.name == "Retailer" ||
                                            e.name == "Distributor" ||
                                            e.name == "App History") {
                                          ZoomDrawer.of(context)!.isOpen()
                                              ? ZoomDrawer.of(context)!.toggle()
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RetailerScreen(
                                                              e.name, type)));
                                        } else if (e.name == "Add Portfolio") {
                                          ZoomDrawer.of(context)!.isOpen()
                                              ? ZoomDrawer.of(context)!.toggle()
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PortfolioScreen(type)));
                                        } else if (e.name == "Generate Code" ||
                                            e.name == "Apps History" ||
                                            e.name == "Advertisement") {
                                          ZoomDrawer.of(context)!.isOpen()
                                              ? ZoomDrawer.of(context)!.toggle()
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SalesPartnerScreen(
                                                              e.name)));
                                        } else if (e.name == "Merchant\nServices"
                                            || e.name == "Merchant\nServices")
    
                                        {
                                          ZoomDrawer.of(context)!.isOpen()
                                              ? ZoomDrawer.of(context)!.toggle()
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const EssentialsScreen()));
                                        } else if (e.name ==
                                            "Recharge and Bill Payment") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RechargeAndBillPayment()));
                                        } else if (e.name ==
                                            "Financial Calculator") {
                                          bool installed =
                                              await DeviceApps.isAppInstalled(
                                                  "com.gss.financecalculator");
                                          if (installed) {
                                            launchNativeActivity(e.name);
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        InstallApps(e.name)));
                                          }
                                        } else if (e.name == "Money Transfer") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MoneyTransfer(
                                                        fromScreen: e.name,
                                                      )));
                                        } else if (e.name == "Payment") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MoneyTransfer(
                                                        fromScreen: e.name,
                                                      )));
                                        } else if (e.name == "Scan To Pay") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      QRCodeScannerScreen()));
                                        } else if (e.name ==
                                            "Advertisment Services") {
                                          _alert1Dialog();
                                        } else if (e.name == "Offer") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OfferScreen()));
                                        } else {
                                          ZoomDrawer.of(context)!.isOpen()
                                              ? ZoomDrawer.of(context)!.toggle()
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AllOptions(e.name)));
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
                                        // margin: const EdgeInsets.symmetric(
                                        //     vertical: 10.0, horizontal: 10.0),
                                        color:navyBlueColor,
                                        
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Ink(
                                                decoration: const BoxDecoration(
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //     color:  kWhite ,
                                                  //     blurRadius: 30.0,
                                                  //     spreadRadius: 5.0,
                                                  //   ),
                                                  // ],
                                                ),
                                                child: Image(
                                                  image: AssetImage(e.image),
                                                  width: 40.0,
                                                  height: 40.0,
                                                ),
                                              ),
                                              SizedBox(height: 2), 
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 10,
                                                    left: 10.0,
                                                    right: 10.0,
                                                    bottom: 5.0),
                                                child: Text(
                                                  e.name,
                                                  style: const TextStyle(
                                                    color: kWhite ,
                                                    fontSize: 20.0,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                
                                ),
                                




                              ],
                            ),
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

  void launchNativeActivity(String pageName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userid') ?? '';
    var name = prefs.getString('name') ?? '';
    var email = prefs.getString('email') ?? '';
    var phone = prefs.getString('phone') ?? '';

    final Map<String, String> someMap = {
      "activity": pageName,
      "userid": userid,
      "name": name,
      "email": email,
      "phone": phone
    };

    if (Platform.isAndroid) {
      //DeviceApps.openApp('com.google.android.apps.nbu.paisa.user');
      if (pageName == "Spy Camera" ||
          pageName == "Life Saver" ||
          pageName == "Secure Chat" ||
          pageName == "Anti Hacking" ||
          pageName == "Anti Virus" ||
          pageName == "Anti Theft" ||
          pageName == "Wi-Fi Protect") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.genieshield');
        if (isInstalled == true) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.genieshield',
            componentName: 'com.gss.genieshield.Activity.PasscodeActivity',
            data: 'com.gss.genieshield',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "YouTube Download") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.entertainment');
        if (isInstalled) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.entertainment',
            componentName: 'com.gss.entertainment.Dashboard',
            data: 'com.gss.entertainment',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "News Channels") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.entertainment');
        if (isInstalled == true) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.entertainment',
            componentName: 'com.gss.entertainment.Dashboard',
            data: 'com.gss.entertainment',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "Other Channels") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.entertainment');
        if (isInstalled == true) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.entertainment',
            componentName: 'com.gss.entertainment.Dashboard',
            data: 'com.gss.entertainment',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "Jobs") {
        bool isInstalled = await DeviceApps.isAppInstalled('com.gss.education');
        if (isInstalled == true) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.education',
            componentName: 'com.gss.education.cbse.ui.Dashboard',
            data: 'com.gss.education',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "Education") {
        bool isInstalled = await DeviceApps.isAppInstalled('com.gss.education');
        if (isInstalled == true) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.education',
            componentName: 'com.gss.education.cbse.ui.EducationActivity',
            data: 'com.gss.education',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "Health / Fitness") {
        bool isInstalled = await DeviceApps.isAppInstalled('com.gss.education');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.gssfitness',
            componentName: 'com.gss.gssfitness.ui.FitnessActivity',
            data: 'com.gss.education',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "Financial Calculator") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.financecalculator');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.financecalculator',
            componentName: 'com.gss.financecalculator.activity.MainActivity',
            data: 'com.gss.financecalculator',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "I Have To Fly") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.heyletscode.ihavetofly');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.heyletscode.ihavetofly',
            componentName: 'com.heyletscode.ihavetofly.MainActivity',
            data: 'com.heyletscode.ihavetofly',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "Space Shooter") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.spaceshooter');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.spaceshooter',
            componentName: 'com.gss.spaceshooter.StartUp',
            data: 'com.gss.spaceshooter',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "Flying Fish") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.salinda.flyingfishgame');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.salinda.flyingfishgame',
            componentName: 'com.gss.salindia.flyingfishgame.SplashActivity',
            data: 'com.gss.salinda.flyingfishgame',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "Plane Shooter") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.planeshooter');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.planeshooter',
            componentName: 'com.gss.planeshooter.MainActivity',
            data: 'com.gss.planeshooter',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "Ludo") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.myludogame');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.myludogame',
            componentName: 'com.gss.myludogame.MainActivity',
            data: 'com.gss.myludogame',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      }
    }
  }

  Future _alertDialog(BuildContext context) {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          contentText: 'Getting Activated Soon',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

void _alert1Dialog() {
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
                  style: TextStyle(color: navyBlueColor, fontSize: 18),
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





  Future<void> getreferal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      pointss = sharedPreferences.getString('point') ?? "";
      print("lalalalala" + pointss.toString());
    });
  }
  
  
}
void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => _alertDialog(context, "Logout", "Are you sure you want to log out?"),
  );
}

Widget _alertDialog(BuildContext context, String title, String message) {
  return AlertDialog(
    backgroundColor: kWhite,
    content: Container(
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              message,
              style: TextStyle(color: navyBlueColor, fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 0),
            height: 40,
            width: 100,
            child: ElevatedButton(
              child: const Text(
                "Ok",
                style: TextStyle(
                  color: kWhite,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(30, 80.0),
                backgroundColor: navyBlueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () async {
                if (title == "Logout") {
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SignInScreen("0"),
                    ),
                    (route) => false,
                  );
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}





class DataSearch extends SearchDelegate<String> {
  final services = [
    "Financial Services",
    "Merchant Services",
   // "Personal Security",
    //"Digit Security",
     "Tools",
     "Neo Banking",
     "Traditional Banking",
     "Savings Account",
     "Current Account",
     "Deposits",
     "Credit Card",
     "Credit Lines",
     "Personal Loan",
     "Demat",
     "Life Insurance",
     "General Insurance",
     "Mutual Fund",
     "Bonds",
     "Debenture",
     "Unlisted Equity",
     "Alternative investment",
     "NBFC Fixed Deposit",
     "Loan Services",
     "Insurance",
     "Health Insurance",
     "Vehicle Insurance",
     "Accidental/Death Insurance",
     "Home/Shop/Office Protection Insurance",
     "Job Loss Insurance",
     "Cyber Fraud Insurance",
     "FD Rate Chart",
     "EMI Calculator",
     "SIP Calculator",
     "Backend Dashboard",
     "Wallet",
     "Settings",
     "Profile",
     "Change Password",
     "Help",
     "Change Language",

    // "Entertainment",
    // "Privilage Offer",
    // "Games",
    // "Money Transfer",
    // "Instant Loan",
    // "Consumer Loan",
    // "Insurance",
    // "InvestmentInvestment",
    // "Stock & IPOs",
    // "Recharge and Bill Payment",
    // "Credit Score",
    // "Digi Locker",
    // "Financial Calculator",
    // "Credit Card to Bank A/C",
    // "Balance Inquiry",
    // "Cash Withdrawal",
    // "Mini Statement",
    // "Micro ATM",
    // "Mobile Prepaid",
    // "DTH",
    // "Electricity",
    // "GAS",
    // "Water",
    // "BroadBand Prepaid",
    // "Landline Postpaid",
    // "BroadBand Postpaid",
    // "Mobile Postpaid",
    // "General Store",
    // "Vegetable Vendor",
    // "AC / Appliance Repair",
    // "Electricians",
    // "Plumber",
    // "Carpenter",
    // "Car / Bike Mechanic",
    // "Cleaning",
    // "Tutor",
    // "Maid",
    // "Laundry",
    // "Cable Vendor",
    // "Saloon, Spa, Massage",
    // "Home Painting",
    // "Pest Control",
    // "Medicine Shop",
    // "Emergency",
    // "Gas / Cylinder Vendor",
    // "Internet Provider",
    // "Restaurants",
    // "Gardener",
    // "Dmart",
    // "Big Bazzar",
    // "Metro Mall",
    // "Harbans Karyana Store",
    // "Air Conditioner",
    // "Chimney",
    // "Geyser",
    // "Microwave",
    // "Television",
    // "Washing Machine",
    // "Water Purifier",
    // "Atharva Enterprises",
    // "Pawan Enterprises",
    // "Spy Camera",
    // "Life Saver",
    // "Secure Chat",
    // "Anti Hacking",
    // "Anti Virus",
    // "Anti Theft",
    // "Wifi Protect",
    // "Education",
    // "Health / Fitness",
    // "Jobs",
    // "YouTube Video",
    // "YouTube Music",
    // "YouTube Download",
    // "News Channels",
    // "Other Channels",
    // "Facebook Video",
    // "OTT"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    
    // actions for the app bar
    // return [
    //   IconButton(
    //       onPressed: () {
    //         query = "";
    //       },
    //       icon: const Icon(Icons.clear))
    // ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of app bar
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when some one searches for something
    final suggestionList = query.isEmpty
        ? services
        : services
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.of(context).pop(suggestionList[index]);
        },
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Color(0xFF3A3A3A),
        );
      },
    );
  }












  

}
// alert() {


//   defaultDialog(
//     titleStyle: const TextStyle(color: Color(0xFFFFAE00),),
//     title: "Exit App",
//     middleText: "Do you want to exit from  App?",
//     middleTextStyle: const TextStyle(color:  Color(0xFFFFAE00),),
//     textCancel: 'No',
//     textConfirm: 'Yes',
//     confirmTextColor: Colors.white,
//     cancelTextColor:  Color(0xFFFFAE00),
//     buttonColor:  Color(0xFFFFAE00),
//     onConfirm: () {
//       //Navigator.of(context).pop();
//       SystemNavigator.pop();
//       // Get.offAll(
//       //     curve: Curves.easeInBack,
//       //     transition: Transition.fadeIn,
//       //     () => Homescreen());
//     },
//     backgroundColor: Colors.white,
//     onCancel: () {
//       // Get.back();
//       HomeScreen();
//     },
//   );
// }

// void defaultDialog({required TextStyle titleStyle, required String title, required String middleText, required TextStyle middleTextStyle, required String textCancel, required String textConfirm, required Color confirmTextColor, required Color cancelTextColor, required Color buttonColor, required Null Function() onConfirm, required Color backgroundColor, required Null Function() onCancel}) {
// }

void showExitConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Do you want to exit?', style: TextStyle(color: navyBlueColor)),
        
     //   content: Text('Do you want to exit the app?',style: TextStyle(color: Colors.orange)),
          backgroundColor: kWhite,
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(
          //   color: Colors.orange, // Set the border color here
          //   width: 2.0, // Set the border width here
          // ),
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: navyBlueColor,
            ),
            child: TextButton(
              child: Text('No', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop(false); // Close the dialog and return false
              },
            ),
          ),
           SizedBox(width: 10.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:navyBlueColor,
            ),
            child: TextButton(
              child: Text('Yes', style: TextStyle(color: Colors.white)),
              onPressed: () {
                SystemNavigator.pop(); // Close the dialog and return true
              },
            ),
          ),
        ],
      );
    },
  );
 
}
    Future<bool> _onWillPop([BuildContext? context]) async {

  showExitConfirmationDialog(context!);
  return false;
}
_launch2URL() async {
  const url = 'https://geniemoneyy.com/login/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
