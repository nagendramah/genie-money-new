import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Model/credit_card_transaction_historyModel.dart';
import '../data/remote/network/NetworkApiServiceServer.dart';


class CreditCardTranscationHistory extends StatefulWidget {
  const CreditCardTranscationHistory({Key? key}) : super(key: key);

  @override
  State<CreditCardTranscationHistory> createState() => _CreditCardTranscationHistoryState();
}

class _CreditCardTranscationHistoryState extends State<CreditCardTranscationHistory> {
  List<Listhistory>? list;

  @override
  void initState() {
    ListCall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "Transcation History",
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

                itemCount: list==null?0:list!.length,
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
                            list?[index].status==null||list?[index].status=="failed"?"Failed":list![index].status!,

                                  style: TextStyle(color: list?[index].status==null||list?[index].status=="failed"?const Color(
                                      0xFFF80000):Color(0xFF48C500),
                                      fontSize: 25),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    mainAxisAlignment: MainAxisAlignment.start,
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

                                      Text(
                                          list?[index].holderName==null?"":list![index].holderName!,
                                        style: TextStyle(color: Color(
                                            0xFF262626), fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Card no",
                                        style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 15),
                                      ),
                                      Text(
                                        "    :",
                                        style: TextStyle(color: Color(
                                            0xFF000000),fontWeight: FontWeight.bold, fontSize: 15),
                                      ),

                                      Text(
                                        list?[index].cardNo==null?"":list![index].cardNo!,
                                        style: TextStyle(color: Color(
                                            0xFF262626), fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),

                                Container(
                                  child: Row(


                                    children: [
                                      Text(
                                        "Amount",
                                        style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 15),
                                      ),
                                      Text(
                                        "    :",
                                        style: TextStyle(color: Color(
                                            0xFF000000),fontWeight: FontWeight.bold, fontSize: 15),
                                      ),

                                      Text(
                                        "\u20B9 "+(list?[index].amount==null?"":list![index].amount!),
                                        style: TextStyle(color: Color(
                                            0xFF262626), fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),

                                Align(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Remarks",
                                          style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        Text(
                                          " :",
                                          style: TextStyle(color: Color(
                                              0xFF000000),fontWeight: FontWeight.bold, fontSize: 18),
                                        ),

                                        Text(
                                            list?[index].remark==null?"":list![index].remark!,
                                          style: TextStyle(color: Color(
                                              0xFF262626), fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),

                                ),
                                Align(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Date",
                                          style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        Text(
                                          "        :",
                                          style: TextStyle(color: Color(
                                              0xFF000000),fontWeight: FontWeight.bold, fontSize: 18),
                                        ),

                                        Text(
                                          ((list?[index].date_time==null?"":list![index].date_time!.toString()).split(" "))[0],
                                          style: TextStyle(color: Color(
                                              0xFF262626), fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),

                                ),
                                Align(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Time",
                                          style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        Text(
                                          "       :",
                                          style: TextStyle(color: Color(
                                              0xFF000000),fontWeight: FontWeight.bold, fontSize: 18),
                                        ),

                                        Text(
                                          ((list?[index].date_time==null?"":list![index].date_time!.toString()).split(" "))[1],                                          style: TextStyle(color: Color(
                                              0xFF262626), fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),

                                ),
Container(
  child: Row(
    children: [
      Text(
        "Ref id",
        style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 15),
      ),
      Text(
        "     :",
        style: TextStyle(color: Color(
            0xFF000000),fontWeight: FontWeight.bold, fontSize: 18),
      ),

      Text(
          list?[index].refId==null?"":list![index].refId!,
        style: TextStyle(color: Color(
            0xFF262626), fontSize: 15),
      )
    ],
  ),
),
                                Align(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        const Text(
                                          "phone no",
                                          style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        const Text(
                                          ":",
                                          style: TextStyle(color: Color(
                                              0xFF000000),fontWeight: FontWeight.bold, fontSize: 18),
                                        ),

                                        Text(
                                          list?[index].mobileNo==null?"":list![index].mobileNo!,
                                          style: TextStyle(color: Color(
                                              0xFF262626), fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),

                                ),


                                Align(
                                  child: Container(
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Network",
                                          style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        Text(
                                          " :",
                                          style: TextStyle(color: Color(
                                              0xFF000000),fontWeight: FontWeight.bold, fontSize: 18),
                                        ),

                                        Text(
                                          "VISA",
                                          style : TextStyle(color: Color(
                                              0xFF262626), fontSize: 18),
                                        )
                                      ],
                                    ),
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
                                        Text(
                                          list?[index].cardNo==null?"":list![index].cardNo!,

                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        )
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
                                        Text(
                                           list?[index].amount==null?"":list![index].amount!,



                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        )
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
                                              ((list?[index].date_time==null?"":list![index].date_time!.toString()).split(" "))[0],
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
                                              ((list?[index].date_time==null?"":list![index].date_time!.toString()).split(" "))[1],
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

  Future ListCall()async{
      try{
        NetworkApiServiceServer apiServiceServerpi= NetworkApiServiceServer();
        var response = await apiServiceServerpi.getResponse("getcreditcarddata?userid=24");
        CreditCardTransactionHistoryModel model =CreditCardTransactionHistoryModel.fromJson(response);
        setState((){
          list=model.list;
        });

    } catch (e){
        print(e);
    }
  }
}
