import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Model/dmt/BankListModel.dart';


class AadharCardPayScreen extends StatefulWidget {
  const AadharCardPayScreen({Key? key}) : super(key: key);

  @override
  State<AadharCardPayScreen> createState() => _AadharCardPayScreenState();
}

class _AadharCardPayScreenState extends State<AadharCardPayScreen> {

  List<BankModel>? bankList = [];
  List<BankModel>? tempBankList = [];
  late BankModel selectedBank;
  double width=0.0;
  double height=0.0;
  BankModel? selectedBankModelp;
  String selectedBankNamep ="Selecte Bank";

  
  @override
  void initState() {
    getBankList();
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "Pay via Aadhar Card",
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
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  //controller: _card_number_controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Mobile Number',
                    isDense: true,
                  ),
                ),
              ),

              getBankListDropDown(),

              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  //controller: _card_number_controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Aadhar Number',
                    isDense: true,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                        "Fingerprint Authentication",
                        style: TextStyle(color: Colors.white, fontSize: 20,fontWeight:FontWeight.bold ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Fingerprint Authentication",
                        style: TextStyle(color: Color(0xFFFFAE00),),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        //_authenticate();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                          child: Icon(Icons.fingerprint, size: 100,color: Colors.white,)
                      ),
                    )
                    
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:10, bottom: 10),
                child: ElevatedButton(
                child: Text(
                  "Proceed",
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                    Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () async{

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<BankModel>> getBankList()async{
    String data =await DefaultAssetBundle.of(context).loadString("assets/dmt_bank_list.json") ;

    final jsonResult = json.decode(data);
    setState(() {
      bankList = (BankListModel.fromJson(jsonResult).list);
      bankList!.sort((a,b)=>a.bankName.compareTo(b.bankName));
      tempBankList!.addAll(bankList!);
      //bankList!.insertAll(0, [new BankModel(bankid: 0, bankName: "Select Bank")]);
    });

    print(jsonResult);
    selectedBank= bankList!.first;
    return bankList!;
  }

  Widget getBankListDropDown(){

    return GestureDetector(
      onTap: (){
        setState((){
          tempBankList=bankList;
        });
        Dialog bankDialog = Dialog(
          backgroundColor: Color(0xFF3A3A3A),
          child: StatefulBuilder(builder: (context,setStateNew) {

            return Container(
              height: height - 100,
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
                                      tempBankList = bankList!.where((element) => element.bankName.contains(value)).toList();
                                    }else{
                                      tempBankList = bankList!;
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
                          itemCount: tempBankList!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                setState((){
                                  selectedBankModelp=tempBankList![index];
                                  selectedBankNamep=selectedBankModelp!.bankName;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  tempBankList![index].bankName,
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
                selectedBankNamep,
                style: TextStyle(color: Color(0xFFFFAE00),fontSize: 16),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.arrow_drop_down,color: Color(0xFFFFAE00),)
          ],
        ),
      ),
    );
  }



  

}
