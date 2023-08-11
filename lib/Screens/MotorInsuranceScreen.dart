import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/utils/silver_delegate.dart';

import '../Model/home_menu_list_model.dart';
import 'General_InsuranceScreen.dart';
class MotorInsurances extends StatefulWidget {
  const MotorInsurances( {Key? key}) : super(key: key);

  @override
  State<MotorInsurances> createState() => _MotorInsurances();
}

class _MotorInsurances extends State<MotorInsurances> {
  late List<HomePageList> homepageList;

  @override
  void initState() {
    homepageList = [

      HomePageList(
          id: "2", name: "2 Wheeler Insurance", image: "images/towwheelarInsurance.png",type: "general_insurance"),
      HomePageList(
          id: "4", name: "4 Wheeler Insurance", image: "images/fourwheelarInsurance.png",type: "general_insurance"),
      HomePageList(
          id: "3", name: "Commercial Vehicle Insurance", image: "images/mInsurance.png",type: "general_insurance"),
 HomePageList(
          id: "3", name: "Travel Insurance", image: "images/travelInsurance.png",type: "general_insurance"),
HomePageList(
          id: "3", name: "Home Insurance", image: "images/hminsurance.png",type: "general_insurance"),



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
          "Motor  Insurance",
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
                        if (homepageList[index].name == "Motr Insurance") {
                          Route route = MaterialPageRoute(
                              builder: (context) => MotorInsurances()
                          );
                          Navigator.of(context).push(route);
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
                                      "Getting Activated Soon ",
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

