import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';

class TranscationHistory extends StatefulWidget {
  const TranscationHistory({Key? key}) : super(key: key);

  @override
  State<TranscationHistory> createState() => _TranscationHistoryState();
}

class _TranscationHistoryState extends State<TranscationHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "History",
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
        child: Container(
          child: ListView.builder(
            itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: const Color(0xFFFFAE00), width: 1)
                  ),
                  margin: const EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top:4,),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Benficiary name ",
                                        style: TextStyle(color: Color(0xFFFFAE00), fontSize: 16),
                                    ),
                                    Text(
                                        "Arati",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top:4,),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amount ",
                                      style: TextStyle(color: Color(0xFFFFAE00), fontSize: 16),
                                    ),
                                    Text(
                                      "\u20B9"+" "+"2000",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top:4,),
                                child: const Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Date ",
                                          style: TextStyle(color: Color(0xFFFFAE00), fontSize: 16),
                                        ),
                                        Text(
                                          "22-06-2022",
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
                                          "11:30:05 AM",
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
                      const Icon(Icons.arrow_forward_ios, color: Color(0xFFFFAE00),)
                    ],
                  ),
                );
              })
          ),
        ),
    );
  }
}
