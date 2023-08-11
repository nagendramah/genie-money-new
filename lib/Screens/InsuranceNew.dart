import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/silver_delegate.dart';

import '../Model/home_menu_list_model.dart';
import 'General_InsuranceScreen.dart';
class NewInsurance extends StatefulWidget {
  const NewInsurance( {Key? key}) : super(key: key);

  @override
  State<NewInsurance> createState() => _NewInsurance();
}

class _NewInsurance extends State<NewInsurance> {
  late List<HomePageList> homepageList;

  @override
  void initState() {
    homepageList = [

      HomePageList(
          id: "2", name: "General Insurance", image: "images/General Insurance.png",type: "general_insurance"),
      HomePageList(
          id: "3", name: "Life Insurance", image: "images/Life Insurance.png",type: "life_insurance"),



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
          "Insurance",
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
               const SizedBox(
                        height: 50,
                      ),
              const Text(
              "Select an Insurance",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: navyBlueColor ),
            ),


            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 50.0,left: 50,right: 50),
                child: GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 1,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    height: height * 0.22,
                  ),
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                         if (homepageList[index].name == "General Insurance") {
                        Route route = MaterialPageRoute(
                        builder: (context) => GeneralInsurances(InsuranceType: 'General Insurance',)
                        );
                        Navigator.of(context).push(route);
                        }else if (homepageList[index].name == "Life Insurance") {
                           Route route = MaterialPageRoute(
                               builder: (context) => GeneralInsurances(InsuranceType: 'Life Insurance',)
                           );
                           Navigator.of(context).push(route);
                         }
                         else{
                           showDialog(context: context, builder: (context){
                             return AlertDialog(

                               backgroundColor:  Color(0xFF3A3A3A),
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
                                    top: 10, left: 5.0, right: 5.0,bottom: 10),
                                child: Text(
                                  homepageList[index].name,
                                  style: const TextStyle(
                                    color:kWhite,
                                    fontSize: 20.0,
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

