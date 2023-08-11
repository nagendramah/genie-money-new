import 'package:flutter/material.dart';
import 'package:genie_money/data/remote/network/ApiEndPointsPaySprint.dart';
import 'package:genie_money/data/remote/network/NetworkApiServicePaySprint.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/source_listModel.dart';
import 'bus_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DropDownButton',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

String selectedBankName="Select Source";
String selectedBankName2="Select Destination";

bool isClicked = false;

class BusBooking extends StatefulWidget {
  const BusBooking({Key? key}) : super(key: key);

  @override
  _BusBookingState createState() => _BusBookingState();
}
class _BusBookingState extends State<BusBooking> {
  late String point;
  bool isClickedseater = false;
  bool isClickedac = false;
  bool isClickednon = false;
  double walletAmount = 500;
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(2022, 8);
  final lastDate = DateTime(2023, 01);
  late DateTime _myDateTime = DateTime(DateTime.now().hour+1);
  String time = "?";
  String selectDate= "";

  // Initial Selected Value
  String dropdownvalue = '';
  String dropdownvalue2 = '';

  // List of items in our dropdown menu
  var items = [
    'Mumbai ',
    'pune',
    'Goa',
    'Lucknow',
    'Varanasi',
  ];
  List<Cities> listc= [];
  List<Cities> templistc= [];
  Cities? selectedcities = null;
  String selectedcityname = "";

