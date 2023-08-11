import 'dart:convert';
import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/Traditional_Banking_screen.dart';
import 'package:genie_money/Screens/cowin_screen.dart';
import 'package:genie_money/Screens/credit_score_screen.dart';
import 'package:genie_money/Screens/insurance_screen.dart';
import 'package:genie_money/Screens/investment_services.dart';
import 'package:genie_money/Screens/loan_service.dart';
import 'package:genie_money/Screens/new_crditcard_screen.dart';
import 'package:genie_money/Screens/offer_screen.dart';
import 'package:genie_money/Screens/payment_form.dart';
import 'package:genie_money/Screens/qr_code_scanner_screen.dart';
import 'package:genie_money/Screens/recharge_and_bill_payment_screen.dart';
import 'package:genie_money/Screens/sales_partner_screen.dart';
import 'package:genie_money/Screens/web_screen.dart';
import 'package:genie_money/Screens/web_view_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/data/remote/network/NetworkApiServiceNewVendor.dart';
import 'package:genie_money/utils/silver_delegate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/NewVendorsModel.dart';
import '../Model/dmt/BankListModel.dart';
import '../Model/ott_model.dart';
import '../utils/constants.dart';
import '../utils/network.dart';
import 'package:http/http.dart' as http;

import 'InsuranceNew.dart';
import 'TransactionalServices.dart';
import 'bank_service.dart';
import 'busbooking.dart';
import 'install_screen.dart';
import 'money_transfer.dart';

class AllOptions extends StatefulWidget {
  String option;

  AllOptions(this.option, {Key? key}) : super(key: key);

  @override
  _ALlOptions createState() {
    // TODO: implement createState
    return _ALlOptions();
  }
}

class _ALlOptions extends State<AllOptions> {
  late List<HomePageList> homepageList;

  late String option = widget.option;
  bool securityVisibility = false;
  String type = "";

  ////////////////////////////////////////
  BankModel? selectedBankModelp;
  List<Category> VendorCatList = [];
  Category? selected_type;

  late String user;
  bool showSpinner = false;

  var _ads_1_file;
  var _ads_2_file;
  var _ads_3_file;
  var _ads_4_file;
  var _ads_5_file;
  late String selected_typee = "Proprietorship";
  String? CatId;
  late String CAtname;
  String selectedBankNamep = "Select Bank";
  bool agree = true;

  bool isVisible = false;
  String postAdd = "Yes";
  String BankAdd = "No";
  late String admintype;
  late String categoryID;
  List<BankModel>? bankList = [];
  List<BankModel>? tempBankList = [];
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _MobilenoController = TextEditingController();
  TextEditingController _CategoryController = TextEditingController();
  TextEditingController _Address1Controller = TextEditingController();
  TextEditingController _Address2Controller = TextEditingController();
  TextEditingController _TalukaController = TextEditingController();
  TextEditingController _DistrictController = TextEditingController();
  TextEditingController _StateController = TextEditingController();
  TextEditingController _pin_code_controller = TextEditingController();
  TextEditingController _NamePinCodeController = TextEditingController();
  TextEditingController _OthersController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();
  TextEditingController _refermerchantby = TextEditingController();
  TextEditingController _MerchantnameController = TextEditingController();
  TextEditingController _owner = TextEditingController();
  TextEditingController _GsT = TextEditingController();
  TextEditingController _Branch = TextEditingController();
  TextEditingController _AccountNumber = TextEditingController();
  TextEditingController _IFSCode = TextEditingController();
  TextEditingController _Password = TextEditingController();
  TextEditingController otpController = TextEditingController();
  List<String> business_type_list = [
    'Proprietorship',
    'Partnership',
    'Private Limited',
    'Others'
  ];

