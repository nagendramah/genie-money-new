import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/silver_delegate.dart';

import '../Model/home_menu_list_model.dart';
import 'General_InsuranceScreen.dart';
import 'MotorInsuranceScreen.dart';
class GeneralInsurances extends StatefulWidget {
 // const GeneralInsurances( {Key? key}) : super(key: key);
String InsuranceType;
GeneralInsurances({required this.InsuranceType});
  @override
  State<GeneralInsurances> createState() => _GeneralInsurances();
}

class _GeneralInsurances extends State<GeneralInsurances> {
  late List<HomePageList> homepageList;

  @override
  void initState() {
    if(widget.InsuranceType=="General Insurance"){
      homepageList = [

        HomePageList(
            id: "2", name: "Health  Insurance", image: "images/Health Insurance.png",type: "general_insurance"),
        HomePageList(
            id: "3", name: "Vehical Insurance", image: "images/Vehicle Insurance.png",type: "general_insurance"),
        HomePageList(
            id: "4", name: "Accidental/Death Insurance", image: "images/Accidental Death Insurance.png",type: "general_insurance"),
        HomePageList(
            id: "3", name: "Home/Shop/Office Protection Insurance", image: "images/Home Insurance.png",type: "general_insurance"),
        HomePageList(
            id: "3", name: "Job Loss Insurance", image: "images/Job Loss Insurance.png",type: "general_insurance"),
        HomePageList(
            id: "3", name: "Cyber Fraud Insurance", image: "images/Cyber Fraud Insurance.png",type: "general_insurance"),


        /// commenting below sunil code
        /* HomePageList(
          id: "3", name: "Mobile Insurance", image: "images/MobileInsurance.png"),*/





      ];
    }
   else if(widget.InsuranceType=="Life Insurance"){
      homepageList=[
        HomePageList(
            id: "52",
            name: "Traditional & Term Insurance",
            image: "images/Term Insurance.png", type: 'life_insurance'),];
    }


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
        title:  Text(widget.InsuranceType.toString(),
          //"General Insurance",
          style: const TextStyle(
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
                    return GestureDetector(
                      onTap: () async {
                        if (homepageList[index].name == "Motor Insurance") {
                          Route route = MaterialPageRoute(
                              builder: (context) => const MotorInsurances()
                          );
                          Navigator.of(context).push(route);
                        }
                        else{
                          showDialog(context: context, builder: (context){
                            return AlertDialog(

                              backgroundColor:  kWhite,
     shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(
          //   color: Colors.orange, // Set the border color here
          //   width: 2.0, // Set the border width here
          // ),
        ),
                              content: Container(
                                height: 111,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Getting Activated Soon ",
                                      style: TextStyle(color:navyBlueColor, fontSize: 20),
                                    ),
                                    Container(

                                      margin: const EdgeInsets.only(top: 40,bottom: 5),
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
                                          const Size(30, 80.0), backgroundColor: navyBlueColor,
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
                                margin: const EdgeInsets.only(top: 10.0),
                                child: Image(
                                  image: AssetImage(homepageList[index].image),
                                  width: 80.0,
                                  height: 80.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0,),
                                child: Text(
                                  homepageList[index].name,
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 15.0,
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

