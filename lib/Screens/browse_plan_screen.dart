import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/data/remote/network/NetworkApiServicePaySprint.dart';

import '../Model/utility/BrowsePlanModel.dart';
import '../data/remote/network/ApiEndPointsPaySprint.dart';

class BrowsePlanScreen extends StatefulWidget {
  String title;
  String operator;
  String circle;
  String phoneNumber;
  BrowsePlanScreen({required this.title,required this.operator, required this.circle, required this.phoneNumber });

  @override
  State<BrowsePlanScreen> createState() => _BrowsePlanScreenState();
}

class _BrowsePlanScreenState extends State<BrowsePlanScreen> {

  bool isProgessBarVisible = false;

  List<String> list = [
    "FullTT","TopUp","3G/4G","2G","SMS","Combo","Roaming",
  ];
  final _scrollController = ScrollController();
  List<RechargeInfoModel> temList=[];
  late BrowsePlanModel browsePlanModel;
  int currentIndex = 0;
  @override
  void initState() {
    browsePlanModel = BrowsePlanModel();
    getPlan();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          widget.title,
          style: const TextStyle(color: Color(0xFFFFAE00)),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFAE00),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Mob. No.",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                  widget.phoneNumber,
                                style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          widget.operator,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          widget.circle,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 10),
                          child: Center(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                itemCount: list.length,
                                itemBuilder: (context, index){
                                  return GestureDetector(
                                    onTap: (){
                                      if(index==0){
                                        setState(() {
                                          currentIndex=0;
                                          temList = browsePlanModel.infoModel!.fullTT!;
                                        });
                                      }else if(index==1){
                                        setState(() {
                                          currentIndex=1;
                                          temList = browsePlanModel.infoModel!.topUp!;
                                        });
                                      }else if(index==2){
                                        setState(() {
                                          currentIndex=2;
                                          temList = browsePlanModel.infoModel!.threeFourG!;
                                        });
                                      }else if(index==3){
                                        setState(() {
                                          currentIndex=3;
                                          temList = browsePlanModel.infoModel!.twoG!;
                                        });
                                      }else if(index==4){
                                        setState(() {
                                          currentIndex=4;
                                          temList = browsePlanModel.infoModel!.sms!;
                                        });
                                      }else if(index==5){
                                        setState(() {
                                          currentIndex=5;
                                          temList = browsePlanModel.infoModel!.combo!;
                                        });
                                      }else if(index==6){
                                        setState(() {
                                          currentIndex=6;
                                          temList = browsePlanModel.infoModel!.romaing!;
                                        });
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                          list[index],
                                          style: TextStyle(color: currentIndex==index?Color(0xFFFFAE00):Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: getListViewPlan()
                    )
                  ],
                ),
              ),
              buildShowDialog(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget getListViewPlan(){
    return Container(
      child: ListView.builder(
          itemCount: temList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.pop(context, temList[index]!=null?temList[index].price:"");
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "\u20B9 "+(temList[index]!=null?temList[index].price:""),
                                style: TextStyle(fontSize: 20, color: Color(0xFFFFAE00)),
                              ),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  (temList[index]!=null?temList[index].desc:""),
                                  //'Talktime of Rs. 7.47, Talktime validity Unrestricted, No Service Validity available with this Talktime Pack',
                                  style: TextStyle(fontSize: 14, color: Colors.white)
                              ),
                              Text(
                                  "Validity : "+(temList[index]!=null?temList[index].validity:""),
                                  style: TextStyle(fontSize: 14, color: Colors.white)
                              ),
                              Text(
                                  "Last update : "+(temList[index]!=null?temList[index].validity:""),
                                  style: TextStyle(fontSize: 14, color: Colors.white)
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            child: Icon(Icons.arrow_forward_ios,color: Color(0xFFFFAE00),)
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  buildShowDialog(BuildContext context) {
    return
      Visibility(
          visible: isProgessBarVisible,
          child:
          Center(
              child: CircularProgressIndicator(
                color: Color(0xFFF7941D),
              )
          )
      );
  }

  loadProgress(){
    if(isProgessBarVisible == true){
      setState(() {
        isProgessBarVisible = false;
      });
    }
    else{
      setState(() {
        isProgessBarVisible = true;
      });
    }

  }

  Future getPlan()async{
    var networkServiceApi = new NetworkApiServicePaySprint();
    loadProgress();
    try{
      Map<String,dynamic> jsonbody = {
        "circle": widget.circle,
        "op": widget.operator
      };
      var res = await networkServiceApi.postResponse(ApiEndPointsPaySprint().browsePlan, jsonbody);
      print(res);
      var model = BrowsePlanModel.fromJson(res);
      if(model.status!){
        setState(() {
          browsePlanModel = model;
          temList=model.infoModel!.fullTT??[];
        });
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please try again"),
        ));
      }

      loadProgress();
      print(res);
    }catch(e){
      loadProgress();
      print(e);
    }
  }
}
