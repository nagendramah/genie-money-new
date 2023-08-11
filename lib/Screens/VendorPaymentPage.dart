/*
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/NewVendorsModel.dart';
import '../data/remote/network/NetworkApiServiceNewVendor.dart';
import '../utils/constants.dart';
import '../utils/network.dart';
import 'VendorThankPage.dart';
import 'creditcard_transaction_history.dart';
import 'essentials_screen.dart';
class VendorPaymentPage extends StatefulWidget {
  String essid;
  String cat_id;
  String cat_idd;
   VendorPaymentPage({Key? key,required this.essid,required this.cat_id,required this.cat_idd}) : super(key: key);

  @override
  State<VendorPaymentPage> createState() => _VendorPaymentPageState();
}
enum Gender { Male, Female }
class _VendorPaymentPageState extends State<VendorPaymentPage> with TickerProviderStateMixin{
  final TextEditingController _UPI_id_controller = TextEditingController();
  final TextEditingController _Transaction_ID_controller = TextEditingController();
  final TextEditingController _email_mobile_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _employee_code_controller = TextEditingController();
  late String user;


  late String longitude = '00.00000';
  late String latitude = '00.00000';
  late bool serviceEnabled = false, _isLoading = false;

  late String title = "Customer";

  late double curve;
  late double height_angle;

  late String selected_type = "Retailer";

  List<String> business_type_list = [
    'Retailer',
    'Distributor',
    'Super Distributor'
  ];

  @override
  void initState() {

    getuserid();
    super.initState();

  }

  bool isFirst = false;

  bool isTransaction = false;
  bool isVisible = true;

//  var _tabController;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("height : "+height.toString());
    if (isFirst) {
      if (height <= 593) {
        curve = height * 0.65;
        height_angle = height * 0.55;
      } else if (height > 593 && height <= 672) {
        curve = height * 0.55;
        height_angle = height * 0.50;
      } else {
        curve = height * 0.45;
        height_angle = height * 0.40;
      }
      isFirst = false;
    }else{
      if (title == "Business Partner") {
        if (height <= 593) {
          curve = height * 0.79;
          height_angle = height * 0.69;
        } else if (height > 593 && height <= 672) {
          curve = height * 0.70;
          height_angle = height * 0.65;
        } else {
          curve = height * 0.58;
          height_angle = height * 0.51;
        }
      } else {
        if (height <= 593) {
          curve = height * 0.77;
          height_angle = height * 0.67;
        } else if (height > 593 && height <= 672) {
          curve = height * 0.65;
          height_angle = height * 0.58;
        } else {
          curve = height * 0.55;
          height_angle = height * 0.48;
        }
      }
    }
    return Scaffold(
      backgroundColor: const Color(0xFFFFAE00),

      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFFFAE00),
          onPressed: () {
            if (isTransaction) {
              setState(() {
                isTransaction = false;
              });
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CreditCardTranscationHistory()));
              },
              icon: Icon(Icons.history, color: Color(0xFFFFAE00),))
        ],
        title: Text(
          !isTransaction ? "Payments" : "Transactions",
          style: TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),

      ),
      body:   Column(
        children: [
         */
/* TabBar(

            indicator: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Color(0xFF111111)),
            onTap: (value) {
              setState(() {
                if (value == 0) {
                  isVisible = true;
                  title = "UPI / QR Payment";
                  if (height <= 593) {
                    curve = height * 0.65;
                    height_angle = height * 0.55;
                  } else if (height > 593 && height <= 672) {

                    curve = height * 0.55;
                    height_angle = height * 0.50;
                  } else {
                    curve = height * 0.52;
                    height_angle = height * 0.42;
                  }
                } else if (value == 1) {
                  isVisible = false;

                  title = "Online Payment";
                  if (height <= 593) {
                    curve = height * 0.79;
                    height_angle = height * 0.69;
                  } else if (height > 593 && height <= 672) {
                    curve = height * 0.70;
                    height_angle = height * 0.65;
                  } else {
                    curve = height * 0.58;
                    height_angle = height * 0.51;
                  }
                } else {
                  isVisible = false;

                  title = "Cash Payment";
                  if (height <= 593) {
                    curve = height * 0.77;
                    height_angle = height * 0.67;
                  } else if (height > 593 && height <= 672) {
                    curve = height * 0.65;
                    height_angle = height * 0.58;
                  } else {
                    curve = height * 0.55;
                    height_angle = height * 0.48;
                  }
                }
              });
            },
            isScrollable: true,
            indicatorColor: Colors.white,
            controller: tabController,
            labelColor: const Color(0xFFFFAE00),
            unselectedLabelColor: const Color(0xFF111111),
            *//*
*/
/*tabs: const [
             *//*
*/
/**//*
*/
/* Tab(
                child: Text(
                  "UPI/Qr Payment",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),*//*
*/
/**//*
*/
/*
              Tab(
                child: Text(
                  "Online Payment ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  "Cash Payment ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],*//*
*/
/*
          ),*//*

          Expanded(child:
          TabBarView(
            controller: tabController,
            children: [

              */
