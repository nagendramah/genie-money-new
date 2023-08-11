import 'package:flutter/material.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/Bank_Product_details_screen.dart';
import 'package:genie_money/Screens/Credit_Card_Lead_Generation_Page.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/silver_delegate.dart';

class InvestmentDetailsScreen extends StatefulWidget {
 // const InvestmentDetailsScreen({Key? key}) : super(key: key);
String InvestmentType;
InvestmentDetailsScreen({required this.InvestmentType});
  @override
  State<InvestmentDetailsScreen> createState() => _InvestmentDetailsScreenState();
}

class _InvestmentDetailsScreenState extends State<InvestmentDetailsScreen> {
  late List<HomePageList> homepageList;
  String type="";
  @override
  void initState() {
    if(widget.InvestmentType=="mutualfund"){
      homepageList = [
        HomePageList(
            id: "112", name: "Funds India ", image: "images/fundsindia.png", type: 'mutual_fund'),


      ];
    }else if(widget.InvestmentType=="SIP"){
      homepageList = [
        HomePageList(
            id: "112", name: "SmallCase", image: "images/smallcase.jpeg",type: "sip"),


      ];
    }
    else if(widget.InvestmentType=="Alternative investment"){
      homepageList = [
        HomePageList(
            id: "112", name: "SmallCase", image: "images/smallcase.jpeg",type: "Alternative investment"),


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
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: const Text(
          "Funds India",
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
                    tempindex=index;
                    return GestureDetector(
                      onTap: () async {
                        // if (homepageList[index].name == "Funds India Navi") {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreditCardLeadGeneration(bankname: homepageList[index].name, leadtype: 'personal loan',account:  homepageList[tempindex].type,)));

                        // }
                        //else
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BankProductDetailsScreen(
                                      bankName: homepageList[index].name,
                                    )));
                        
                        // {
                        //   showDialog(context: context, builder: (context){
                        //     return AlertDialog(

                        //       backgroundColor:  Color(0xFF3A3A3A),

                        //       content: Container(
                        //         height: 111,
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //               "Getting Activated Soon ",
                        //               style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                        //             ),
                        //             Container(

                        //               margin: const EdgeInsets.only(top: 40,bottom: 10),
                        //               height: 40,
                        //               width: 100,
                        //               child: ElevatedButton(
                        //                 child: const Text(
                        //                   "Ok",
                        //                   style: TextStyle(
                        //                       color:
                        //                       Color(0xFF111111),
                        //                       fontSize: 15.0,
                        //                       fontWeight:
                        //                       FontWeight.bold),
                        //                 ),
                        //                 style:
                        //                 ElevatedButton.styleFrom(
                        //                   fixedSize:
                        //                   Size(30, 80.0),


                        //                   primary:
                        //                   const Color(0xFFFFAE00),
                        //                   shadowColor:
                        //                   const Color(0xFFFFAE00),
                        //                   shape:
                        //                   RoundedRectangleBorder(
                        //                     borderRadius:
                        //                     BorderRadius.circular(
                        //                         10.0),
                        //                   ),
                        //                 ),
                        //                 onPressed: () async {

                        //                   Navigator.pop(context);

                        //                 }


                        //                 ,
                        //               ),
                        //             ),

                        //           ],




                        //         ),

                        //       ),
                        //     );

                        //   }
                        //   );
                        // }



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
                        color:navyBlueColor,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: Image(
                                  image: AssetImage(homepageList[index].image),
                                  width: 80.0,
                                  height: 80.0,
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
                                  maxLines: 4,
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