  @override
  void initState() {
    categoryID = Constants.category.toString();
    // categoryID = Constants.userid.toString();
    admintype = Constants.admin_type;
    print("dddddddddddddddddddddddddddddddd" + categoryID);
    print("aaaaaaaaaa" + admintype);
    setState(() {});
    getdata();

    getUserType();
    if (option.endsWith("Travel Booking") ||
        option.endsWith("Travel Booking")) {
      homepageList = [
        HomePageList(id: "1", name: "Flight", image: "images/aeroplane.png", type: ''),
        HomePageList(id: "3", name: "Train", image: "images/train_gs.png", type: ''),
        HomePageList(id: "5", name: "Bus", image: "images/bus.png", type: ''),
        HomePageList(id: "2", name: "Hotels", image: "images/hotel_gs.png", type: ''),
        HomePageList(id: "4", name: "Local Taxi", image: "images/car.png", type: ''),
      ];
    } else if (option.endsWith("Financial ")) {
      homepageList = [
        HomePageList(
            id: "6", name: "Payments", image: "images/money_transfer.png", type: ''),
        HomePageList(
            id: "8",
            name: "Recharge/Bill Payment",
            image: "images/recharge_and_bill.png", type: ''),
        HomePageList(
            id: "10", name: "Loans", image: "images/consumer_loan.png", type: ''),
        /*HomePageList(
            id: "9", name: "Instant Loan", image: "images/instant_loan.png"),
        HomePageList(
            id: "10", name: "Consumer Loans", image: "images/consumer_loan.png"),*/
        HomePageList(
            id: "11", name: "Insurance", image: "images/insurance.png", type: ''),
        HomePageList(
            id: "12", name: "Investments", image: "images/investment.png", type: ''),
        /*HomePageList(
            id: "13", name: "Stock & IPOs", image: "images/stock.png"),*/
        HomePageList(
            id: "14", name: "Credit Score", image: "images/cerdit_score.png", type: ''),
        HomePageList(
            id: "15", name: "Digi Locker", image: "images/digi_locker.png", type: ''),
        HomePageList(
            id: "16",
            name: "Financial Calculator",
            image: "images/finance_calculator.png", type: '')
      ];
    } else if (option.endsWith("Financial\nServices")) {
      homepageList = [
        HomePageList(
            id: "51",
            name: "Neo Banking",
            image: "images/Neo Banking.png", type: '',
             // Adjust the width of the image
   // Adjust the height of the image
  
            
            ),
        HomePageList(
            id: "52",
            name: "Traditional Banking",
            image: "images/Traditional Banking.png", type: ''),





        ///Comenting below code of sunil
       /* HomePageList(
            id: "7",
            name: "Banking Services",
            image: "images/bank_details.png"),
        HomePageList(
            id: "9", name: "Loan Services", image: "images/instant_loan.png"),
        HomePageList(
            id: "111", name: "Credit card", image: "images/creditcard_gm.png"),
        HomePageList(
            id: "11", name: "Insurance", image: "images/insurance.png"),
        HomePageList(
            id: "12", name: "Investments", image: "images/investment.png"),
        HomePageList(
            id: "12",
            name: "Transactional Services",
            image: "images/tranactionalservices.png"),*/
        ///Comenting abuve code of sunil











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
    } else if (option.endsWith("Personal Security")) {
      homepageList = [
        HomePageList(
            id: "17", name: "Spy Camera", image: "images/spy_camera.png", type: ''),
        HomePageList(
            id: "18", name: "Life Saver", image: "images/life_saver.png", type: ''),
        HomePageList(
            id: "19", name: "Secure Chat", image: "images/secure_chat.png", type: '')
      ];
    } else if (option.endsWith("Device Security") ||
        option.endsWith("Digital Security Services")) {
      homepageList = [
        /*HomePageList(
            id: "21", name: "Anti Virus", image: "images/anitvirus.png"),*/
        HomePageList(
            id: "22", name: "Anti Theft", image: "images/anittheft.png", type: ''),
        HomePageList(
            id: "20", name: "Anti Hacking", image: "images/anti_hacking.png", type: ''),
        HomePageList(
            id: "23",
            name: "Wi-Fi Protect",
            image: "images/wifi_protection.png", type: '')
      ];
    } else if (option.endsWith("Entertainment") ||
        option.endsWith("Entertainment")) {
      homepageList = [
        HomePageList(
            id: "24", name: "YouTube Video", image: "images/youtube_video.png", type: ''),
        HomePageList(
            id: "8", name: "YouTube Music", image: "images/youtube_music.png", type: ''),
        HomePageList(
            id: "25",
            name: "YouTube Download",
            image: "images/youtube_download.png", type: ''),
        HomePageList(
            id: "26", name: "News Channels", image: "images/valueaddition.png", type: ''),
        HomePageList(
            id: "27",
            name: "Other Channels",
            image: "images/other_channel.png", type: ''),
        HomePageList(
            id: "28",
            name: "Facebook video downloader",
            image: "images/facebook_video_downloader.png", type: ''),
        HomePageList(id: "29", name: "OTT", image: "images/ott.png", type: '')
      ];
    } else if (option.endsWith("Privilage Offer")) {
      homepageList = [
        /*HomePageList(
            id: "33",
            name: "Accidental Insurance",
            image: "images/accidental_insurance.png"),*/
        /*HomePageList(
            id: "8",
            name: "COVID-19 Insurance",
            image: "images/covid_insurance.png"),*/
        HomePageList(id: "34", name: "Offers", image: "images/offers.png", type: ''),
        /*HomePageList(
            id: "35", name: "CoWIN", image: "images/cowinlogo.png")*/
      ];
    } else if (option.endsWith("Games")) {
      homepageList = [
        HomePageList(
            id: "7",
            name: "I Have To Fly",
            image: "images/i_have_to_fly_icon.png", type: ''),
        HomePageList(
            id: "8",
            name: "Space Shooter",
            image: "images/space_shooter_icon.png", type: ''),
        HomePageList(
            id: "24",
            name: "Flying Fish",
            image: "images/flying_fish_icon.png", type: ''),
        HomePageList(
            id: "25",
            name: "Plane Shooter",
            image: "images/plane_shooter_icon.png", type: ''),
        HomePageList(id: "25", name: "Ludo", image: "images/ludo_gs.png", type: '')
      ];
    }
    if (option.endsWith("Device Security") ||
        option.endsWith("Digital Security Services") ||
        option.endsWith("Personal Security")) {
      securityVisibility = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor:kWhite ,
      appBar: AppBar(
        backgroundColor:navyBlueColor,
        title: Text(
          //option.toString().endsWith(""),
          option.endsWith("Financial\nServices")
              ? "Financial Services"
              : option.endsWith("Tools")
                  ? "Tools"
                  : "Merchant Services",
          style: const TextStyle(
            color: kWhite ,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color:kWhite ,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
             const SizedBox(
                        height: 45,
                      ),
              const Text(
              "What would you like to do?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: navyBlueColor ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 45.0,left: 25,right: 25,),
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
                        if (homepageList[index].name == "Hotels") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://www.goibibo.com/hotels/", "Hotel"));
                          Navigator.of(context).push(route);
                        } else if (homepageList[index].name == "Flight") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://www.goibibo.com/flights/",
                                  "Aeroplane"));
                          Navigator.of(context).push(route);
                        } else if (homepageList[index].name == "Bus") {
                          Route route = MaterialPageRoute(
                              builder: (context) => BusBooking());
                          Navigator.of(context).push(route);
                        } else if (homepageList[index].name == "Train") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://www.goibibo.com/trains/", "Train"));
                          Navigator.of(context).push(route);
                        } else if (homepageList[index].name == "Local Taxi") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://www.goibibo.com/cars/", "Cabs"));
                          Navigator.of(context).push(route);
                        } else if (homepageList[index].name == "Digi Locker") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://accounts.digilocker.gov.in/signin/smart_v2/cbf21f85030e4d26e590207443947a9f--en",
                                  "Digi Locker"));
                          Navigator.push(context, route);
                        } else if (homepageList[index].name ==
                            "I Have To Fly") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.heyletscode.ihavetofly");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DigitalSecurityDetailScren(name:homepageList[index].name)));*/
                          }
                        } else if (homepageList[index].name ==
                            "Space Shooter") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.spaceshooter");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "Flying Fish") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.salinda.flyingfishgame");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name ==
                            "Plane Shooter") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.planeshooter");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "Ludo") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.myludogame");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "Credit Score") {
                          Route route = MaterialPageRoute(
                              builder: (context) => const CreditScoreScreen());
                          Navigator.push(context, route);
                        } else if (homepageList[index].name ==
                            "Recharge/Bill Payment") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RechargeAndBillPayment()));
                        }
                        /*   else if (homepageList[index].name ==
                            "Travel Booking") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AllOptions("Travel Booking")));*/
                        else if (homepageList[index].name ==
                            "Backend Dashboard") {
                          _launchURRL();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebIntent()));
                        } else if (homepageList[index].name ==
                            "Dashboard") {
                          //_launchURRL();
                          _launch2URL() ;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebIntent()));
                          }

                        else if (homepageList[index].name ==
                            "Device Security") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AllOptions("Device Security")));
                        } else if (homepageList[index].name ==
                            "Personal Security") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AllOptions("Personal Security")));
                        } else if (homepageList[index].name ==
                            "Accidental Insurance") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InsuranceScreen("Accidental Insurance")));
                        } else if (homepageList[index].name == "Insurance") {
                          if (categoryID.isEmpty && type == "Merchant") {
                            _MobilenoController.text = Constants.phone;
                            _emailController.text = Constants.email;

                            showRegistrationDailog();
                          }
                          // else if(type == "Partner"||type == "Associate Partner")
                          else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewInsurance()));
                          }
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
                            launchNativeActivity(homepageList[index].name);
                          } else {
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
                            launchNativeActivity(homepageList[index].name);
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
                            launchNativeActivity(homepageList[index].name);
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
                                  builder: (context) => QRCodeScannerScreen()));
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
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name ==
                            "Banking Services") {
                          if (categoryID.isEmpty && type == "Merchant") {
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
                          }
                        } else if (homepageList[index].name ==
                            "Loan Services") {
                          if (categoryID.isEmpty && type == "Merchant") {
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
                          }
                        } else if (homepageList[index].name == "Investments") {
                          if (categoryID.isEmpty && type == "Merchant") {
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
                          }
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewCreditCardScreen(loanType: '',)));
                        } else if (homepageList[index].name ==
                            "Genie Moneyy Neo Bank") {
                          _alertDialog();
                        }else if (homepageList[index].name ==
                            "Traditional Banking") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TraditionalBankingScreen()));
                        }  else if (homepageList[index].name ==
                            "Transactional Services") {
                          if (categoryID.isEmpty && type == "Merchant") {
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
                          }
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
                                child: Image(
                                  image: AssetImage(homepageList[index].image),
                                  color: kWhite,
                                  width: 70.0,
                                  height: 70.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0, bottom: 10),
                                child: Text(
                                  homepageList[index].name,
                                  style: const TextStyle(
                                    color:kWhite,
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
            Visibility(
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

                        /*if (option == "OTT") {
                            _alertDialog();
                          } else {
                            _download();
                          }*/
                      },
                      // Text(
                      //   "To activate this features for Customer. Please give the Activation code.",
                      //   style: const TextStyle(
                      //     color: Color(0xFFFFAE00),
                      //     fontSize: 18.0,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      /*    Container(

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

                            */ /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SalesPartnerScreen("Generate Code")));
*/ /*
                            */ /*if (option == "OTT") {
                              _alertDialog();
                            } else {
                              _download();
                            }*/ /*
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

                            */ /*if (option == "OTT") {
                              _alertDialog();
                            } else {
                              _download();
                            }*/ /*
                          },
                        ),
                      ),*/
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

                        /*if (option == "OTT") {
                            _alertDialog();
                          } else {
                            _download();
                          }*/
                      },
                      // Text(
                      //   "To activate this features for Customer. Please give the Activation code.",
                      //   style: const TextStyle(
                      //     color: Color(0xFFFFAE00),
                      //     fontSize: 18.0,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      /*    Container(

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

                            */ /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SalesPartnerScreen("Generate Code")));
