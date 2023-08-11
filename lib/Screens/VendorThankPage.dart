import 'package:flutter/material.dart';

// ignore: unused_import
import 'essentials_screen.dart';
// ignore: unused_import
import 'home_screen.dart';

// ignore: must_be_immutable
class VendorThankyouPage extends StatefulWidget {
  String bback;
   VendorThankyouPage({Key? key,required this.bback,}) : super(key: key);

  @override
  State<VendorThankyouPage> createState() => _VendorThankyouPageState();
}

class _VendorThankyouPageState extends State<VendorThankyouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFAE00),

      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(

              children: [

                Container(
                  margin: EdgeInsets.only(top: 250,left: 10),

                  child: Text("Welcome in GenieMoney as Merchant Thank you For Registering With Us",style: TextStyle(
                      color: Color(0xFF000000),fontWeight: FontWeight.bold,
                      fontSize: 30,


                  ),),
                ),
/*
                Container(
                  margin: EdgeInsets.only(top: 20),

                  child: Text("Thank you For Registering With Us",style: TextStyle(
                      color: Color(0xFF000000),fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),),
                ),
*/
                Container(
                  margin: const EdgeInsets.only(top: 20,bottom: 10),
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    child: const Text(
                      "OK",
                      style: TextStyle(
                          color:
                          Color(0xFFFFAE00),
                          fontSize: 18.0,
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
                    /*  Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EssentialsScreen()));*/
                      if(widget.bback==1)
                        {
                          Navigator.of(context)
                            ..pop()
                            ..pop();
                        }
                      else{
                        Navigator.of(context)
                          ..pop()
                          ..pop()
                          ..pop()
                          ..pop();
                      }

                    /*  Navigator.popUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                            (Route<dynamic> route) => true,
                      );*/
                    //  Navigator.of(context).popUntil(ModalRoute.withName('/EssentialsScreen'));


                       // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => EssentialsScreen(),),  (Route<dynamic> route) => true);


                    }


                    ,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
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

                        *//*  Navigator.of(context,
                                  rootNavigator: true)
                                  .pop();*//*
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

                    *//*  Navigator.of(context,
                                rootNavigator: true)
                                .pop();*//*
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

                    *//*  Navigator.of(context,
                                rootNavigator: true)
                                .pop();*//*
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
    ),*/
    );

  }
}
