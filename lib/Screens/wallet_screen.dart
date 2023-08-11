import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: unused_import
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: unused_import
import 'employment_and_bank_details_screen.dart';

class WalletScrreen extends StatefulWidget {
  const WalletScrreen({Key? key}) : super(key: key);

  @override
  State<WalletScrreen> createState() => _WalletScrreenState();
}

class _WalletScrreenState extends State<WalletScrreen> {

  TextEditingController amountController = TextEditingController();
  double walletAmount = 0.0;
  late String pointw;

  @override
  void initState() {
    getreferal();


    getWalletAmount();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: const Text(
          "Wallet",
          style: TextStyle(color: kWhite),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
          onPressed: () {
              Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10,bottom: 10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color:navyBlueColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left: 120),
                      child: const Text(
                        " Wallet : ",
                        style: TextStyle(
                          color:kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 20

                        ),
                      ),
                    ),

                    Text(
                        pointw.toString(),
                        style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                  child: const Text(
                      "Redeem Your Points",
                    style: TextStyle(color:navyBlueColor,fontWeight: FontWeight.bold, fontSize: 22),
                  ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  cursorColor: greyColor,
                  keyboardType: TextInputType.number,

                  style: const TextStyle(color: greyColor),
                  controller: amountController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: navyBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    hintText: "Enter number of Points to Redeem",
                    hintStyle: const TextStyle(color: navyBlueColor),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: const Text(
                    "PROCEED",
                    style: TextStyle(
                        color:kWhite,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: navyBlueColor,
                    //shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () async{
                    _alertDialog();

                    // SharedPreferences pref = await SharedPreferences.getInstance();
                    // bool isAccountAdded = pref.getBool("isAccountAdded")??false;
                    // if(isAccountAdded){
                    //   if(amountController.text.isNotEmpty){
                    //     dailogForWallet(double.parse(amountController.text));
                    //   }else{
                    //     Fluttertoast.showToast(msg: "Please enter amount");
                    //   }
                    
                    // }
                    // else{
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>
                    //           EmploymentAndBankDetailsScreen("Bank Details")));
                    // }
                  },
                ),
              ),
              /*Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                        "Amount will detect from wallet for functionality like Recharge, Bill-Play, etc",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
              )*/
            ],
          ),
        ),
      ),
    );
  }

  dailogForWallet(double amount){

    Dialog dailogWallet = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: kWhite,
      child: StatefulBuilder(builder: (context,setState){
        return Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Update wallet",style: TextStyle(fontSize: 18,color: navyBlueColor, fontWeight: FontWeight.bold),),
                  IconButton(
                    icon:const Icon(Icons.clear,color: navyBlueColor),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Available balance : ",style: TextStyle(fontSize: 18,color: Color(0xFFFFAE00)),),
                    Text("Rs."+ walletAmount.toString(),style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Add balance : ",style: TextStyle(fontSize: 18,color: Color(0xFFFFAE00)),),
                    Text("Rs."+ amount.toString(),style: const TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 40,
                child: ElevatedButton(
                  onPressed: ()async{

                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                        color:navyBlueColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kWhite,
                  //  shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      })
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => dailogWallet);
  }

  getWalletAmount()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    walletAmount = pref.getDouble("upiId")??0.0;
  }

  Future<void> getreferal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState((){
      pointw = sharedPreferences.getString('point')??"";
      print("lalalalala"+pointw.toString());
    });

  }

//  void _alertDialog() {
  
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         backgroundColor: const Color(0xFF3A3A3A),
//         content: Container(
//           height: 160,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Container(
//                     margin: const EdgeInsets.only(top: 5,),
//                     child: const Text(
//                       "Thank you for your Redemption Request. We will check for the eligibility as per policy and revert to you shortly",
//                       style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//               margin: const EdgeInsets.only(bottom: 0.1),
//                 height: 40,
//                 width: 100,
//                 child: ElevatedButton(
//                   child: const Text(
//                     "Ok",
//                     style: TextStyle(
//                       color: Color(0xFF111111),
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: const Size(30, 80.0), backgroundColor: const Color(0xFFFFAE00),
//                     shadowColor: const Color(0xFFFFAE00),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   onPressed: () async {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }


void _alertDialog() {
  String message;

  if (int.parse(amountController.text) < 500) {
    message = "The minimum amount you can redeem is INR 500/- at a time";
  } else {
    message = "Thank you for your Redemption Request. We will check for the eligibility as per policy and revert to you shortly";
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kWhite,
        content: Container(
          height: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5,),
                    child: Text(
                      message,
                      style: TextStyle(color: navyBlueColor, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

}
