import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/scan_pay_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';



class QRCodeScannerScreen extends StatefulWidget {
  const QRCodeScannerScreen({Key? key}) : super(key: key);

  @override
  State<QRCodeScannerScreen> createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> with WidgetsBindingObserver{
  Barcode? result;
  bool isVisible= true;
  QRViewController? qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

/*
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
    qrViewController!.pauseCamera();

    }
    qrViewController!.resumeCamera();

  }
*/

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    isVisible = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (qrViewController != null && mounted) {

      qrViewController!.pauseCamera();
      qrViewController!.resumeCamera();
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: <Widget>[

                Expanded(flex: 4, child: _buildQrView(context)),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScanPayScreen()));
                  },
                  child: Visibility(
                    visible:isVisible=false ,
                    child: Row(children: [
                      Text("skip"),
                      Icon(Icons.arrow_forward)
                    ],),
                  ),
                )
                /*Expanded(
                  flex: 1,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        if (result != null)
                          Text(
                              'Barcode Type: '+(result!.format).toString()+   'Data: '+result!.code.toString())
                        else
                          const Text('Scan a code'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await qrViewController?.toggleFlash();
                                    setState(() {});
                                  },
                                  child: FutureBuilder(
                                    future: qrViewController?.getFlashStatus(),
                                    builder: (context, snapshot) {
                                      return Text('Flash: ${snapshot.data}');
                                    },
                                  )),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await qrViewController?.flipCamera();
                                    setState(() {});
                                  },
                                  child: FutureBuilder(
                                    future: qrViewController?.getCameraInfo(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null) {
                                        return Text(
                                            'Camera facing '+(snapshot.data!).toString());
                                      } else {
                                        return const Text('loading');
                                      }
                                    },
                                  )),
                            )
                          ],
                        ),
                        *//*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await qrViewController?.pauseCamera();
                                },
                                child: const Text('pause',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await qrViewController?.resumeCamera();
                                },
                                child: const Text('resume',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )*/
              ],
            ),
            Positioned.fill(

                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10,left: 5),
                          child: IconButton(
                            icon:Icon(Icons.clear,color: Colors.white),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child:
                              FutureBuilder(
                                future: qrViewController?.getFlashStatus(),
                                builder: (context, snapshot) {
                                  return IconButton(
                                    icon: Icon(Icons.highlight,color: Colors.white,),
                                    onPressed: ()async{
                                      await qrViewController?.toggleFlash();
                                    },
                                  );
                                },
                              )
                            ),
                              /*IconButton(
                                icon: Icon(Icons.highlight,color: Colors.white,),
                                onPressed: ()async{
                                  await qrViewController?.toggleFlash();
                                },
                              ),*/
                            Container(
                              margin: EdgeInsets.only(right: 10, top: 10, bottom: 10,),
                              child: IconButton(
                                  icon: Icon(Icons.image,color: Colors.white,),
                                  onPressed: (){},
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this genie we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Color(0xFFFFAE00),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.qrViewController = controller;
    });
    controller.scannedDataStream.listen((scanData) async{
      setState(() {
        result = scanData;
      });


      await qrViewController!.pauseCamera();
      var resultBackpress = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ScanPayScreen()));

      if(resultBackpress){
        await qrViewController!.resumeCamera();
      }
      //Fluttertoast.showToast(msg: result!.code.toString());
    });
  }

  /*@override
  void didChangeAppLifecycleState(AppLifecycleState state)async {
    if(state == AppLifecycleState.resumed){
      print("resumed");
      //Fluttertoast.showToast(msg: result!.code.toString());
      await qrViewController!.resumeCamera();
    }

  }*/

  @override
  void dispose() {
    //print("result : "+result!.code.toString());
    qrViewController?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    //log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }


}