*/ /*
                            */ /*if (option == "OTT") {
                              _alertDialog();
                            } else {
                              _download();
                            }*/ /*
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

                            */ /*if (option == "OTT") {
                              _alertDialog();
                            } else {
                              _download();
                            }*/ /*
                          },
                        ),
                      ),*/
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = (prefs.get("type") ?? "Customer").toString();
    });
    print("type : " + type);
    if (option.endsWith("Tools") ||
        option.endsWith("Tools")) {
      print("kakakakak" + type);
      if (type == "Merchant" || type == "Customer") {
        homepageList = [
          HomePageList(
              id: "3", name: "FD Rate Chart", image: "images/fdchart.png", type: ''),
          HomePageList(
              id: "78",
              name: "EMI Calculator",
              image: "images/GM-EMICalculator.png", type: ''),
          HomePageList(
              id: "115",
              name: "SIP Calculator",
              image: "images/mutalfunds_gm.png", type: ''),
               HomePageList(
              id: "115",
              name: "Dashboard",
              image: "images/backenddash.png", type: ''),


/*        HomePageList(
            id: "7",
            name: "Travel Booking",
            image: "images/travel.png"),
        HomePageList(
            id: "4",
            name: "Device Security",
            image: "images/device_security.png"),
        HomePageList(
            id: "3",
            name: "Personal Security",
            image: "images/personal_security.png"),
        HomePageList(
            id: "30", name: "Education", image: "images/education.png"),
        HomePageList(
            id: "31", name: "Health / Fitness", image: "images/fitness.png"),
        HomePageList(id: "32", name: "Jobs", image: "images/jobs.png"),
        HomePageList(id: "35", name: "CoWIN", image: "images/cowinlogo.png"),*/
/*
         HomePageList(id: "36", name: "Entertainment", image: "images/entertainment.png"),
*/
/*
        HomePageList(id: "37", name: "Game", image: "images/games.png")
*/
        ];
      } else {
        homepageList = [
          HomePageList(
              id: "3", name: "FD Rate Chart", image: "images/fdchart.png", type: ''),
          HomePageList(
              id: "78",
              name: "EMI Calculator",
              image: "images/GM-EMICalculator.png", type: ''),
          HomePageList(
              id: "115",
              name: "SIP Calculator",
              image: "images/mutalfunds_gm.png", type: ''),
          HomePageList(
              id: "115",
              name: "Backend Dashboard",
              image: "images/backenddash.png", type: ''),
/*        HomePageList(
            id: "7",
            name: "Travel Booking",
            image: "images/travel.png"),
        HomePageList(
            id: "4",
            name: "Device Security",
            image: "images/device_security.png"),
        HomePageList(
            id: "3",
            name: "Personal Security",
            image: "images/personal_security.png"),
        HomePageList(
            id: "30", name: "Education", image: "images/education.png"),
        HomePageList(
            id: "31", name: "Health / Fitness", image: "images/fitness.png"),
        HomePageList(id: "32", name: "Jobs", image: "images/jobs.png"),
        HomePageList(id: "35", name: "CoWIN", image: "images/cowinlogo.png"),*/
/*
         HomePageList(id: "36", name: "Entertainment", image: "images/entertainment.png"),
*/
/*
        HomePageList(id: "37", name: "Game", image: "images/games.png")
*/
        ];
      }
    }
    if (option.endsWith("Personal Security") ||
        option.endsWith("Device Security") ||
        option.endsWith("Digital Security Services")) {
      if (type != "Customer") {
        setState(() {
          securityVisibility = true;
        });
      } else {
        setState(() {
          securityVisibility = false;
        });
      }
    } else {
      setState(() {
        securityVisibility = false;
      });
    }
  }

  void _alertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kWhite,
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
                    margin: EdgeInsets.only(
                      top: 12,
                    ),
                    child: Text(
                      "Getting Activated Soon",
                      style: TextStyle(color:navyBlueColor, fontSize: 20),
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
                            color:kWhite,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(30, 80.0), backgroundColor: navyBlueColor,
                       // shadowColor: const Color(0xFFFFAE00),
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

  showRegistrationDailog() async {
    bool otpVisibility = false;
    bool isCheck = true;
    FocusNode otpFocusNode = FocusNode();
    List<String> category = ["category"];
    Category? selected_type;

    print("type" + type);
    Dialog alterDialogg = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Color(0xFF3A3A3A),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Container(
            //height: 240,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            "Register New Merchant",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFFFAE00),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Color(0xFFFFAE00)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _MerchantnameController,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.text,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Merchant Name',
                          isDense: true,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: const Color(0xFF3A3A3A),
                      isExpanded: true,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        isDense: true,
                      ),
                      value: selected_typee,
                      isDense: true,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFFFFAE00),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                          color: Color(0xFFFFAE00), fontSize: 18),
                      onChanged: (String? ff) {
                        setState(() {
                          selected_typee = (ff ?? "Proprietorship");
                        });
                      },
                      items: business_type_list
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _NamePinCodeController,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.emailAddress,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Owner Name',
                          isDense: true,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _Address1Controller,
                        //controller: _email_mobile_controller,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.text,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Address 1',
                          isDense: true,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _Address2Controller,
                        //controller: _email_mobile_controller,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.text,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Address 2',
                          isDense: true,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.number,
                      controller: _pin_code_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Pin Code',
                        isDense: true,
                      ),
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          if (text.length == 6) {
                            NetworkCall networkCall = NetworkCall();
                            networkCall
                                .getStateAndCity(
                                    _pin_code_controller.text, context)
                                .then((value) => {
                                      setState(() {
                                        _StateController.text = value.postOffice
                                                ?.elementAt(0)
                                                .state ??
                                            "";
                                        _DistrictController.text = value
                                                .postOffice
                                                ?.elementAt(0)
                                                .district ??
                                            "";
                                        _TalukaController.text = value
                                                .postOffice
                                                ?.elementAt(0)
                                                .taluk ??
                                            "";
                                      })
                                    });
                          } else if (text.length > 6) {
                            _createToast("Please enter valid pin code");
                          }
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _TalukaController,

                        //controller: _email_mobile_controller,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.text,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Taluka/Teshil',
                          isDense: true,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _StateController,
                        //controller: _email_mobile_controller,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.text,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'State',
                          isDense: true,
                        )),
                  ),
