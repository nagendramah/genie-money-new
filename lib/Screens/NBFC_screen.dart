import 'package:flutter/material.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/NBFC_Banks_Screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/silver_delegate.dart';

class NbfcScreen extends StatefulWidget {
  const NbfcScreen({Key? key}) : super(key: key);

  @override
  State<NbfcScreen> createState() => _NbfcScreenState();
}

class _NbfcScreenState extends State<NbfcScreen> {
  late List<HomePageList> homepageList;

  @override
  void initState() {
    homepageList = [




      ///comentting below code
      HomePageList(
          id: "55", name: "NFBC Fixed Deposit", image: "images/current_account_gm.png", type: 'nbfc_fd'),



    ];

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
        title: const Text(
          "Deposits",
          style: TextStyle(
            color: kWhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color:kWhite,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10.0,left: 25),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Nbfc_Bank_Screen()));

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
                                margin: const EdgeInsets.only(top: 10.0),
                                child: Image(
                                  image: AssetImage(homepageList[index].image),
                                  color: kWhite,
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
}