/* Visibility(
                 child: SingleChildScrollView(
                   child: Container(

                        child: Column(

                          children: [
                            Container(

                              child: Text("Enter UPI Id",style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18
                              ),),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: TextFormField(
                                  controller:
                                  _UPI_id_controller,
                                  keyboardType:
                                  TextInputType.text,


                                  style: const TextStyle(
                                      color: Color(0xFF111111)),
                                  cursorColor:
                                  const Color(0xFF111111),
                                  decoration: InputDecoration(
                                    focusedBorder:
                                    OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(
                                          color: Color(
                                              0xFF111111)),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0),
                                    ),
                                    disabledBorder:
                                    OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(
                                          color: Color(
                                              0xFF111111)),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0),
                                    ),
                                    enabledBorder:
                                    OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(
                                          color: Color(
                                              0xFF111111)),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(
                                          color: Color(
                                              0xFF111111)),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0),
                                    ),
                                    labelStyle: const TextStyle(
                                        color:
                                        Color(0xFF111111)),
                                    // hintText: 'Email / Mobile No.',
                                    labelText: 'xyx@okicici',
                                    isDense: true,
                                  ),
                                )
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),

                              child: Text("OR",style: TextStyle(
                                  color: Color(0xFF111111),fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),),
                            ),
                            Container(
                              height: 345,
                              width: 345,
                              margin: EdgeInsets.only(top: 5),
                              child: Image.asset("images/vendorqr.png"),
                            ),
                        Container(
                          margin: EdgeInsets.only(top: 20),

                          child: Text("Enter Transaction Id",style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 18
                          ),),
                        ),


                            Container(
                                margin: EdgeInsets.only(left: 10,right: 10,top: 5),
                                child: TextFormField(
                                  controller:
                                  _Transaction_ID_controller,
                                  keyboardType:
                                  TextInputType.text,
                                  style: const TextStyle(
                                      color: Color(0xFF111111)),
                                  cursorColor:
                                  const Color(0xFF111111),
                                  decoration: InputDecoration(
                                    focusedBorder:
                                    OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(
                                          color: Color(
                                              0xFF111111)),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0),
                                    ),
                                    disabledBorder:
                                    OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(
                                          color: Color(
                                              0xFF111111)),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0),
                                    ),
                                    enabledBorder:
                                    OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(
                                          color: Color(
                                              0xFF111111)),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(
                                          color: Color(
                                              0xFF111111)),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0),
                                    ),
                                    labelStyle: const TextStyle(
                                        color:
                                        Color(0xFF111111)),
                                    // hintText: 'Email / Mobile No.',
                                    labelText: 'Enter Transaction Id',
                                    isDense: true,
                                  ),
                                )
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 20,bottom: 10),
                              height: 40,
                              width: 200,
                              child: ElevatedButton(
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                      color:
                                      Color(0xFFFFAE00),
                                      fontSize: 15.0,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                                style:
                                ElevatedButton.styleFrom(
                                  fixedSize:
                                  Size(30, 80.0),


                                  primary:
                                  const Color(0xFF111111),
                                  shadowColor:
                                  const Color(0xFF111111),
                                  shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        10.0),
                                  ),
                                ),
                                onPressed: () async {
                                  sendpayment();


                                }


                                ,
                              ),
                            ),


                          ],
                        ),

                      ),
                 ),
               ),*//*


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Container(
                        //width: width,
                        margin: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                        child: const Text(
                          "Pay Online",
                          style: TextStyle( color: Colors.black, fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin: const EdgeInsets.only(top: 20.0,right: 10.0),
                            child: Divider(
                              thickness: 1,
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  ),
                  ListView.builder(

                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      shrinkWrap: true,
                      itemCount:paymentmod.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>locationscreen()));
                          },
                          child: Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            //    color: Colors.blueGrey.shade200,
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image(
                                    height: 50,
                                    width: 70,
                                    image: AssetImage(paymentmod[index].icon),
                                  ),
                                  SizedBox(
                                    width: 210,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        Container(
                                          //   width: width,
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            text: TextSpan(
                                                text: '',
                                                style: TextStyle(
                                                    color: Colors.blueGrey.shade800,
                                                    fontSize: 16.0),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                      '${paymentmod[index].name}\n',
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.bold)),
                                                ]),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Radio<void>(
                                      activeColor: const Color(0xFFFFAE00),
                                      value: paymentmod[index].name,
                                      toggleable: true,
                                      groupValue: selectedUserIndex,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedUserIndex = value as String;
                                        });
                                      },
                                    ),

                                  ),

                                ],
                              ),
                            ),
                          ),

                        );
                      }),
                  */
