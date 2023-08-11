import 'package:flutter/material.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/utils/silver_delegate.dart';


class SavingAccount extends StatefulWidget {
  const SavingAccount({Key? key}) : super(key: key);

  @override
  State<SavingAccount> createState() => _SavingAccountState();
}

class _SavingAccountState extends State<SavingAccount> {
  late List<HomePageList> homepageList;

  @override
  void initState() {
    homepageList = [


      HomePageList(
          id: "2", name: "Axis Bank", image: "images/axis.png", type: ''),
      HomePageList(
          id: "3", name: "Yes Bank", image: "images/yesbank.png", type: ''),
      HomePageList(
          id: "4", name: "Kotak Bank", image: "images/kotak.png", type: ''),
      HomePageList(
          id: "5", name: "IDFC First Bank", image: "images/idfc.png", type: ''),
      HomePageList(
          id: "6", name: "ICICI Bank", image: "images/icicibank.png", type: ''),
      HomePageList(
          id: "7", name: "Equitus Small Finance Bank", image: "images/equitus.png", type: ''),
      HomePageList(
          id: "8", name: "Ujjivan Small Finance Bank ", image: "images/ujjivan.png", type: ''),
      HomePageList(
          id: "10", name: "Jana Small Finance Bank", image: "images/jana.png", type: ''),
      HomePageList(
          id: "8", name: "Federal Bank", image: "images/federal.jpg", type: ''),

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
          "Current account",
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
                                  width: 90.0,
                                  height: 90.0,
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
