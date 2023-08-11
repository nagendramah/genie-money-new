import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genie_money/Screens/splash_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => {
    runApp(
      MyApp(),
    ),
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF111111),
      100: Color(0xFF111111),
      200: Color(0xFF111111),
      300: Color(0xFF111111),
      400: Color(0xFF111111),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF111111),
      700: Color(0xFF111111),
      800: Color(0xFF111111),
      900: Color(0xFF111111),
    },
  );
  static const int _blackPrimaryValue = 0xFF111111;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var pass;
  late bool locked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Genie Moneyy',
        theme: ThemeData(
          primarySwatch: MyApp.primaryBlack,
          unselectedWidgetColor: const Color(0xFFFFAE00),
        ),
        home:SplashScreen()
        // locked == true ? FingerprintAuth() : SplashScreen()
      //   home: const FingerprintAuth(),
      //home:  FingerprintPage(),
      //   home:pass.toString()=="1"?SplashScreen():EnterPasswordScreen(),
    );
  }

  @override
  void initState() {
    getallproduct();

    setState(() {
      // loadData();
    });
    //   pass = Constants.apppass;
    super.initState();
  }

  Future<void> getpass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pass = prefs.getString("apppass") ?? "";
    print(pass.toString());
  }
  getallproduct() async {
    final url = Uri.parse(
        'https://leadapi.banksathi.com/api/b2b/productByCategory?category_id=13');
    final response = await http.get(url, headers: {
      "x-api-key":
      "U042VVRFTjhESnZVeFVlbjgrRVlGZ3BnWTJ2Nnk3UlZPSkE4ckZ3UTZzMD0=",
      "IV": "OStGaWg3ZnpFV3lvSERZRHo2SnpLUT09"
    });
    if (response.statusCode == 200) {
      print("succees");
    }
  }
  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      locked = prefs.getBool("lock")!;
    });
  }
}