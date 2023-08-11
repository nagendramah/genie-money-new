import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Screens/bill_payment_screen.dart';
import 'package:genie_money/Utils/utils.dart';

import '../Model/NonBankingFixedDeposit.dart';
import '../Model/home_menu_list_model.dart';
import '../StockPage.dart';
import '../utils/silver_delegate.dart';
import 'SavingAccount.dart';

class BankServices extends StatefulWidget {
  const BankServices({Key? key}) : super(key: key);

  @override
  State<BankServices> createState() => _BankServicesState();
}

class _BankServicesState extends State<BankServices> {
  late List<HomePageList> homepageList;

  @override
  void initState() {
    homepageList = [
      HomePageList(
          id: "1",
          name: "Savings Account",
          image: "images/Savings Account.png", type: ''),

      HomePageList(
          id: "2", name: "Current Account", image: "images/Current Account.png", type: ''),



      ///comentting below code sunil
      /*HomePageList(
          id: "2", name: "Bank Fixed Deposit", image: "images/current_account_gm.png"),
      HomePageList(
          id: "3", name: "Bank Recurring Deposit", image: "images/bankreccuring.png"),
      HomePageList(
          id: "3", name: "Non Banking Fixed Deposit",  image: "images/bfixed.png"),*/


    ];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: const Text(
          "Accounts",
          style: TextStyle(
            color:  kWhite ,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhite ,
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
              "Select an Account",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: navyBlueColor ),
            ),


            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50 , vertical: 50 ),
                
                child: GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 1,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                    height: height * 0.25,
                    
                  ),
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        if(homepageList[index].name == "Current Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SavingAccount(banktype: 3, account: "Current Account",)));
/*
                          _alertDialog();
*/
                        }

                        else if(homepageList[index].name == "Savings Account") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SavingAccount(banktype: 13, account: 'Savings Account',)));
/*
                          _alertDialog();
*/


                        }
                        else if(homepageList[index].name == "Non Banking Fixed Deposit") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NonBankingFixed()));
/*
                          _alertDialog();
*/


                        }
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
                        color:navyBlueColor ,
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
                                    color:kWhite,
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

        backgroundColor:  const Color(0xFF3A3A3A),

        content: Container(
          height: 100,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin:  const EdgeInsets.only(top: 12,),

                child: const Text(
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
                    const Size(30, 80.0),


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

}