/*                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _DistrictController,
                        //controller: _email_mobile_controller,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.text,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'District',
                          isDense: true,
                        )),
                  )*/
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _emailController,
                        readOnly: categoryID.isEmpty && type == "Merchant"
                            ? true
                            : false,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.emailAddress,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Email ID',
                          isDense: true,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _MobilenoController,
                        readOnly: categoryID.isEmpty && type == "Merchant"
                            ? true
                            : false,
                        //controller: _email_mobile_controller,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(0xFFFFAE00)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Mobile Number',
                          isDense: true,
                        )),
                  ),
                  Visibility(
                    visible: categoryID.isEmpty && type == "Merchant"
                        ? isVisible = false
                        : isVisible = true,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                          controller: _Password,
                          //controller: _email_mobile_controller,
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          keyboardType: TextInputType.text,
                          //controller: _email_controller,
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Color(0xFFFFAE00)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            // hintText: 'Email / Mobile No.',
                            labelText: 'Password',
                            isDense: true,
                          )),
                    ),
                  ),
/*
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _MobilenoController,
                        //controller: _email_mobile_controller,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.text,
                        maxLength: 10,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(0xFFFFAE00)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Confirm Password',
                          isDense: true,
                        )),
                  ),
*/
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Color(0xFFFFAE00))),
                    margin: EdgeInsets.all(10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text(
                          "Select Category",
                          style: TextStyle(color: Color(0xFFFFAE00)),
                        ),
                        value: selected_type,
                        isDense: true,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xFFFFAE00),
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                            color: Color(0xFFFFAE00), fontSize: 18),
                        onChanged: (data) {
                          setState(() {
                            selected_type = data as Category;
                            CatId = selected_type?.categoryId.toString();
                            //CAtname = selected_type?.categoryName.toString();
                            //       CatId==26?isVisible=true:isVisible=false;
                            if (CatId == "34") {
                              isVisible = true;
                            } else {
                              isVisible = false;
                            }
                          });
                        },
                        dropdownColor: Color(0xFF3A3A3A),
                        items: VendorCatList.map<DropdownMenuItem<Category>>(
                            (Category value) {
                          CAtname = value.categoryName.toString();
                          print("|" + CAtname);
                          return DropdownMenuItem<Category>(
                            value: value,
                            child: Text(value.categoryName.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isVisible,

                    //     Ven     categoryName.toString()=="Other"? isVisible = false:isVisible = true;

                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                          controller: _OthersController,
                          //controller: _email_mobile_controller,
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          keyboardType: TextInputType.text,
                          maxLength: 6,
                          //controller: _email_controller,
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Color(0xFFFFAE00)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            // hintText: 'Email / Mobile No.',
                            labelText: 'Others',
                            isDense: true,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Post Advertisement',
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "Yes",
                              groupValue: postAdd,
                              activeColor: Color(0xFFFFAE00),
                              onChanged: (value) {
                                setState(() {
                                  postAdd = value.toString();
                                });
                              },
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(color: Color(0xFFFFAE00)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "No",
                              groupValue: postAdd,
                              activeColor: Color(0xFFFFAE00),
                              onChanged: (value) {
                                setState(() {
                                  postAdd = value.toString();
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(color: Color(0xFFFFAE00)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  uploadf(context, setState),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ads_1_Column(context, setState),
                        ads_2_Column(context, setState),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ads_3_Column(context, setState),
                        ads_4_Column(context, setState),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ads_5_Column(context, setState),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _GsT,
                        //controller: _email_mobile_controller,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.text,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(0xFFFFAE00)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'GST Number',
                          isDense: true,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _remarkController,
                        //controller: _email_mobile_controller,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.text,
                        //controller: _email_controller,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(0xFFFFAE00)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Remark',
                          isDense: true,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _refermerchantby,
                        //controller: _email_mobile_controller,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.text,
                        maxLength: 6,

                        //controller: _email_controller,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(0xFFFFAE00)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          // hintText: 'Email / Mobile No.',
                          labelText: 'Refer By',
                          isDense: true,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Bank Details (Optional)',
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "Yes",
                              groupValue: BankAdd,
                              activeColor: Color(0xFFFFAE00),
                              onChanged: (value) {
                                setState(() {
                                  BankAdd = value.toString();
                                });
                              },
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(color: Color(0xFFFFAE00)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "No",
                              groupValue: BankAdd,
                              activeColor: Color(0xFFFFAE00),
                              onChanged: (value) {
                                setState(() {
                                  BankAdd = value.toString();
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(color: Color(0xFFFFAE00)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  getBankListDropDown(),
                  Visibility(
                    visible: BankAdd == "Yes" ? true : false,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                          controller: _Branch,
                          //controller: _email_mobile_controller,
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          keyboardType: TextInputType.text,
                          //controller: _email_controller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            // hintText: 'Email / Mobile No.',
                            labelText: 'Branch',
                            isDense: true,
                          )),
                    ),
                  ),
                  Visibility(
                    visible: BankAdd == "Yes" ? true : false,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                          controller: _AccountNumber,
                          //controller: _email_mobile_controller,
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          keyboardType: TextInputType.text,
                          //controller: _email_controller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            // hintText: 'Email / Mobile No.',
                            labelText: 'Account Number',
                            isDense: true,
                          )),
                    ),
                  ),
                  Visibility(
                    visible: BankAdd == "Yes" ? true : false,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                          controller: _IFSCode,
                          //controller: _email_mobile_controller,
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          keyboardType: TextInputType.text,
                          //controller: _email_controller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            // hintText: 'Email / Mobile No.',
                            labelText: 'IFSC Code',
                            isDense: true,
                          )),
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.pop(context);
                          setState(() {
                            otpVisibility = true;
                            otpFocusNode.requestFocus();
                          });
                        },
                        child: Text(
                          "Get OTP",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                          primary: const Color(0xFFFFAE00),
                          shadowColor: const Color(0xFFFFAE00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: otpVisibility,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                          controller: otpController,
                          //controller: _email_mobile_controller,
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          //controller: _email_controller,
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Color(0xFFFFAE00)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            // hintText: 'Email / Mobile No.',
                            labelText: 'OTP',
                            isDense: true,
                          )),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: agree,
                        onChanged: (value) {
                          setState(() {
                            agree = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        "I Agree to the ",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
                              text: 'Terms & Condition',
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _launchURL();
                                  print('Login Text Clicked');
                                }),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: agree,
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            RegisterVendorData();

                            /*        Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: context) => VendorPaymentPage));

*/
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => alterDialogg);
  }

  void _showPicker(context, String which_image, StateSetter setState) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      if (which_image == "aall") {
                        _imgFromGallery(which_image, setState);
                      } else {
                        _imgFromGalleryy(which_image, setState);
                      }

                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera(which_image, setState);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromCamera(String which_image, StateSetter setState) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (which_image == "ads_1") {
        _ads_1_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_2") {
        _ads_2_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_3") {
        _ads_3_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_4") {
        _ads_4_file = image == null ? null : File(image.path);
        print("image" + image.toString());
      } else if (which_image == "aall") {
        _ads_1_file = image == null ? null : File(image.path);
        print("image" + image.toString());
      }
    });
  }

  _imgFromGallery(String which_image, StateSetter setState) async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? image = await _picker.pickMultiImage(imageQuality: 5);

    setState(() {
      if (which_image == "aall") {
        if (image?.length == 1) {
          _ads_1_file = image == null ? null : File(image[0].path);
        } else if (image?.length == 2) {
          _ads_1_file = image == null ? null : File(image[0].path);
          _ads_2_file = image == null ? null : File(image[1].path);
        } else if (image?.length == 3) {
          _ads_1_file = image == null ? null : File(image[0].path);
          _ads_2_file = image == null ? null : File(image[1].path);
          _ads_3_file = image == null ? null : File(image[2].path);
        } else if (image?.length == 4) {
          _ads_1_file = image == null ? null : File(image[0].path);
          _ads_2_file = image == null ? null : File(image[1].path);
          _ads_3_file = image == null ? null : File(image[2].path);
          _ads_4_file = image == null ? null : File(image[3].path);
        } else if (image?.length == 5) {
          _ads_1_file = image == null ? null : File(image[0].path);
          _ads_2_file = image == null ? null : File(image[1].path);
          _ads_3_file = image == null ? null : File(image[2].path);
          _ads_4_file = image == null ? null : File(image[3].path);
          _ads_5_file = image == null ? null : File(image[3].path);
        }
      }

      /* _ads_1_file = image == null ? null : File(image[0].path);
        _ads_2_file = image == null ? null : File(image[1].path);
        _ads_3_file = image == null ? null : File(image[2].path);
        _ads_4_file = image == null ? null : File(image[3].path);
*/

      print("image" + image.toString());
    });
  }

  _imgFromGalleryy(String which_image, StateSetter setState) async {
    final ImagePicker _pickerr = ImagePicker();
    XFile? images =
        await _pickerr.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (which_image == "ads_1") {
        _ads_1_file = images == null ? null : File(images!.path);
      } else if (which_image == "ads_2") {
        _ads_2_file = images == null ? null : File(images!.path);
      } else if (which_image == "ads_3") {
        _ads_3_file = images == null ? null : File(images!.path);
      } else if (which_image == "ads_4") {
        _ads_4_file = images == null ? null : File(images!.path);
        print("image" + images.toString());
      }

      /* _ads_1_file = image == null ? null : File(image[0].path);
        _ads_2_file = image == null ? null : File(image[1].path);
        _ads_3_file = image == null ? null : File(image[2].path);
        _ads_4_file = image == null ? null : File(image[3].path);
*/

      print("image" + images.toString());
    });
  }

  ads_4_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: _ads_3_file == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "ads_4", setState);
                },
                child: ClipRect(
                  child: _ads_4_file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _ads_4_file!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Color(0xFFFFAE00),
                            size: 100,
                          )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _ads_4_file == null ? false : true,
            child: Center(
              child: Text(
                "Photo 4",
                style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ads_3_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: _ads_2_file == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "ads_3", setState);
                },
                child: ClipRect(
                  child: _ads_3_file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _ads_3_file!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Color(0xFFFFAE00),
                            size: 100,
                          )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _ads_3_file == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 3",
                style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ads_2_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: _ads_1_file == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "ads_2", setState);
                },
                child: ClipRect(
                  child: _ads_2_file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _ads_2_file!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Color(0xFFFFAE00),
                            size: 100,
                          )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _ads_2_file == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 2",
                style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ads_1_Column(BuildContext context, StateSetter setState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "ads_1", setState);
                setState(() {});
              },
              child: ClipRect(
                child: _ads_1_file != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          _ads_1_file!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: _ads_1_file == null ? false : true,
          child: const Center(
            child: Text(
              "Photo 1",
              style: TextStyle(
                color: Color(0xFFFFAE00),
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  ads_5_Column(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: _ads_4_file == null ? false : true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, "ads_5", setState);
                  setState(() {});
                },
                child: ClipRect(
                  child: _ads_5_file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _ads_5_file!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Color(0xFFFFAE00),
                            size: 100,
                          )),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _ads_5_file == null ? false : true,
            child: const Center(
              child: Text(
                "Photo 5",
                style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Visibility uploadf(BuildContext context, StateSetter setState) {
    return Visibility(
      visible: agree,
      child: Container(
        height: 40,
        margin: EdgeInsets.all(10),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _showPicker(context, "aall", setState);

              /*        Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: context) => VendorPaymentPage));

*/
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Upload Image",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.upload_file,
                  color: Colors.black,
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
              //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
              primary: const Color(0xFFFFAE00),
              shadowColor: const Color(0xFFFFAE00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void RegisterVendorData() async {
/*    SharedPreferences preferences =
        SharedPreferences.getInstance() as SharedPreferences;
    String? user = preferences.getString("userid");*/

    if (_NamePinCodeController.text.toString().isEmpty) {
      Fluttertoast.showToast(
          msg: "Pleas enter name ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (_MobilenoController.text.toString().isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter mobile no ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (_emailController.text.toString().isEmpty) {
      Fluttertoast.showToast(
          msg: "Pleas enter email ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (CAtname.toString().isEmpty) {
      Fluttertoast.showToast(
          msg: "Please seclect Category ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (otpController.text.toString().isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter  OTP ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      setState(() {
        showSpinner = true;
      });

      // var stream  = new http.ByteStream(_ads_1_file!.openRead());
      // stream.cast();
      // var stream2  = new http.ByteStream(_ads_2_file!.openRead());
      //   stream2.cast();
      //   var stream3  = new http.ByteStream(_ads_1_file!.openRead());
      //   stream3.cast();
      //   var stream4  = new http.ByteStream(_ads_1_file!.openRead());
      //   stream4.cast();

//       var stream3 = new http.ByteStream(_ads_1_file!.openRead());
//       var stream4  = new http.ByteStream(_ads_1_file!.openRead());
// /*      var stream2  = new http.ByteStream(_ads_2_file!.openRead());
//       var stream3  = new http.ByteStream(_ads_3_file!.openRead());
//       var stream4  = new http.ByteStream(_ads_4_file!.openRead());*/
//       stream3.cast();
//       stream4.cast();
      // stream2.cast();
      // stream3.cast();
      // stream4.cast();

      //   var length = await _ads_1_file!.length();

      var uri = Uri.parse(
          'https://geniemoneyy.com/genie_money/public/index.php/useressentialssave');

      var request = new http.MultipartRequest('POST', uri);
      //"phone": _MobilenoController.text.toString(),

      request.fields['user_id'] = Constants.userid;
      request.fields['category_id'] = CatId.toString();
      request.fields['password'] = _Password.text.toString();
      request.fields['merchant_name'] = _MerchantnameController.text.toString();
      request.fields['merchant_type'] = selected_typee.toString();
      request.fields['if_other'] = "";
      request.fields['name_of_owner'] = _NamePinCodeController.text.toString();
      request.fields['phone'] = _MobilenoController.text.toString();
      request.fields['email'] = _emailController.text.toString();
      request.fields['address'] = _Address1Controller.text.toString();
      request.fields['address2'] = _Address2Controller.text.toString();
      request.fields['city'] = _TalukaController.text.toString();
      request.fields['gst'] = _GsT.text.toString();
      request.fields['state'] = _StateController.text.toString();
      request.fields['pincode'] = _pin_code_controller.text.toString();
      request.fields['bank_name'] = selectedBankNamep.toString();
      request.fields['Branch'] = _Branch.text.toString();
      request.fields['account'] = _AccountNumber.text.toString();
      request.fields['ifsc_code'] = _IFSCode.text.toString();
      request.fields['remark'] = _remarkController.text.toString();
      request.fields['marchant_refer_by'] = _refermerchantby.text.toString();

      if (_ads_1_file != null) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('ad_1', _ads_1_file!.path);
        request.files.add(multipartFile);
      } else {
        // request.fields['ad_1'] =  _remarkController.text.toString();
        var bytes = (await rootBundle.load('images/sliderlogo.jpg'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('ad_1', bytes,
            filename: 'sliderlogo.jpg');
        request.files.add(mpFile);
      }

      if (_ads_2_file != null) {
        http.MultipartFile multipartFile2 =
            await http.MultipartFile.fromPath('ad_2', _ads_2_file!.path);
        request.files.add(multipartFile2);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.jpg'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('ad_2', bytes,
            filename: 'sliderlogo.jpg');
        request.files.add(mpFile);
      }

      if (_ads_3_file != null) {
        http.MultipartFile multipartFile3 =
            await http.MultipartFile.fromPath('ad_3', _ads_1_file!.path);
        request.files.add(multipartFile3);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.jpg'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('ad_3', bytes,
            filename: 'sliderlogo.jpg');
        request.files.add(mpFile);
      }

      if (_ads_4_file != null) {
        http.MultipartFile multipartFile4 =
            await http.MultipartFile.fromPath('ad_4', _ads_4_file!.path);
        request.files.add(multipartFile4);
      } else {
        var bytes = (await rootBundle.load('images/sliderlogo.jpg'))
            .buffer
            .asUint8List();
        var mpFile = http.MultipartFile.fromBytes('ad_4', bytes,
            filename: 'sliderlogo.jpg');
        request.files.add(mpFile);
      }
// if(_ads_4_file==null||_ads_3_file==null||_ads_2_file==null||_ads_1_file==null)
//   {
//     request.files.add(http.MultipartFile.fromString("ad_1", "aadharcard_payment_gm.png"));
//
//
//
//   }

      //  request.files.add(multipartFile2);
      // request.files.add(multipartFile3);
      //  request.files.add(multipartFile4);

/*
    var multiport = new http.MultipartFile(
          'ad_1',
          stream,
          length);*/
/* var multiport2 = new http.MultipartFile(
          'ad_2',
          stream,
          length);
 var multiport3 = new http.MultipartFile(
          'ad_3',
          stream,
          length);
 var multiport4 = new http.MultipartFile(
          'ad_4',
          stream,
          length)*/
      ;

      /// request.files.add(multiport);

      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      final decodedMap = json.decode(responseString);

      int stat = decodedMap['status'];
      // var ess = decodedMap['ess_id '];
      var msg = decodedMap['error'];

      print(decodedMap['status']);
      print(responseString);
      print(decodedMap['ess_id ']);
      print(decodedMap['error']);

      //  print(response.stream.toString());

      /*   var model = VendorResponse.fromJson(StreamedResponse);

      String stat = model.status.toString();
      String ess = model.essId.toString();
      print("ddddddddddddd"+stat);*/

      if (stat == 201) {
        Fluttertoast.showToast(
            msg: "Merchant Succesfully Registerd ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        var ess = decodedMap['ess_id '];
        var newcatID = decodedMap['category_id '];
        setState(() {
          showSpinner = false;
        });
        String _name='';
        String _email='';
        String _phone='';
        String _Address='';
        String _amount='';
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaymentForm(
                  _name,
 _email,
   _phone,
_Address,
 _amount
              
                     /* essid: ess.toString(),
                      cat_id: newcatID,
                      cat_idd: '1',*/

                    )));
      } else {
        Fluttertoast.showToast(
            //msg: "Email & Mobile No Already Exist",
            msg: "Email & Mobile No Already Exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          showSpinner = false;
        });
      }

      /* Map<String, String> jsonbody = {
        "category_id": CatId.toString(),
        "user_id":user.toString(),
        "password":_MobilenoController.text.toString(),

        "merchant_name":_MerchantnameController.text.toString(),
        "merchant_type":selected_typee.toString(),
        "if_other":_IFSCode.text.toString(),
        "name_of_owner": _NamePinCodeController.text.toString(),
        "phone": _MobilenoController.text.toString(),
        "email": _emailController.text.toString(),
        "address": _Address1Controller.text.toString(),
        "address2": _Address2Controller.text.toString(),
        "city": _TalukaController.text.toString(),
        "gst":_GsT.text.toString(),
        "state": _StateController.text.toString(),
        "pincode": _pin_code_controller.text.toString(),
        "bank_name":selectedBankNamep.toString(),
        "Branch":_Branch.text.toString(),
        "account":_AccountNumber.text.toString(),
        "ifsc_code":_IFSCode.text.toString(),




        // "user_id:": user.toString(),

        //  "district": _DistrictController.text.toString(),


*/ /*
        "remark":_remarkController.text.toString(),
*/ /*



        */ /*   "ad_1":_ads_1_file,
      "ad_2":_ads_2_file.toString(),
      "ad_3":_ads_3_file.toString(),
      "ad_4":_ads_4_file.toString(),
*/ /*
      };
      var network = NewVendorApiService();
      String urls =
          "http://165.22.219.135/genie_money/public/index.php/useressentialssave";
      var res = await network.postresponse(urls, jsonbody);
      var model = VendorResponse.fromJson(res);
      String stat = model.status.toString();
      String ess = model.essId.toString();

      if (stat != 201) {
        Fluttertoast.showToast(
            msg: "Vendor Succesfully Registerd ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    VendorPaymentPage(essid: ess,)));
      }
      else {
        Fluttertoast.showToast(
            msg: "Somthing Went Wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      print("" + res!.toString());

*/
    }
  }

  void _createToast(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  Widget getBankListDropDown() {
    return GestureDetector(
      onTap: () {
        setState(() {
          tempBankList = bankList;
        });
        Dialog bankDialog = Dialog(
          backgroundColor: Color(0xFF3A3A3A),
          child: StatefulBuilder(builder: (context, setStateNew) {
            return Container(
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Color(0xFFFFAE00))),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: TextField(
                            textCapitalization: TextCapitalization.characters,
                            onChanged: (value) {
                              setStateNew(() {
                                if (value.isNotEmpty) {
                                  tempBankList = bankList!
                                      .where((element) =>
                                          element.bankName.contains(value))
                                      .toList();
                                } else {
                                  tempBankList = bankList!;
                                }
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            autocorrect: false,
                            enableSuggestions: false,
                            style: TextStyle(
                                color: Color(0xFFFFAE00),
                                decoration: TextDecoration.none),
                            cursorColor: const Color(0xFFFFAE00),
                          ),
                        )),
                        Icon(
                          Icons.search,
                          color: Color(0xFFFFAE00),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: tempBankList!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedBankModelp = tempBankList![index];
                                  selectedBankNamep =
                                      selectedBankModelp!.bankName;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  tempBankList![index].bankName,
                                  style: TextStyle(
                                      color: Color(0xFFFFAE00), fontSize: 18),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            );
          }),
        );

        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => bankDialog);
      },
      child: Visibility(
        visible: BankAdd == "Yes" ? true : false,
        child: Container(
          //height: 40,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Color(0xFFFFAE00))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  selectedBankNamep,
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 16),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Color(0xFFFFAE00),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getdata() async {
    String url =
        "https://geniemoneyy.com/genie_money/public/index.php/categoryimage";
    var network = new NewVendorApiService();
    var res = await network.getresponse(url);
    var vlist = NewVendorsModel.fromJson(res);

    setState(() {
      VendorCatList = vlist.category!;
    });

    print("" + res!.toString());
  }

  _launchURRL() async {
    const url = 'https://geniemoneyy.com/login/';
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class OTTScreen extends StatefulWidget {
  const OTTScreen({Key? key}) : super(key: key);

  @override
  State<OTTScreen> createState() => _OTTScreenState();
}

class _OTTScreenState extends State<OTTScreen> {
  late List<OTTModel> ottList;

  @override
  void initState() {
    ottList = [
      OTTModel(
          "7", "Netflix", "images/netflix_gs1.png", "com.netflix.mediaclient"),
      OTTModel("8", "Amazon Prime", "images/primvideo_gs2.png",
          "com.amazon.avod.thirdpartyclient"),
      OTTModel("9", "Disney+ Hotstar", "images/disney_hotstar_gs3.png",
          "in.startv.hotstar"),
      OTTModel("10", "Sony Liv", "images/sonyliv-gs4.png", "com.sonyliv"),
      OTTModel("11", "Zee 5", "images/zee5_gs5.png", "com.graymatrix.did"),
      OTTModel("12", "Voot", "images/voot_gs6.png", "com.tv.v18.viola"),
      OTTModel("13", "MX Player", "images/mx_player_gs7.png",
          "com.mxtech.videoplayer.ad"),
      OTTModel(
          "14", "ALT Balaji", "images/alt_balaji_gs8.png", "com.balaji.alt"),
      OTTModel("15", "TVF Play", "images/tvf_gs9.png", "com.tvf.tvfplay"),
      OTTModel("16", "Eros Now", "images/erosnow_gs10.png", "com.erosnow"),
      OTTModel("16", "Jio Cinema", "images/jiocinema_gs11.png",
          "com.jio.media.ondemand"),
      OTTModel("16", "Airtel XStream", "images/airtel_xstream_gs12.png",
          "tv.accedo.airtel.wynk")
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
          "OTT",
          style: TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFAE00),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    height: height * 0.25,
                  ),
                  itemCount: ottList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        bool isInstalled = await DeviceApps.isAppInstalled(
                            ottList[index].packageName);
                        if (isInstalled) {
                          DeviceApps.openApp(ottList[index].packageName);
                        } else {
                          launch(
                              "https://play.google.com/store/apps/details?id=${ottList[index].packageName}");
                        }
                      },
                      child: Card(
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            side: BorderSide(
                              color: Color(0xFFFFAE00),
                              width: 2.0,
                            )),
                        color: const Color(0xFF444444),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: Image(
                                  image: AssetImage(ottList[index].image),
                                  width: 90.0,
                                  height: 90.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0),
                                child: Text(
                                  ottList[index].name,
                                  style: const TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 16.0,
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
}

_launchURL() async {
  const url = 'https://geniemoneyy.com/terms/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
// _launch2URL() async {
//   const url = 'http://165.22.219.135/genie_money/index.php/admin';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

_launch2URL() async {
  const url = 'https://geniemoneyy.com/login/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