/*Row(
                    children: [
                      Container(
                        //width: width,
                        margin: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                        child: const Text(
                          "Pay By Cash",
                          style: TextStyle( color: Colors.black, fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin: const EdgeInsets.only(top: 20.0,right: 10.0),
                            child: Divider(
                              thickness: 1,
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  ),*//*


                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      //    color: Colors.blueGrey.shade200,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              height: 50,
                              width: 80,
                              image: AssetImage("images/COD.png"),
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    //   width: width,
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      text: TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: Colors.blueGrey.shade800,
                                              fontSize: 16.0),
                                          children: [
                                            TextSpan(
                                                text:
                                                'Cash on Delevery\n',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                          ]),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                             Radio(
                                 value: "radio value",
                                 groupValue: "group value",
                                 onChanged: (value){
                                   print(value); //selected value
                                 }
                             ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],

          ))

        ],
      ),

      */
/*body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
            left: 10.0, top: 10.0, bottom: 10.0),
        child: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
            FittedBox(
              child: Container(
                height: 40,
                width: 100,
                child: ElevatedButton(
                      child: const Text(
                        "UPI / QR Payments",
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
                        Size(20, 40.0),


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



                        }

                        *//*
*/
/*  Navigator.of(context,
                                  rootNavigator: true)
                                  .pop();*//*
*/
/*
                      ,
                    ),
              ),
            ),
                Container(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    child: const Text(
                      "Online Payment ",
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
                      Size(20, 40.0),


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



                    }

                    *//*
*/
/*  Navigator.of(context,
                                rootNavigator: true)
                                .pop();*//*
*/
/*
                    ,
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    child: const Text(
                      "Cash Payment",
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
                      Size(20, 40.0),


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



                    }

                    *//*
*/
/*  Navigator.of(context,
                                rootNavigator: true)
                                .pop();*//*
*/
/*
                    ,
                  ),
                ),


              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),

              child: Text("Enter UPI Id",style: TextStyle(
                  color: Color(0xFFFFAE00),
                fontSize: 18
              ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller:
                  _UPI_id_controller,
                  keyboardType:
                  TextInputType.text,


                  style: const TextStyle(
                      color: Color(0xFFFFAE00)),
                  cursorColor:
                  const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    disabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    labelStyle: const TextStyle(
                        color:
                        Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'xyx@okicici',
                    isDense: true,
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.only(top: 35),

              child: Text("OR",style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontSize: 18
              ),),
            ),
            Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.only(top: 35),
              child: Image.asset("images/vendorqr.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),

              child: Text("Enter Transaction Id",style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontSize: 18
              ),),
            ),

            Container(
                margin: EdgeInsets.only(top: 5),
                child: TextFormField(
                  controller:
                  _Transaction_ID_controller,
                  keyboardType:
                  TextInputType.text,


                  style: const TextStyle(
                      color: Color(0xFFFFAE00)),
                  cursorColor:
                  const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    disabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    labelStyle: const TextStyle(
                        color:
                        Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Transaction Id',
                    isDense: true,
                  ),
                )
            ),
          ],
        ),

      ),
    ),*//*

    );
  }

  Future<void> sendpayment() async {
    if(_UPI_id_controller.text.isEmpty&&_Transaction_ID_controller.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Pleas enter UPI ID or Transaction ID ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }
*/
/*
else if(_Transaction_ID_controller.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Pleas enter Transaction ID ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);


    }
*//*


else {
      Map<String, String> jsonbody = {

        "ess_id":widget.essid.toString(),
        "upi_id":_UPI_id_controller.text.toString(),
        "txn_id":_Transaction_ID_controller.text.toString(),
        */
/*   "ad_1":_ads_1_file,
      "ad_2":_ads_2_file.toString(),
      "ad_3":_ads_3_file.toString(),
      "ad_4":_ads_4_file.toString(),
*//*

      };
      var network = NewVendorApiService();
      String urls =
          "http://165.22.219.135/genie_money/public/index.php/useressentialssave";
      var res = await network.postresponse(urls, jsonbody);
      var model = NewVendorsModel.fromJson(res);
      String stat = model.status.toString();
      //var nopopupcatID = widget.cat_id;


      print(stat);

      if (stat.contains("201")) {
        Fluttertoast.showToast(
            msg: " Succesfully Added ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Done"+Constants.category);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Constants.category = widget.cat_id;
     //   await prefs.setBool('isLoggedIn', true);
        await prefs.setString("category", Constants.category);
        print("hogaya"+Constants.category);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    VendorThankyouPage(bback:widget.cat_idd,)));
      } else {
        Fluttertoast.showToast(
            msg: "Somthing Went Wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      print("" + res!.toString());
    }


  }

  Future<void> getuserid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState((){
      user = sharedPreferences.getString('refer')??"";
      print("lalalalala"+user.toString());
    });

  }
  Gender? _selectedGender;
  String? selectedUserIndex;
  List paymentmod=[
    choosepayment(icon:("images/UPIfinal.png"), name:"UPI(Google Pay/Phone Pay)", radio: "upi"),
    choosepayment(icon:("images/DebitCard.png"), name:"Debit/Credit Card", radio: 'card'),
    choosepayment(icon:("images/onlinebanking.png"), name:"Net Banking", radio: "netbank"),
    // choosepayment(icon:("images/cash.png"), name:"Cash on Delevery"),
  ];
}
class choosepayment {
  String icon;
  String name;
  String radio;


  choosepayment({required this.icon, required this.name,required this.radio});
}*/
