import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Model/AvailableTripsModel.dart';
import '../data/remote/network/ApiEndPointsPaySprint.dart';
import '../data/remote/network/NetworkApiServicePaySprint.dart';

class BusList extends StatefulWidget {
  const BusList({Key? key}) : super(key: key);

  @override
  State<BusList> createState() => _BusListState();
}


class _BusListState extends State<BusList> {
   List<AvailableTrips> availableTrips = [];

  @override
  void initState() {

    // TODO: implement initState
    CallAvailableTripList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "History",
          style: const TextStyle(
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
        child: Container(

            child: ListView.builder(
                reverse: true,

                itemCount:/*availableTrips.length,*/ availableTrips==null?0:availableTrips!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(

                          backgroundColor:  Color(0xFFFFFFFF),

                          content: Container(
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                Text(
                                  availableTrips?[index].ac==null||availableTrips?[index].ac=="failed"?"Failed":availableTrips![index].additionalCommission!,

                                  style: TextStyle(color: availableTrips?[index].ac==null||availableTrips?[index].additionalCommission=="failed"?Color(
                                      0xFFF80000):Color(0xFF48C500),
                                      fontSize: 25),
                                ),
                                Container(
                                  child: Row(

                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 15),
                                      ),
                                      Text(
                                        "        :",
                                        style: TextStyle(color: Color(
                                            0xFF000000),fontWeight: FontWeight.bold, fontSize: 15),
                                      ),

                                    ],
                                  ),
                                ),





                              ],
                            ),

                          ),
                        );

                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Color(0xFFFFAE00), width: 1)
                      ),
                      margin: EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top:4,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Card no :",
                                          style: TextStyle(color: Color(0xFFFFAE00), fontSize: 16),
                                        ),
/*
                                        Text(
                                          availableTrips?[index].ac,

                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        )
*/
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top:4,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Amount ",
                                          style: TextStyle(color: Color(0xFFFFAE00), fontSize: 16),
                                        ),
/*
                                        Text(
                                          availableTrips?[index].ac==null?"":availableTrips![index].ac!,



                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        )
*/
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top:4,),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Date ",
                                              style: TextStyle(color: Color(0xFFFFAE00), fontSize: 16),
                                            ),
                                            Text(
                                              ((availableTrips?[index].ac==null?"":availableTrips![index].ac!.toString()).split(" "))[0],
                                              style: TextStyle(color: Colors.white, fontSize: 16),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Row(
                                          children: [
                                            Text(
                                              "Time ",
                                              style: TextStyle(color: Color(0xFFFFAE00), fontSize: 16),
                                            ),
                                            Text(
                                              ((availableTrips?[index].ac==null?"":availableTrips![index].ac!.toString()).split(" "))[1],
                                              style: TextStyle(color: Colors.white, fontSize: 16),
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Color(0xFFFFAE00),)
                        ],
                      ),
                    ),
                  );
                })
        ),
      ),
    );
  }

 Future CallAvailableTripList()async{
    Map<String, dynamic> param = {
      "source_id": 6,
      "destination_id":3,
      "date_of_journey":  "2022-07-29",
    };
    try{
      NetworkApiServicePaySprint networkApiServicePaySprint = NetworkApiServicePaySprint();
      var res= await     networkApiServicePaySprint.postResponse(ApiEndPointsPaySprint().aaaa, param);
      var model = AvailableTripsModel.fromJson(res);

      setState((){
        availableTrips = model.data!.availableTrips!;
      });
print("ho re baba"+availableTrips!.length.toString());

    }
    catch(e){
      print(e);
    }

  }
}
