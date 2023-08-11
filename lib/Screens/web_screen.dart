import 'package:flutter/material.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import
import 'package:webview_flutter/webview_flutter.dart';

class WebIntent extends StatefulWidget {
  const WebIntent({Key? key}) : super(key: key);

  @override
  State<WebIntent> createState() => _WebIntentState();
}

class _WebIntentState extends State<WebIntent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: const Text(
          "Backend Dashboard",
          style: TextStyle(
            color: kWhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      // body: WebView(
      //   javascriptMode: JavascriptMode.unrestricted,
      //   initialUrl: "http://165.22.219.135/genie_money/index.php/dashboard",
      // ),
    );
  }

  @override
  void initState() {
    super.initState();
  _launch2URL();
/*
_launchURRL();
*/
  }

  _launchURRL() async {
    const url = 'https://geniemoneyy.com/genie_money/index.php/dashboard';
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
_launch2URL() async {
  const url = 'https://geniemoneyy.com/login/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}