
import 'package:flutter/material.dart';
import 'package:genie_money/Screens/broker_account_screen.dart';
import 'package:genie_money/utils/silver_delegate.dart';

import 'Model/home_menu_list_model.dart';
class StockPage extends StatefulWidget {
  final String name;

  const StockPage({Key? key, required this.name}) : super(key: key);

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  late List<HomePageList> homepageList;
  late List<String> brokers;

      bool leprechaunMode = false;
  @override
  void initState() {

    brokers = [
      "fivepaisa",
      "iifl",
      "kite",
      "kotak"

    ];
    if(widget.name=="Corporate FDs")
      {
        homepageList = [
          HomePageList(
              id: "103", name: "Bajaj Finserv", image: "images/bajajfinance.png", type: ''),



        ];
      }
    else{
      homepageList = [
        HomePageList(
            id: "8", name: "Kotak Securities", image: "images/GM-kotak.png", type: 'demat_account'),
        HomePageList(
            id: "8", name: "IIFL", image: "images/iffl.png", type: 'demat_account'),
        HomePageList(
            id: "8", name: "5Pasia", image: "images/fivepaisa.png", type: 'demat_account'),
        HomePageList(
            id: "5", name: "Zerodha Kite", image: "images/GM-Kite-2.png", type: 'demat_account'),

        HomePageList(
            id: "7", name: "ICICI Direct", image: "images/GM-ICICI.png", type: 'demat_account'),


        HomePageList(
            id: "2", name: "Angel One", image: "images/GM_Angle1.png", type: 'demat_account'),
        HomePageList(
            id: "4", name: "Dhan", image: "images/GM-Dhan.png", type: 'demat_account'),
        HomePageList(
            id: "3", name: "Fyers", image: "images/GM-Fyres-2.png", type: 'demat_account'),

        HomePageList(
            id: "6", name: "AliceBlue", image: "images/GM_Alice1-2.png", type: 'demat_account'),



      ];
    }


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title:  Text(
          widget.name,
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
                    //ScgatewayFlutterPlugin.leadGen(name, email, contact, pincode)
                      //ScgatewayFlutterPlugin.leadGen("sunil", "dharmekarsunil@gmail.com", "9004113634", "");

                       //  ScgatewayFlutterPlugin.leadGenWithStatus("sunil", "dharmeukarsunil@gmail.com", "9967754392");
                      //  open.leadGen(name, email, contact,pincode);
                      //  ScgatewayFlutterPlugin.logoutUser();
                        if (homepageList[index].name == "5Pasia") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BrokerAccountPage(bankname: '5Pasia',)));

                        }
                     else   if (homepageList[index].name == "Kotak Securities") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BrokerAccountPage( bankname: 'Kotak Securities',)));

                        }

                        else if (homepageList[index].name == "IIFL") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BrokerAccountPage(bankname: 'IIFL')));

                        }
                        else   if (homepageList[index].name == "Zerodha Kite") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  BrokerAccountPage(bankname: 'Zerodha Kite',)));

                        }
                        else{
                            showDialog(context: context, builder: (context){
                          return AlertDialog(

                            backgroundColor:  Color(0xFF3A3A3A),

                            content: Container(
                              height: 111,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Getting Activated Shortly ",
                                    style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
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
                      /*  showDialog(context: context, builder: (context){
                          return AlertDialog(

                            backgroundColor:  Color(0xFF3A3A3A),

                            content: Container(
                              height: 111,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Getting Activated Shortly ",
                                    style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
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
*/

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


}

