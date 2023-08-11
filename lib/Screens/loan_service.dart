import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Screens/Credit_Lines_Banks_screen.dart';
import 'package:genie_money/Screens/Traditional_Personal_Loan.dart';
import 'package:genie_money/Screens/install_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/home_menu_list_model.dart';
import '../utils/silver_delegate.dart';

class LoanService extends StatefulWidget {
  const LoanService({Key? key}) : super(key: key);
  // String account;
  // LoanService({required this.account});

  @override
  State<LoanService> createState() => _LoanServiceState();
}

class _LoanServiceState extends State<LoanService> {
  List<HomePageList> homepageList = [];
  String type="";
  @override
  void initState() {
    homepageList = [
      ///cominting below codel sunill
     /* HomePageList(
          id: "9", name: "Instant Personal Loan", image: "images/GM-InstantPersonalloan.png"),
      HomePageList(
          id: "12", name: "Traditional Personal Loan", image: "images/GM-ProfessionalLoan.png"),
      HomePageList(
          id: "11", name: "Business/Professional Loan", image: "images/bloan.png"),
      HomePageList(
          id: "10", name: "Buy Now Pay Later", image: "images/consumer_loan.png"),*//*
      HomePageList(
          id: "11", name: "Business/Professional Loan", image: "images/bloan.png"),*//*

      HomePageList(
          id: "77", name: "Invoice Discounting", image: "images/discounting.png"),
      HomePageList(
          id: "78", name: "EMI Calculator", image: "images/GM-EMICalculator.png"),*/



      ///adding below code
       HomePageList(
                 id: "9", name: "Credit Lines", image: "images/Credit Line.png",type: "credit_lines"),
             HomePageList(
                 id: "12", name: "Personal Loan", image: "images/Personal Loan.png",type: "personal_loan"),

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
        title: Text(
          type=="Customer"?"Loan Services":"Loan Services",
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
                const SizedBox(
                        height: 50,
                      ),
              const Text(
              "Select an Loan Services",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: navyBlueColor ),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 50.0,left: 50,right: 50),
                child: GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 1,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    height: height * 0.22,
                  ),
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        if(homepageList[index].name == "Traditional Personal Loan") {
                          Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      TraditionalPersonalLoan()));
                        } else if(homepageList[index].name == "Personal Loan") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreditLinesBankScreen(loanType:"Personal Loan",)));
                        } else if(homepageList[index].name == "Credit Lines") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreditLinesBankScreen(loanType:"Credit Lines",)));
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreditLinesBankScreen(loanType:"Credit Lines",)));*/
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
                                  width: 70.0,
                                  height: 70.0,
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

  void _alertDialog() {
    showDialog(context: context, builder: (context){

      return AlertDialog(

        backgroundColor:  Color(0xFF3A3A3A),

        content: Container(
          height: 100,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin:  EdgeInsets.only(top: 12,),

                child: Text(
                  "Getting Activated Soon",
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
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
                        Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight:
                        FontWeight.bold),
                  ),
                  style:
                  ElevatedButton.styleFrom(
                    fixedSize:
                    Size(30, 80.0),


                    primary:
                    const Color(0xFFFFAE00),
                    shadowColor:
                    const Color(0xFFFFAE00),
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

  getUserType()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = (prefs.get("type") ?? "Customer").toString();

    });
    // if(type=="Customer"){
    //   homepageList = [
    //     HomePageList(
    //         id: "9", name: "Instant Personal Loan", image: "images/GM-InstantPersonalloan.png"),
    //     HomePageList(
    //         id: "12", name: "Traditional Personal Loan", image: "images/GM-ProfessionalLoan.png"),
    //     HomePageList(
    //         id: "11", name: "Business/Professional Loan", image: "images/bloan.png"),
    //     HomePageList(
    //         id: "10", name: "Buy Now Pay Later", image: "images/consumer_loan.png"),
    //
    //
    //     HomePageList(
    //         id: "77", name: "Invoice Discounting", image: "images/discounting.png"),
    //     HomePageList(
    //         id: "78", name: "EMI Calculator", image: "images/GM-EMICalculator.png"),
    //
    //   ];
    //  /* homepageList = [
    //     HomePageList(
    //         id: "9", name: "Instant Personal Loan", image: "images/instant_loan.png"),
    //     HomePageList(
    //         id: "10", name: "Buy Now Pay Later", image: "images/consumer_loan.png")
    //
    //   ];*/
    // }
    // else if(type == "Retailer" || type == "Distributor" || type == "Super Distributor") {
    //   homepageList = [
    //     HomePageList(
    //         id: "9", name: "Instant Personal Loan", image: "images/GM-InstantPersonalloan.png"),
    //     HomePageList(
    //         id: "12", name: "Traditional Personal Loan", image: "images/GM-ProfessionalLoan.png"),
    //     HomePageList(
    //         id: "11", name: "Business/Professional Loan", image: "images/bloan.png"),
    //     HomePageList(
    //         id: "10", name: "Buy Now Pay Later", image: "images/consumer_loan.png"),
    //     HomePageList(
    //         id: "11", name: "Business/Professional Loan", image: "images/bloan.png"),
    //
    //     HomePageList(
    //         id: "77", name: "Invoice Discounting", image: "images/discounting.png"),
    //     HomePageList(
    //         id: "78", name: "EMI Calculator", image: "images/GM-EMICalculator.png"),
    //
    //   ];
    // }
  }
}
