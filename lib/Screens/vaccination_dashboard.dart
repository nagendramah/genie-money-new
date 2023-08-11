// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class VaccinationDashboardScreen extends StatefulWidget {
  String screenName;
  String url;
  @override
  _VaccinationDashboardScreenState createState() =>
      _VaccinationDashboardScreenState();

  VaccinationDashboardScreen(this.screenName, this.url);
}

class _VaccinationDashboardScreenState
    extends State<VaccinationDashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          widget.screenName,
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
            // child: WebView(
            //     debuggingEnabled: true,
            //     initialUrl: widget.url,
            //     javascriptMode: JavascriptMode.unrestricted
            // ),
            ),
      ),
    );
  }
}