  @override
  void initState() {
    getreferal();

    dropdownvalue = items.first;
    dropdownvalue2 = items.first;
    // TODO: implement initState
    CallCityList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF100F0F),
      appBar: AppBar(
        title: const Text("bus"),
      ),


      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color(0xFF3A3A3A),
                    borderRadius:
                    BorderRadius.all(Radius.circular(10))),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Points : ",
                          style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(point.toString(),
                            style: const TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFFFAE00),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(

                  children: [
                    GestureDetector(
                      onTap: (){
                        setState((){
                          templistc=listc;
                        });
                        Dialog bankDialog = Dialog(
                          backgroundColor: Color(0xFF3A3A3A),
                          child: StatefulBuilder(builder: (context,setStateNew) {

                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Color(0xFFFFAE00))
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              child: TextField(
                                                textCapitalization: TextCapitalization.characters,
                                                onChanged: (value) {
                                                  setStateNew((){
                                                    if(value.isNotEmpty){
                                                      //      templistc = listc!.where((element) => element.city.contains(value)).toList();
                                                      templistc = listc!.where((element) => element.name!.contains(value)).toList();
                                                    }else{
                                                      templistc = listc!;
                                                    }

                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "Search",
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                ),
                                                autocorrect: false,
                                                enableSuggestions: false,
                                                style: TextStyle(
                                                    color: Color(0xFFFFAE00),
                                                    decoration: TextDecoration
                                                        .none
                                                ),
                                                cursorColor: const Color(
                                                    0xFFFFAE00),
                                              ),
                                            )
                                        ),
                                        Icon(Icons.search,
                                          color: Color(0xFFFFAE00),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: templistc!.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: (){
                                                setState((){
                                                  selectedcities=templistc![index];
                                                  selectedBankName=selectedcities!.name!;
                                                  selectedcityname=selectedcities!.id!;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  templistc![index].name!,
                                                  style: TextStyle(color: Color(
                                                      0xFFFFAE00), fontSize: 18),
                                                ),
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );

                          }),
                        );

                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => bankDialog);

                      },
                      child: Container(
                        //height: 40,
                        margin: EdgeInsets.only(top: 10,bottom: 10),
                        padding: EdgeInsets.only(left: 10, right: 10,top: 12,bottom: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: Color(0xFFFFAE00))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                selectedBankName,
                                style: TextStyle(color: Color(0xFFFFAE00),fontSize: 16),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down,color: Color(0xFFFFAE00),)
                          ],
                        ),
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(

                        children: [
                          Text(
                            "To",style: TextStyle(fontSize: 18,color: Color(0xffffffff)),

                          )
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState((){
                          templistc=listc;
                        });
                        Dialog bankDialog = Dialog(
                          backgroundColor: Color(0xFF3A3A3A),
                          child: StatefulBuilder(builder: (context,setStateNew) {

                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Color(0xFFFFAE00))
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              child: TextField(
                                                textCapitalization: TextCapitalization.characters,
                                                onChanged: (value) {
                                                  setStateNew((){
                                                    if(value.isNotEmpty){
                                                      //      templistc = listc!.where((element) => element.city.contains(value)).toList();
                                                      templistc = listc!.where((element) => element.name!.contains(value)).toList();
                                                    }else{
                                                      templistc = listc!;
                                                    }

                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "Search",
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                ),
                                                autocorrect: false,
                                                enableSuggestions: false,
                                                style: TextStyle(
                                                    color: Color(0xFFFFAE00),
                                                    decoration: TextDecoration
                                                        .none
                                                ),
                                                cursorColor: const Color(
                                                    0xFFFFAE00),
                                              ),
                                            )
                                        ),
                                        Icon(Icons.search,
                                          color: Color(0xFFFFAE00),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: templistc!.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: (){
                                                setState((){
                                                  selectedcities=templistc![index];

                                                  selectedBankName2=selectedcities!.name!;
                                                  selectedcityname=selectedcities!.id!;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  templistc![index].name!,
                                                  style: TextStyle(color: Color(
                                                      0xFFFFAE00), fontSize: 18),
                                                ),
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );

                          }),
                        );

                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => bankDialog);

                      },
                      child: Container(
                        //height: 40,
                        margin: EdgeInsets.only(top: 10,bottom: 10),
                        padding: EdgeInsets.only(left: 10, right: 10,top: 12,bottom: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: Color(0xFFFFAE00))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                selectedBankName2,
                                style: TextStyle(color: Color(0xFFFFAE00),fontSize: 16),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down,color: Color(0xFFFFAE00),)
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Select Date", style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFFAE00),
                      ),),
                    ),Container(
                      child: Text("   :", style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFFAE00),
                      ),),
                    ),

                    MaterialButton(

                        child: Text(selectedDate.toString().split(' ')[0],
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                        ),
                        onPressed: () async {
                       var   fromDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2023),
                           //DateTime(1900)
                          );
                          // print(fromDate);
                        }),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Travel Preference",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFAE00),
                    ),
                    textAlign: TextAlign.left,
                  )),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        //IconButton( icon: Icons.airline_seat_flat_rounded,size: 40,color: Color(0xFFFFAE00,),),
                        IconButton(
                          icon: Icon(Icons.airline_seat_flat_rounded,
                              size: 40,
                              color: isClicked==false?Color(0xFFFFAE00):Color(0xFF01A2D9)
                          ),
                          onPressed: () {
                            if (isClicked == false) {
                              setState(() {
                                isClicked = true;
                              });
                            } else {
                              setState(() {
                                isClicked = false;
                              });
                            }
                          },
                        ),

                        Text("sleeper",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF868686))),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.airline_seat_recline_extra,
                              size: 40,
                              color: isClickedseater==false?Color(0xFFFFAE00):Color(0xFF01A2D9)
                          ),
                          onPressed: () {
                            if (isClickedseater == false) {
                              setState(() {
                                isClickedseater = true;
                              });
                            } else {
                              setState(() {
                                isClickedseater = false;
                              });
                            }
                          },
                        ),
                        Text("seater",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF868686))),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.severe_cold,
                              size: 40,
                              color: isClickedac==false?Color(0xFFFFAE00):Color(0xFF01A2D9)
                          ),
                          onPressed: () {
                            if (isClickedac == false) {
                              setState(() {
                                isClickedac = true;
                              });
                            } else {
                              setState(() {
                                isClickedac = false;
                              });
                            }
                          },
                        ),
                        Text("Ac",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF868686))),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.sunny_snowing,
                              size: 40,
                              color: isClickednon==false?Color(0xFFFFAE00):Color(0xFF01A2D9)
                          ),
                          onPressed: () {
                            if (isClickednon == false) {
                              setState(() {
                                isClickednon = true;
                              });
                            } else {
                              setState(() {
                                isClickednon = false;
                              });
                            }
                          },
                        ),
                        Text("NON-AC",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF868686))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 38,
                margin: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  child: const Text(
                    "Search Buses",
                    style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BusList()));

                      //
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             OTPScreenCard("","","")));
                      /* int? msg = LoginApiResponse().response_code;
                          if (msg==14)
                            {
                              Fluttertoast.showToast(
                                  msg:"Something  Wrong",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                             );
                            }*/

                      //
                      // Fluttertoast.showToast(
                      //     msg: ""+ stat!,
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.CENTER,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.red,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0
                      // );

                      // cardDetails.add(CardDetails(
                      //     "Bank Name",
                      //     _card_number_controller
                      //         .text
                      //         .trim("")
                      //         .substring(0, 5),
                      //     _card_number_controller
                      //         .text
                      //         .trim()
                      //         .substring(
                      //         12, 16),
                      //     _card_holder_controller
                      //         .text
                      //         .trim()));
                    });
                    /*  Navigator.of(context,
                            rootNavigator: true)
                            .pop();*/
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  CallCityList()async{
    try{
      NetworkApiServicePaySprint networkApiServicePaySprint = NetworkApiServicePaySprint();
      var res= await     networkApiServicePaySprint.postResponse(ApiEndPointsPaySprint().bussource, {});
      var model = SourceListModel.fromJson(res);
      setState((){
        listc = model.data!.cities!;


      });


    }
    catch(e){

    }

  }

  Future<void> getreferal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState((){
      point = sharedPreferences.getString('point')??"";
      print("lalalalala"+point.toString());
    });

  }}