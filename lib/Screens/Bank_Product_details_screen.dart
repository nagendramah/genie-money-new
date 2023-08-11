import 'package:flutter/material.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Utils/utils.dart';

import 'check_customer_exists.dart';

class BankProductDetailsScreen extends StatefulWidget {
  // const BankProductDetailsScreen({Key? key}) : super(key: key);
  var bankName;
  BankProductDetailsScreen({required this.bankName});
  @override
  State<BankProductDetailsScreen> createState() =>
      _BankProductDetailsScreenState();
}

class _BankProductDetailsScreenState extends State<BankProductDetailsScreen> {
  List<HomePageList> homepageList = [];
  @override
  void initState() {
    // print(  homepageList[tempindex].type,);
    if (widget.bankName == "Axis Bank Savings Account") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Axis Bank",
            image: "images/AxisBankSavingsAccount1.jpg",
            type: "saving_account" ),
        HomePageList(
            id: "102",
            name: "Axis Bank",
            image: "images/AxisBankSavingsAccount2.jpg",
            type: "saving_account"),
        HomePageList(
            id: "103",
            name: "Axis Bank",
            image: "images/AxisBankSavingsAccount3.jpg",
            type: "saving_account"),
        HomePageList(
            id: "102",
            name: "Axis Bank",
            image: "images/AxisBankSavingsAccount3copy.jpg",
            type: "saving_account"),
        HomePageList(
            id: "103",
            name: "Axis Bank",
            image: "images/AxisBankSavingsAccount4.jpg",
            type: "saving_account"),
        HomePageList(
            id: "102",
            name: "Axis Bank",
            image: "images/AxisBankSavingsAccount5.jpg",
            type: "saving_account"),
        HomePageList(
            id: "103",
            name: "Axis Bank",
            image: "images/AxisBankSavingsAccount6.jpg",
            type: "saving_account"),
        HomePageList(
            id: "103",
            name: "Axis Bank",
            image: "images/AxisBankSavingsAccount7.jpg",
            type: "saving_account"),
      ];
    }else if(widget.bankName == "Axis Bank Current Account"){
      homepageList = [
        HomePageList(
            id: "103",
            name: "Axis Bank",
            image: "images/AxisBankSavingsAccount7.jpg",
            type: "current_account"),
      ];
    }
    else if(widget.bankName == "IndusInd Savings Account"){
      homepageList = [
        HomePageList(
            id: "103",
            name: "IndusInd",
            image: "images/WhatsApp Image 2023-08-03 at 3.59.12 PM.jpeg",
            type: "saving_account"),
      ];
    }

    else if(widget.bankName == "Bandhan"){
     homepageList = [HomePageList(id: "101", name: "Bandhan Bank", image: "images/BandhanBank1.png", type: "saving_account")];
    }
    else if (widget.bankName == "Kotak Mojo Platinum Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotakpro1.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak2.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak3.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak4.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak5.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak6.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak7.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak8.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak9.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak10.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak11.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak12.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak13.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak14.jpg",
            type: "saving_account"),
      ];
    } else if (widget.bankName == "AU SwipeUp Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "AU Small Finance Bank",
            image: "images/Aupro1.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "AU Small Finance Bank",
            image: "images/Aupro2.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "AU Small Finance Bank",
            image: "images/Aupro3.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "AU Small Finance Bank",
            image: "images/Aupro4.jpg",
            type: "saving_account"),
      ];
    } else if (widget.bankName == "YES BANK Savings Account") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Yes Bank",
            image: "images/Yespro1.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Yes Bank",
            image: "images/Yespro2.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "PNB Housing Finance",
            image: "images/Yespro3.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "PNB Housing Finance",
            image: "images/Yespro4.jpg",
            type: "saving_account"),
      ];
    } else if (widget.bankName == "FI") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "FI Money",
            image: "images/federalbanksavingsaccount.jpg",
            type: "saving_account"),
        // HomePageList(
        //     id: "101", name: "FI Money", image: "images/Fipro2.jpg",type: "saving_account"),
        // HomePageList(
        //     id: "101", name: "FI Money", image: "images/Fipro3.jpg",type: "saving_account"),
        // HomePageList(
        //     id: "101", name: "FI Money", image: "images/Fipro4.jpg",type: "saving_account"),
      ];
    }
     else if (widget.bankName == "Kotak 811 Savings Account") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotakpro1.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak2.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak3.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak4.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak5.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak6.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak7.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak8.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak9.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak10.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak11.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak12.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak13.jpg",
            type: "saving_account"),
        HomePageList(
            id: "101",
            name: "Kotak Mahindra Bank",
            image: "images/kotak14.jpg",
            type: "saving_account"),
      ];
    }
    else if (widget.bankName == "AU Bank Savings Account") {
       homepageList = [
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC3Altura.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC4Altura.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC5Altura.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC6Altura.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC7.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC8Corporate.jpg",
            type: "Credit Card"),
      ];
    }
    
     else if (widget.bankName == "icicidirect") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "ICICI Direct",
            image: "images/ICICIDirectDemat.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "ICICI Direct",
            image: "images/ICICIDirectDemat4.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "ICICI Direct",
            image: "images/ICICIDirectDemat7.jpg",
            type: "demat_account"),
      ];
    }else if(widget.bankName == "Grow") {
      homepageList = [
        HomePageList(id: "101", name: "Grow", image: "images/GrowwDemat.jpg", type: "demat_account")
      ];
    }
    else if(widget.bankName == "Edelweiss"){
      homepageList = [
        HomePageList(id: "101", name: "Edelweiss Demat", image: "images/Edelweiss.jpg", type: "demat_account")
      ];
    }
    else if(widget.bankName == "YessSecure"){
      homepageList = [
        HomePageList(id: "101", name: "Yes Securities Demat", image: "images/YesSecure.jpg", type: "demat_account")
      ];
    }
    else if(widget.bankName == "hdfcsecurities"){
      homepageList = [
        HomePageList(id: "101", name: "HDFC securities Demat", image: "images/HDFCSecure.jpeg", type: "demat_account")
      ];
    }

    else if(widget.bankName == "navimf"){
      homepageList = [
        HomePageList(id: "101", name: "Navi Demat", image: "images/NaviDemat.jpg", type: "demat_account")
      ];
    }
    else if (widget.bankName == "Kotak League Platinum Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDemat.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDemat2.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDemat4.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDemat5.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDemat6.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDematAccount.png",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KoyakSecuritiesDemat7.jpg",
            type: "demat_account"),
      ];
    } else if (widget.bankName == "Kotak Securities") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDemat.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDemat2.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDemat4.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDemat5.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDemat6.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KotakSecuritiesDematAccount.png",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Kotak Securities",
            image: "images/KoyakSecuritiesDemat7.jpg",
            type: "demat_account"),
      ];
    }
    
    
    
    else if (widget.bankName == "Nuvama") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Nuvama",
            image: "images/NuvamaDemat.png",
            type: "demat_account"),
      ];
    } else if (widget.bankName == "PayTMMoney") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Pay TM Money",
            image: "images/PayTMMoneyDemat1.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Pay TM Money",
            image: "images/PayTMMoneyDemat2.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Pay TM Money",
            image: "images/PayTMMoneyDemat4.jpg",
            type: "demat_account"),
      ];
    } else if (widget.bankName == "AnandRathi") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "AnandRathi",
            image: "images/AnandDemat.jpg",
            type: "demat_account"),

      ];
    } else if (widget.bankName == "Alice") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Alice Blue Demat Account",
            image: "images/AliceBlueDemat.jpg",
            type: "demat_account"),

      ];
    }else if (widget.bankName == "BOID") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Bank of India Demat Account",
            image: "images/BankOfIndia.png",
            type: "demat_account"),

      ];
    } else if (widget.bankName == "LXME Demat Account") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "LXME",
            image:"images/LXME Demat Account Banner.jpg",
            type: "demat_account"),

      ];
    } 
     else if (widget.bankName == "SBI Securities") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "SBI Securities",
            image: "images/SBI Securities Banner.jpg",
            type: "demat_account"),

      ];
    }
     else if (widget.bankName == "Samco Securities") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Samco Demat Account",
            image: "images/SamcoDemat.jpg",
            type: "demat_account"),

      ];
    }else if (widget.bankName == "MStock") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "MStock",
            image: "images/MStockDemat1.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "MStock",
            image: "images/MStockDemat2.jpg",
            type: "demat_account"),
      ];
    } else if (widget.bankName == "AngelOne Demat Account") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Angel One",
            image: "images/AngelOneDemat1.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "Angel One",
            image: "images/AngelOneDemat2.jpg",
            type: "demat_account"),
      ];
    } else if (widget.bankName == "ZerodhaKite") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "ZerodhaKite",
            image: "images/AngelOneDemat1.jpg",
            type: "demat_account"),
        HomePageList(
            id: "101",
            name: "ZerodhaKite",
            image: "images/AngelOneDemat2.jpg",
            type: "demat_account"),
      ];
    } else if (widget.bankName == "IIFL") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "IIFL",
            image: "images/IIFLSecuritiesDemat.jpg",
            type: "demat_account"),
      ];
    } else if (widget.bankName == "5Pasia") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "5Pasia",
            image: "images/5PaisaDemat.jpg",
            type: "demat_account"),
      ];
    }else if(widget.bankName == "Upstox") {
      homepageList = [
        HomePageList(id: "101", name: "Upstox Demat Account", image: "images/UpstoxDemat.jpg", type: "demat_account")
      ];
    } else if (widget.bankName == "HDFC Bank Credit Card" || widget.bankName == "HDFC Credit Card - Offline") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "HDFC Bank",
            image: "images/HDFCBankCC.png",
            type: "Credit Card"),
      ];
    }
    /* else if(widget.bankName=="Frecharge Pay Later"){
      /Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration(bankname: homepageList[tempindex].name, leadtype: 'personal loan' ,)));

      */ /* homepageList = [
        HomePageList(
            id: "8", name: "Frecharge Pay Later", image: "images/freechargepaylater.png"),

      ];*/ /*
    }*/
    else if(widget.bankName == "Galaxy Card"){
homepageList = [
  HomePageList(id: "101", name: "Galaxy Credit Card", image: "images/GalaxyCreditCard.png", type: "Credit Card")
];
    }
    else if (widget.bankName == "IDFC First WOW Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "IDFC Bank",
            image: "images/IDFCBankClassicCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC Bank",
            image: "images/IDFCBankClassicCC1.jpg",
            type: "Credit Card"),
      ];
    } else if (widget.bankName == "IDFC Bank Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankCC3.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankCC4.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankCC5.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankMilleniaCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankMilleniaCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankSelectCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankSelectCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankSelectCC3.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankSelectCC4.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IDFC First",
            image: "images/IDFCFirstBankWOWCreditCard.jpg",
            type: "Credit Card"),
      ];
    } else if (widget.bankName == "IndusInd Bank Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "IndusInd Bank",
            image: "images/IndusIndBankCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IndusInd Bank",
            image: "images/IndusIndBankCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IndusInd Bank",
            image: "images/IndusIndBankCC3.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "IndusInd Bank",
            image: "images/IndusIndBankPlatinumCreditCard.jpg",
            type: "Credit Card")
      ];
    } else if (widget.bankName == "SBI SimplyCLICK Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "SBI Cards",
            image: "images/SBI Simply Click Credit Card Banner.jpg",
            type: "Credit Card"),
     
      ];
    }
    else if (widget.bankName == "SBI SimplySave Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "SBI Cards",
            image: "images/WhatsApp Image 2023-08-03 at 2.07.11 PM.jpeg",
            type: "Credit Card"),
     
      ];
    }
     else if (widget.bankName == "SBI IRCTC Platinum Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "SBI Cards",
            image: "images/WhatsApp Image 2023-08-03 at 2.11.50 PM.jpeg",
            type: "Credit Card"),
     
      ];
    }
    
    
    
    
     else if (widget.bankName == "Yes Bank Credit Card" || widget.bankName == "Yes Bank Credit Card - Offline") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Yes Bank",
            image: "images/YesBankAmazonCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "Yes Bank",
            image: "images/YesBankAmazonCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "Yes Bank",
            image: "images/YesBankCC1.jpg",
            type: "Credit Card"),
      ];
    } else if (widget.bankName == "Standard Chartered Credit Cards" || widget.bankName == "Standard Chartered Credit Cards - Offline") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Standard Chartered",
            image: "images/StandardCharteredCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "Standard Chartered",
            image: "images/StandardCharteredCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "Standard Chartered",
            image: "images/StandardCharteredDigiSmartCC.jpg",
            type: "Credit Card"),
      ];
    } else if (widget.bankName == "Axis Bank Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankCC3.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankCC4.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankCC5.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankCC6.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankFlipkartCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankFlipkartCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankFlipKartCC3.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankIndianOilCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankIndianOilCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankIndianOilCC6.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankMyZoneCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankMyZoneCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankMyZoneCC3.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankSavingsAccount5cc.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankSavingsAccount6cc.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AXIS",
            image: "images/AxisBankSavingsAccount7cc.jpg",
            type: "Credit Card"),
      ];
    } else if (widget.bankName == "Americancredit") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "American Express",
            image: "images/AMEXMembershipRewardsCC.png",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "American Express",
            image: "images/AMEXPlatinumCC.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "American Express",
            image: "images/AMEXPlatinumReserveCC.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "American Express",
            image: "images/AMEXPlatinumTravelCC.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "American Express",
            image: "images/AMEXSmartEarnCC.jpg",
            type: "Credit Card"),
      ];
    }
     else if(widget.bankName=="Aspire Credit Card"){
      homepageList = [
        HomePageList(
            id: "101", name: "Aspire", image: "images/Aspire Credit Line 1.jpg",type:"Credit Card"),
        // HomePageList(
        //     id: "101", name: "Aspire", image: "images/AMEXPlatinumCC.jpg",type:"Credit Card"),
        // HomePageList(
        //     id: "101", name: "Aspire", image: "images/AMEXPlatinumReserveCC.jpg",type:"Credit Card"),
        // HomePageList(
        //     id: "101", name: "Aspire", image: "images/AMEXPlatinumTravelCC.jpg",type:"Credit Card"),
        // HomePageList(
        //     id: "101", name: "Aspire", image: "images/AMEXSmartEarnCC.jpg",type:"Credit Card"),


      ];
    }
    else if (widget.bankName == "AU Bank Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC3Altura.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC4Altura.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC5Altura.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC6Altura.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC7.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "AU Small Fin Bank",
            image: "images/AUSFBCC8Corporate.jpg",
            type: "Credit Card"),
      ];
    }else if(widget.bankName == "RBL Platinum Maxima Plus Credit Card"){
homepageList = [
  HomePageList(
      id: "101",
      name: "RBL Credit Card",
      image: "images/RBLCreditCard.jpg",
      type: "Credit Card"),
];

 } else if(widget.bankName == "Kotak IOCL Rupay Credit Card"){
   homepageList = [
   HomePageList(
      id: "101",
      name: "RBL Credit Card",
      image: "images/Kotak IOCL Rupay Credit Card.jpg",
      type: "Credit Card"),
];
 }
 else if(widget.bankName == "Kotak PVR Platinum Credit Card"){
   homepageList = [
   HomePageList(
      id: "101",
      name: "RBL Credit Card",
      image: "images/WhatsApp Image 2023-08-03 at 2.15.52 PM.jpeg",
      type: "Credit Card"),
];
 }
    
    else if(widget.bankName == "AUGMONT GOLD SIP"){
homepageList = [
  HomePageList(
      id: "101",
      name: "AUGMONT GOLD SIP",
      image: "images/Augmont Gold SIP Banner.png",
      type: "Credit Card"),
];

    }
    else if(widget.bankName == "Funds India "){
homepageList = [
  HomePageList(
      id: "101",
      name: "Funds India ",
      image: "images/Fundsindia Mutual Fund.png",
      type: "Credit Card"),
];

    }
    else if(widget.bankName == "LenDenClub"){
homepageList = [
  HomePageList(
      id: "101",
      name: "LenDenClub",
      image: "images/LendenClub Alternative Investment.png",
      type: "Credit Card"),
];

    }
    
    else if (widget.bankName == "BOB Lifetime Free Credit Card"/*"BOBcredit"*/) {
      homepageList = [
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBCC3.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBHPCLCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBHPCLCC2.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBHPCLCC3.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBHPCLCC4.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBHPCLCC5.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBHPCLCC6.png",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBHPCLCC7.png",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBHPCLCC8.png",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBSnapDealCC1.png",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "BOB",
            image: "images/BOBSnapDealCC2.png",
            type: "Credit Card"),
      ];
    } else if (widget.bankName == "Bajaj RBL Credit Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Bajaj RBL",
            image: "images/BajajRBLBingeSuperCard1.png",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "Bajaj RBL",
            image: "images/BajajRBLPlatinumSuperCard1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "Bajaj RBL",
            image: "images/BajajRBLSuperCard3.jpg",
            type: "Credit Card"),
      ];
    }
 else if (widget.bankName == "Bajaj Finserv Securities") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Bajaj RBL",
            image: "images/BajajRBLBingeSuperCard1.png",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "Bajaj RBL",
            image: "images/BajajRBLPlatinumSuperCard1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "Bajaj RBL",
            image: "images/BajajRBLSuperCard3.jpg",
            type: "Credit Card"),
      ];
    }

     else if (widget.bankName == "GILD Card") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "GILD",
            image: "images/GildCC1.jpg",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "GILD",
            image: "images/GildCC2.png",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "GILD",
            image: "images/GildCC3.png",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "GILD",
            image: "images/GildCC4.png",
            type: "Credit Card"),
        HomePageList(
            id: "101",
            name: "GILD",
            image: "images/GildCC5.png",
            type: "Credit Card"),
      ];
    }

    ///Credit LIne Images

    else if (widget.bankName == "Bajaj Emi Card" || widget.bankName == "Bajaj Emi Card - PAN India") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Bajaj EMI Card",
            image: "images/BajajRBLBingeSuperCard1.png",
            type: "credit_lines"),
        HomePageList(
            id: "101",
            name: "Bajaj EMI Card",
            image: "images/BajajRBLPlatinumSuperCard1.jpg",
            type: "credit_lines"),
        HomePageList(
            id: "101",
            name: "Bajaj EMI Card",
            image: "images/BajajRBLSuperCard3.jpg",
            type: "credit_lines"),
      ];
    } else if (widget.bankName == "Freecharge Pay Later") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "FreeCharge Pay Later",
            image: "images/BajajRBLBingeSuperCard1.png",
            type: "credit_lines"),
        HomePageList(
            id: "101",
            name: "FreeCharge Pay Later",
            image: "images/BajajRBLPlatinumSuperCard1.jpg",
            type: "credit_lines"),
        HomePageList(
            id: "101",
            name: "FreeCharge Pay Later",
            image: "images/BajajRBLSuperCard3.jpg",
            type: "credit_lines"),
      ];
    } else if (widget.bankName == "Money Tap") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "MoneyTap",
            image: "images/MoneyTapPersonalLoan1.jpg",
            type: "credit_lines"),
        HomePageList(
            id: "101",
            name: "MoneyTap",
            image: "images/MoneyTapPersonalLoan2.jpg",
            type: "credit_lines"),
      ];
    }else if(widget.bankName == "Privo Instant Credit Line App"){
      homepageList = [
        HomePageList(
            id: "101",
            name: "Privo Instant",
            image: "images/PrivoCreditLineLoan.jpg",
            type: "personal_loan"),
      ];
    }

    ///Loan Images
    else if (widget.bankName == "ICICI Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "ICICI Bank",
            image: "images/ICICIBankPersonalLoan.jpg",
            type: "personal_loan"),
      ];
    }//Personal
    else if (widget.bankName == "IndusInd Bank Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "IndusInd Bank",
            image: "images/IndusIndBankInstantPersonalLoan.jpg",
            type: "personal_loan"),
      ];
    } else if(widget.bankName == "Muthoot PL"){
      homepageList = [
        HomePageList(id: "101", name: "Muthoot Personal Loan", image: "images/muthootPL.jpg", type: "personal_loan")
      ];
    }else if(widget.bankName == "Zype Personal Loan"){
      homepageList = [
        HomePageList(id: "101", name: "Zype Personal Loan", image: "images/zypePL.png", type: "personal_loan")
      ];
    }else if (widget.bankName == "IDFCbankloan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "IDFC Bank",
            image: "images/IDFCFirstBankPersonalLoan.jpg",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "InstaMoney Personal loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "InstaMoney",
            image: "images/InstaMoneyPersonalLoan1.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "InstaMoney",
            image: "images/InstaMoneyPersonalLoan2.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "InstaMoney",
            image: "images/InstaMoneyPersonalLoan3.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "InstaMoney",
            image: "images/InstaMoneyPersonalLoan4.jpg",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "mPokket Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "MPocket",
            image: "images/MPokketPersonalLoan1.png",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "MPocket",
            image: "images/MPocketPersonalLoan2.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "MPocket",
            image: "images/MPocketPersonalLoan3.jpg",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "CASHe Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "CASHe",
            image: "images/CashEPersonalLoan.png",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "Fibe Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Fibe",
            image: "images/FibePersonalLoan1.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Fibe",
            image: "images/FibePersonalLoan2.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Fibe",
            image: "images/FibePersonalLoan3.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Fibe",
            image: "images/FibePersonalLoan4.jpg",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "Upwards Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Upwards",
            image: "images/UpwardsPersonalLoan1.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Upwards",
            image: "images/UpwardsPersonalLoan2.jpg",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "NIRA Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Nira",
            image: "images/NiraPersonalLoan1.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Nira",
            image: "images/NiraPersonalLoan2.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Nira",
            image: "images/NiraPersonalLoan3.jpg",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "True Balance Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "True Balance",
            image: "images/TrueBalancePersonalLoan1.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "True Balance",
            image: "images/TrueBalancePersonalLoan2.jpg",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "Prefr Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Prefr",
            image: "images/PrefrPersonalLoan1.png",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Prefr",
            image: "images/PrefrPersonalLoan2.png",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "MoneyWide Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Money Wide",
            image: "images/PrefrPersonalLoan1.png",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Money Wide",
            image: "images/PrefrPersonalLoan2.png",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "KreditBee") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "KreditBee",
            image: "images/KreditBeePersonalLoan1.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "KreditBee",
            image: "images/KreeditPersonalLoan2.png",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "MoneyView") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "MoneyView",
            image: "images/MoneyViewPersonalLoan.png",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "PaySensebankloan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "PaySense",
            image: "images/PaysensePersonalLoan.jpg",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "SmartCoin Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Smart Coin",
            image: "images/SmartCoinPersonalLoan1.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Smart Coin",
            image: "images/SmartCoinPersonalLoan2.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Smart Coin",
            image: "images/SmartCoinPersonalLoan3.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Smart Coin",
            image: "images/SmartCoinPersonalLoan4.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Smart Coin",
            image: "images/SmartCoinPersonalLoan5.jpg",
            type: "personal_loan"),
        HomePageList(
            id: "101",
            name: "Smart Coin",
            image: "images/SmartCoinPersonalLoan6.jpg",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "Finnable Personal Loan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "Finnable",
            image: "images/FinnablePersonalLoan.jpg",
            type: "personal_loan"),
      ];
    } else if (widget.bankName == "PayMebankloan") {
      homepageList = [
        HomePageList(
            id: "101",
            name: "PayMe",
            image: "images/PayMePersonalLoan.png",
            type: "personal_loan"),
      ];
    }

    super.initState();
  }

  var tempindex;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:navyBlueColor ,
        title: const Text(
          "Product Details",
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
      body: ListView.builder(
        itemCount: homepageList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          tempindex = index;
          return Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Image(
              image: AssetImage(homepageList[index].image),
              width: width,
              height: height / 2,
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
          
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  CheckCustomerExists(
                        bankname: homepageList[tempindex].name,
                        leadtype: homepageList[tempindex].type,
                        account: homepageList[tempindex].type,
                      )));
            },
             style: ElevatedButton.styleFrom(
              backgroundColor: navyBlueColor, // Set your desired background color here
            ),
            child: const Text(
              "Apply Now",
              style: TextStyle(
                color:kWhite,fontSize: 20,
              ),
            ),
            
          )),
    );
  }
}
