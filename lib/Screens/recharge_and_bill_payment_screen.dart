import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/bill_payment_screen.dart';
import 'package:genie_money/data/remote/network/NetworkApiServicePaySprint.dart';
import 'package:genie_money/utils/silver_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RechargeAndBillPayment extends StatefulWidget {
  const RechargeAndBillPayment({Key? key}) : super(key: key);

  @override
  _RechargeAndBillPaymentState createState() => _RechargeAndBillPaymentState();
}

class _RechargeAndBillPaymentState extends State<RechargeAndBillPayment> {
  late List<HomePageList> homepageList;
  String type="";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  void initState() {
    // TODO: implement initState
    homepageList = [
      HomePageList(
          id: "7", name: "Mobile Payment", image: "images/mobile_prepaid.png", type: ''),
      /*HomePageList(
          id: "8", name: "Mobile Postpaid", image: "images/mobile_prepaid.png"),*/
      HomePageList(
          id: "9", name: "Landline Bill", image: "images/landline_postpaid.png", type: ''),
      HomePageList(
          id: "10", name: "Electricity Bill", image: "images/electricity.png", type: ''),
      HomePageList(
          id: "11", name: "GAS", image: "images/gas.png", type: ''),
      HomePageList(
          id: "12", name: "Water Tax Bill", image: "images/water.png", type: ''),
      HomePageList(
          id: "13", name: "LIC", image: "images/lic_payment.png", type: ''),
      HomePageList(
          id: "14", name: "Fast Tag", image: "images/fasttag_gm.png", type: ''),
      HomePageList(
          id: "15", name: "DTH Recharge", image: "images/dth.png", type: ''),
      /*HomePageList(
          id: "16", name: "BroadBand Prepaid", image: "images/boardband_prepaid.png"),*/
      HomePageList(
          id: "17", name: "Broad-Band", image: "images/boardband_prepaid.png", type: ''),

    ];
    getUserType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "Recharge and Bill Payment",
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
                        /*if(homepageList[index].name == "BroadBand Prepaid") {
                          _alertDialog();
                        }*/if(homepageList[index].name == "Mobile Payment"
                            || homepageList[index].name == "GAS"
                            || homepageList[index].name == "Broad-Band"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MobileRecharge(option: homepageList[index].name,)));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BillPaymentScreen(homepageList[index].name)));
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

  Future getUserType()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = (prefs.get("type")?? "Customer").toString();

    });
    if(type=="Customer"){
      homepageList = [
        HomePageList(
            id: "7", name: "Mobile Payment", image: "images/mobile_prepaid.png", type: ''),
        /*HomePageList(
          id: "8", name: "Mobile Postpaid", image: "images/mobile_prepaid.png"),*/
        HomePageList(
            id: "9", name: "Landline Bill", image: "images/landline_postpaid.png", type: ''),
        HomePageList(
            id: "10", name: "Electricity Bill", image: "images/electricity.png", type: ''),
        HomePageList(
            id: "11", name: "GAS", image: "images/gas.png", type: ''),
        HomePageList(
            id: "12", name: "Water Tax Bill", image: "images/water.png", type: ''),
        HomePageList(
            id: "13", name: "Property Tax", image: "images/propertytax_gm.png", type: ''),
        HomePageList(
            id: "13", name: "Insurance Premium", image: "images/insurancepremium_gm.png", type: ''),
        HomePageList(
            id: "14", name: "Fast Tag", image: "images/fasttag_gm.png", type: ''),
        HomePageList(
            id: "15", name: "DTH Recharge", image: "images/dth.png", type: ''),
        /*HomePageList(
          id: "16", name: "BroadBand Prepaid", image: "images/boardband_prepaid.png"),*/
        HomePageList(
            id: "17", name: "Broad-Band", image: "images/boardband_prepaid.png", type: ''),
      ];
    }else if(type == "Retailer" || type == "Distributor" || type == "Super Distributor") {
      homepageList = [
        HomePageList(
            id: "7", name: "Mobile Payment", image: "images/mobile_prepaid.png", type: ''),
        /*HomePageList(
          id: "8", name: "Mobile Postpaid", image: "images/mobile_prepaid.png"),*/
        HomePageList(
            id: "9", name: "Landline Bill", image: "images/landline_postpaid.png", type: ''),
        HomePageList(
            id: "10", name: "Electricity Bill", image: "images/electricity.png", type: ''),
        HomePageList(
            id: "11", name: "GAS", image: "images/gas.png", type: ''),
        HomePageList(
            id: "12", name: "Water Tax Bill", image: "images/water.png", type: ''),
        HomePageList(
            id: "13", name: "LIC Premium", image: "images/lic_payment.png", type: ''),
        HomePageList(
            id: "14", name: "Fast Tag", image: "images/fasttag_gm.png", type: ''),
        HomePageList(
            id: "15", name: "DTH Recharge", image: "images/dth.png", type: ''),
        /*HomePageList(
          id: "16", name: "BroadBand Prepaid", image: "images/boardband_prepaid.png"),*/
        HomePageList(
            id: "17", name: "Broad-Band", image: "images/boardband_prepaid.png", type: ''),

      ];

    }
  }

  Future _alertDialog() {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          contentText: 'Getting Activated Soon',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}

class MobileRecharge extends StatefulWidget {
  String option;
  MobileRecharge({required this.option});

  @override
  State<MobileRecharge> createState() => _MobileRechargeState();
}

class _MobileRechargeState extends State<MobileRecharge> {
  late List<HomePageList> homepageList;

  @override
  void initState() {
    if(widget.option=="Mobile Payment"){
      homepageList = [
        HomePageList(
            id: "1", name: "Prepaid", image: "images/mobile_prepaid.png", type: ''),
        HomePageList(
            id: "2", name: "Postpaid", image: "images/mobile_prepaid.png", type: ''),

      ];
    }else if(widget.option=="GAS"){
      homepageList =[
        HomePageList(
            id: "3", name: "Piped Gas Bill", image: "images/gaspipeline_gm.png", type: ''),
        HomePageList(
            id: "7", name: "Gas Cylinder Booking", image: "images/gascylender_gm.png", type: ''),

      ];
    }else if(widget.option=="Broad-Band"){
      homepageList =[
        HomePageList(
            id: "8", name: "BroadBand Prepaid", image: "images/boardband_prepaid.png", type: ''),
        HomePageList(
            id: "9", name: "BroadBand Postpaid", image: "images/boardband_prepaid.png", type: '')
      ];
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "Mobile Payment",
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
                        if(homepageList[index].name == "BroadBand Prepaid") {
                          _alertDialog();
                        }else if(homepageList[index].name=="Prepaid" || homepageList[index].name=="Postpaid"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BillPaymentScreen("Mobile "+homepageList[index].name)));
                        }else {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BillPaymentScreen(homepageList[index].name)));
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
  void _alertDialog() {
    showDialog(context: context, builder: (context){

      return AlertDialog(

        backgroundColor:  Color(0xFF3A3A3A),

        content: Container(
          height: 100,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin:  EdgeInsets.only(top: 12,),

                child: Text(
                  "Getting Activated Soon",
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                ),
              ),
              Container(

                margin: const EdgeInsets.only(top: 20,bottom: 1),
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
}
