
import 'package:flutter/material.dart';

import '../Model/home_menu_list_model.dart';
import '../utils/silver_delegate.dart';
class NonBankingFixed extends StatefulWidget {
  const NonBankingFixed({Key? key}) : super(key: key);

  @override
  State<NonBankingFixed> createState() => _NonBankingFixed();
}

class _NonBankingFixed extends State<NonBankingFixed> {
  late List<HomePageList> homepageList;

  @override
  void initState() {
    homepageList = [

      HomePageList(
          id: "100", name: "HDFC ltd", image: "images/hdfc.png",type: "nbfc_fd"),
      HomePageList(
          id: "101", name: "PNB Housing Finance", image: "images/pnbhousing.png",type: "nbfc_fd"),
      HomePageList(
          id: "102", name: "Shriram Transport Finance Co", image: "images/shriram.png",type: "nbfc_fd"),
      HomePageList(
          id: "103", name: "Bajaj Finserv", image: "images/bajajfinance.png",type: "nbfc_fd"),


    ];

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
        title: const Text(
          "Non Banking Fixed Deposit",
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
                    crossAxisCount: 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    height: height * 0.25,
                  ),
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        _alertDialog();




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
