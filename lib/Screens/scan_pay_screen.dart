
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScanPayScreen extends StatefulWidget {
  const ScanPayScreen({Key? key}) : super(key: key);

  @override
  State<ScanPayScreen> createState() => _ScanPayScreenState();
}

class _ScanPayScreenState extends State<ScanPayScreen> {
  bool addMessageVisibility = false;

  Future<bool> onBackPress()async{
    Navigator.pop(context,true);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onBackPress,
        child: Scaffold(
          backgroundColor: const Color(0xFF111111),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                  icon: Icon(Icons.arrow_back,color: Color(0xFFFFAE00),),
                                onPressed: (){
                                  onBackPress();
                                    //Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                                "Payee Name",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "Details of payess",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image(image:AssetImage('images/rupee.png'),height: 35,width: 35,),
                                 ),
                                Container(
                                  child: IntrinsicWidth(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      cursorColor: Color(0xFFFFAE00),
                                      cursorHeight: 30,
                                      maxLength: 8,
                                      maxLines: null,
                                      minLines: 1,
                                      //: true,
                                      style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                          hintText: "0",
                                          hintStyle: TextStyle(color: Colors.grey, fontSize: 30,fontWeight: FontWeight.bold),
                                          counterText: "",
                                          isDense: true,
                                        ),
                                    ),
                                  ),
                                ),
                               ]
                                ),
                              ),

                          Container(
                             margin: EdgeInsets.only(top: 20, left: 20, right: 20,bottom: 20),
                              child: Center(
                                child: IntrinsicWidth(
                                  child: TextFormField(
                                   keyboardType: TextInputType.text,
                                  cursorColor:Color(0xFFFFAE00),
                                   style: TextStyle(color: Colors.white, fontSize: 18),
                                   decoration: InputDecoration(
                                      hintText: "Add Mesage",
                                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                                      /*enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFFFFAE00))
                                      ),*/
                                     //labelText: "Message",
                                     //labelStyle: TextStyle(color: Color(0xFFFFAE00))
                                  ),
                             ),
                                ),
                              ),
                           ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20,bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFF111111),

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white,width: 0.5)
                                ),
                                child: Image(image: AssetImage('images/hdfc_logo_gm.png'), width: 20,height: 20,),
                                //child: Icon(Icons.account_balance_wallet,color: Color(0xFFFFAE00),),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pay from",
                                      style: TextStyle(color: Colors.grey,fontSize: 14),
                                    ),
                                    Text(
                                        "HDFC Bank XX 6464",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                                    ),
                                    Text(
                                      "Check Balance",
                                      style: TextStyle(color: Color(0xFFFFAE00),),
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  //padding: EdgeInsets.zero,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3A3A3A),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.keyboard_arrow_down,color: Color(0xFFFFAE00),),
                                    onPressed: (){
                                      showBottonDailog(context);
                                    },
                                  ),
                                ),
                              )

                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              child: Text(
                                "Pay",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFFFAE00),
                                shadowColor: const Color(0xFFFFAE00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  void showBottonDailog(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bcontext){
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF3A3A3A),
              //borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*Text(
                    "9960953019",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),*/
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  child: Text(
                    "Pay Using",
                    //textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                           // width: 40,
                            child: Radio(

                                value: 1,
                                groupValue: 1,
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                //fillColor: Color(0xFFFFAE00),
                                activeColor: Color(0xFFFFAE00),
                                onChanged: (value){}
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "HDFC Bank XX 6464",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                                ),
                                Text(
                                  "Check Balance",
                                  style: TextStyle(color: Color(0xFFFFAE00),),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white,width: 0.5)
                        ),
                        child: Image(image: AssetImage('images/hdfc_logo_gm.png'), width: 20,height: 20,),
                        //child: Icon(Icons.account_balance_wallet,color: Color(0xFFFFAE00),),
                      ),

                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Radio(
                                value: 2,
                                groupValue: 1,
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                activeColor: Color(0xFFFFAE00),
                                onChanged: (value){}
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Genie Moneyy Wallet",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                                ),
                                Text(
                                  "Available Balance Rs.500",
                                  style: TextStyle(color: Color(0xFFFFAE00),),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white,width: 0.5)
                        ),
                        child: Icon(Icons.account_balance_wallet,color: Color(0xFFFFAE00),size: 20,),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        //width: 40,
                          child: Icon(Icons.add,color: Color(0xFFFFAE00))
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "New Bank Account",
                          style: TextStyle(color: Color(0xFFFFAE00),fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    child: Text(
                      "Pay",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }

}
