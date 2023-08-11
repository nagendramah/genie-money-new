import 'package:flutter/material.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
// ignore: unused_import
import 'package:genie_money/Screens/broker_account_screen.dart';
import 'package:genie_money/utils/silver_delegate.dart';

import 'Credit_Card_Lead_Generation_Page.dart';
class TraditionalPersonalLoan extends StatefulWidget {
  const TraditionalPersonalLoan({Key? key}) : super(key: key);

  @override
  State<TraditionalPersonalLoan> createState() => _TraditionalPersonalLoanState();
}

class _TraditionalPersonalLoanState extends State<TraditionalPersonalLoan> {
   List<HomePageList> homepageList = [];


   var tempindex;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "Traditional Personal loan",
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
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {

                        if (homepageList[index].name == "HDFC Bank") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration(bankname: homepageList[index].name, leadtype: 'personal loan', account:  homepageList[tempindex].type,)));

                        }
                        else   if (homepageList[index].name == "ICICI Bank") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'personal loan', account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "Bajaj RBL") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'personal loan', account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "Axis Bank") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'personal loan',account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "Standard Chartered") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'personal loan', account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "SBI Bank") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'personal loan',account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "AU Finance") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'personal loan', account:  homepageList[tempindex].type,)));

                        }  else   if (homepageList[index].name == "Yes Bank") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'personal loan',account:  homepageList[tempindex].type, )));

                        }  else   if (homepageList[index].name == "IndusInd") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'personal loan',account:  homepageList[tempindex].type, )));

                        }else   if (homepageList[index].name == "Citi Bank (Pune & Mumbai)") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration( bankname: homepageList[index].name, leadtype: 'personal loan',account:  homepageList[tempindex].type,)));

                        }
else{
                          _alertDialog();

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
                                  image: AssetImage(homepageList[index].image),
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0),
                                child: Text(
                                  homepageList[index].name,
                                  style: const TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 15.0,
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
     super.initState();
     homepageList = [

/*      HomePageList(
          id: "2", name: "Axis Bank", image: "images/axis.png"),
      HomePageList(
          id: "3", name: "Yes Bank", image: "images/yesbank.png"),
      HomePageList(
          id: "4", name: "Kotak Bank", image: "images/kotak.png"),
      HomePageList(
          id: "5", name: "IDFC First Bank", image: "images/idfc.png"),
      HomePageList(
          id: "6", name: "ICICI Bank", image: "images/icicibank.png"),
      HomePageList(
          id: "7", name: "Equitus Small Finance Bank", image: "images/equitus.png"),
      HomePageList(
          id: "8", name: "Ujjivan Small Finance Bank ", image: "images/ujjivan.png"),
      HomePageList(
          id: "10", name: "Jana Small Finance Bank", image: "images/jana.png"),
      HomePageList(
          id: "8", name: "Federal Bank", image: "images/federal.png"),*/



       HomePageList(
           id: "8", name: "HDFC Bank", image: "images/hdfc-bank-limited.png", type: 'personal_loan'),
       HomePageList(
           id: "8", name: "ICICI Bank", image: "images/icicibank.png", type: 'personal_loan'),
       HomePageList(
           id: "8", name: "Citi Bank (Pune & Mumbai)", image: "images/Citi.png", type: 'personal_loan'),
       HomePageList(
           id: "8", name: "Bajaj RBL", image: "images/RBL_logo_262.png", type: 'personal_loan'),
       HomePageList(
           id: "8", name: "Axis Bank", image: "images/axis.png", type: 'personal_loan'),
       HomePageList(
           id: "8", name: "Standard Chartered", image: "images/charted.png", type: 'personal_loan'),
       HomePageList(
           id: "8", name: "SBI Bank", image: "images/sbi.png", type: 'personal_loan'),
       HomePageList(
           id: "8", name: "AU Finance", image: "images/au.png", type: 'personal_loan'),
       HomePageList(
           id: "8", name: "Yes Bank", image: "images/yesbank.png", type: 'personal_loan'),
       HomePageList(
           id: "8", name: "IndusInd", image: "images/indusind-bank--600.png", type: 'personal_loan'),

     ];
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
}
