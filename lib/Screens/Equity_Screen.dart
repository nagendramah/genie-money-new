import 'package:flutter/material.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/Bank_Product_details_screen.dart';
import 'package:genie_money/Screens/Credit_Card_Lead_Generation_Page.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/silver_delegate.dart';

class EquityScreen extends StatefulWidget {
 // const EquityScreen({Key? key}) : super(key: key);
String InvestmentType;
EquityScreen({required this.InvestmentType});
  @override
  State<EquityScreen> createState() => _EquityScreenState();
}

class _EquityScreenState extends State<EquityScreen> {
  late List<HomePageList> homepageList;
  String type="";
  @override
  void initState() {
    // if(widget.InvestmentType=="mutualfund"){
    //   homepageList = [
    //     HomePageList(
    //         id: "112", name: "Funds India Navi", image: "images/fundsindia.jpeg", type: 'mutual_fund'),


    //   ];
    // }else if(widget.InvestmentType=="SIP"){
    //   homepageList = [
    //     HomePageList(
    //         id: "112", name: "SmallCase", image: "images/smallcase.jpeg",type: "sip"),


    //   ];
    // }
   // else 
    if(widget.InvestmentType=="Direct Equity"){
      homepageList = [
        HomePageList(
            id: "112", name: "SmallCase", image: "images/smallcase.jpeg",type: "Alternative investment"),

  // HomePageList(
  //           id: "112", name: "AUGMONT GOLD SIP", image: "images/Augmont Gold.png",type: "Alternative investment"),
  //             HomePageList(
  //           id: "112", name: "LenDenClub", image: "images/LenDenClub.jpg",type: "Alternative investment"),
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
          "Direct Equity",
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
                      //  Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) =>
                      //               BankProductDetailsScreen(
                      //                 bankName: homepageList[index].name,
                      //               )));
                        {
                          showDialog(context: context, builder: (context){
                            return AlertDialog(

                              backgroundColor:  kWhite,

                              content: Container(
                                height: 111,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Getting Activated Soon ",
                                      style: TextStyle(color: navyBlueColor, fontSize: 18),
                                    ),
                                    Container(

                                      margin: const EdgeInsets.only(top: 40,bottom: 10),
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
                                        //  const Color(0xFFFFAE00),
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
                                  width: 80.0,
                                  height: 80.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0),
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
