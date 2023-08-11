
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/paymnet_saveinfo.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';



class PaymentForm extends StatefulWidget {
  const PaymentForm(String _name, String _email, String _phone, String _Address ,String _amount,{Key? key}) : super(key: key);

  //CreditCardLeadGeneration( {Key? key,required this.bankname}) : super(key: key);

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}
var appPassword;
late List<String> brokers;

class _PaymentFormState extends State<PaymentForm> {
   TextEditingController _name = TextEditingController();
   TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _Address = TextEditingController();
   TextEditingController _amount = TextEditingController();
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String CustomerType = "Partner";
  var code;
  late String selected_type = "Customer Type";
  bool isProgessBarVisible = false;
  bool is_mobile_linked_aadhar = true;
  
  String url='';

 String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your phone number';
    }
      if (value.length != 10) {
    return 'Please enter a 10-digit phone number';
  }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z\d-]+$');

  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email';
  }

    // You can add more complex email validation logic here
    return null;
  }

  String? validateAddress(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  String? validateAmount(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the amount';
    }
      if (double.tryParse(value) == null) {
    return 'Please enter a valid numeric amount';
  }
    // You can add more complex validation logic for amount if needed
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
      title: Text(
  "Enter the following details to Pay",
  style: TextStyle(
    color: kWhite,
    fontSize: 17,
  ),
),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: kWhite,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ),

      
      body: Form(
       key: _formKey, 
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                    controller: _name,
                    //controller: _email_mobile_controller,
                    style: const TextStyle(color: greyColor),
                    cursorColor: greyColor,
                    keyboardType: TextInputType.text,
                    //controller: _email_controller,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(color:navyBlueColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color:navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color:navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color:navyBlueColor),
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Name',
                      isDense: true,
                    ),
                  validator: validateName,
      
                    ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                    controller: _phone,
                    //readOnly: cid.isEmpty && type == "Merchant" ? true : false,
                    //controller: _email_mobile_controller,
                    style: const TextStyle(color: greyColor),
                    cursorColor: greyColor,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    //controller: _email_controller,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(color:navyBlueColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color:navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color:navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color:navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: navyBlueColor),
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Mobile Number',
                      isDense: true,
                    ),
                      validator: validatePhone,
                    ),
              ),
      
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                    controller: _email,
                    //controller: _email_mobile_controller,
                    style: const TextStyle(color:greyColor),
                    cursorColor: greyColor,
                   keyboardType: TextInputType.emailAddress,
                    //controller: _email_controller,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(color: navyBlueColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color:navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color:navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: navyBlueColor),
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Email',
                      isDense: true,
                    ),
                      validator: validateEmail,
                    ),
              ),
      
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                    controller: _Address,
                    //controller: _email_mobile_controller,
                    style: const TextStyle(color: greyColor),
                    cursorColor: greyColor,
                    keyboardType: TextInputType.text,
                    //controller: _email_controller,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(color: navyBlueColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: navyBlueColor),
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Address',
                      isDense: true,
                    ),
                      validator: validateAddress,
                    ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                    controller: _amount,
                    style: const TextStyle(color: greyColor),
                    cursorColor: greyColor,
                    keyboardType: TextInputType.number,
                    //controller: _email_controller,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(color: navyBlueColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: navyBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: navyBlueColor),
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Amount',
                      isDense: true,
                    ),
                      validator: validateAmount,
                    ),
              ),
      
              Container(
                height: 40,
                margin: const EdgeInsets.all(10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
     // postdata(_name.text.toString(),_email.text.toString(),_phone.text.toString(),_amount.text.toString(),_Address.text.toString()) ;
    //  // print("Hi am here "+_name.text.toString(),);
    //                   //submitForm();
                      // print(_name.text.toString());
                      // print(_email.text.toString());
                      // print(_phone.text.toString());
                      // print(_amount.text.toString());
                      //  print(_Address.text.toString());

                         submitForm(); 
                         
                        

                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          color: kWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                      backgroundColor: navyBlueColor,
                      //shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
      
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    var rng = new Random();
    code = rng.nextInt(900000) + 100000;
  }


  /*_launchURL(String s) async{
    var url = s;
    if (url.isNotEmpty) {
      launchUrl(Uri.parse(url),mode:LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }*/

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

/*  _launchURL() async {
    var url = 'http://165.22.219.135/genie_money/index.php/payment?encData='+vpulsirenc+"&"+'clientCode='+jnkimata;


    if (await canLaunchUrl(Uri.parse(url))) {
      print("myurlll"+url.toString());
      await launchUrl(Uri.parse(url),/mode: LaunchMode.externalApplication,/);
    } else {
      print("my urls"+url.toString());
      throw 'Could not launch $url';
    }
    _launchURRL() async{

    }
  }*/
  var P8c3WQ7ei;
  var LPSD1;
  var rohanurl;
  var NITE5;


  //'https://stage-securepay.in/SabPaisa/sabPaisaInit?v=1?encData='+'vipulenc'+"&"+'clientcode='+'jankiclientcode';
  //'http://165.22.219.135/genie_money/index.php/payment?encData='+'vipulenc'+"&"+'clientcode='+'jankiclientcode';
  //https://stage-securepay.sabpaisa.in/SabPaisa/sabPaisaInit?v=65NBmPsQ1HF8ULVKntTRX2+j6HdTlGAn8Gx7I9VkNy4trnEejjGYNXpW2IJ2PKtiaUP/jyjORPL4CGZYbdFzLF1MjjyBeK9mw/ajVfK1hF0Y8uordwhInEG3ZXdqDzxDfdNmc24Rn2RRFgeEDo2+aQZkXCNBHCnu63YkOkb4Z00PNkMN32gOx5nu5b9WGEfafdro6YTNOreC/FkicN7Ejc80r8NrkZPirAhckX08tjg7mxj6s5abCEqt7x06LiBRskbGsgDt/Q938ecJd/+Ezssxgbe0VIO+Oh5iY60hNZ2wo0eJMnPBYWbQnpmS3hBwBsXiGX26Seo/UQac92tPvtbJlpHKLWhBTf4sUPDLnxLfE+7H941uxxfvmHyYejHOKQepMCVTKvJMKU/2rjejNw==:b0xBMzhjd1Q2SVlOR3FiMw==LPSD1';
 // String urlpay = 'https://geniemoneyy.com/genie_money/index.php/payment?encData='+'P8c3WQ7ei'+"&"+'clientcode='+'NITE5';
  Future<void> postdata(String _name,String _email, String _phone, String _Address ,String _amount) async {
    final url = Uri.parse("https://geniemoneyy.com/genie_money/index.php/SaveInfo");
    final response = await http.post(url, body: {
      "payerName":_name,
      "payerEmail":_email,
      "payerMobile":_phone,
      "payerAddress":_Address,
      "amount":_amount,});
    print(response.body);
    var model =saveInfoFromJson(response.body);
    if (response.statusCode == 200) {
      setState(() {
      });
      P8c3WQ7ei=model.encData;
     // LPSD1=model.clientCode;
        NITE5=model.clientCode;
      rohanurl=model.url;
      print(rohanurl);
      print(response.body);
      print("object");
      print(" payment success api hit");
    } else {
    
      print("payment not success api not hit ");
    }
  }

  // Future<void> subPaisaPay(PaymentForm paymentRequest) async {
  //   //String url ="http://165.22.219.135/genie_money/index.php/payment";

  //   if (await canLaunchUrl(Uri.parse(urlpay))) {
  //     print("myurlll" + urlpay.toString());
  //     await launchUrl(Uri.parse(urlpay),
  //       mode: LaunchMode.externalApplication,
  //     );
  //   } else {
  //     print("my urls" + urlpay.toString());
  //     throw 'Could not launch $urlpay';
  //   }
  //   _launchURRL() async {

  //   }
  // }
    Future<void> subPaisaPay(PaymentForm paymentRequest) async {
    //String url ="http://165.22.219.135/genie_money/index.php/payment";
final String url = "https://geniemoneyy.com/genie_money/index.php/SaveInfo";
    if (await canLaunchUrl(Uri.parse(url))) {
      print("myurlll" + url.toString());
      await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      print("my urls" + url.toString());
      throw 'Could not launch $url';
    }
    _launchURRL() async {

    }
  }
  

    

void submitForm() {

    if (_formKey.currentState!.validate()) {
       final paymentRequest= PaymentForm (
    //  _name .toString();

    //  _phone.clear();
    //  _email.clear();
    //  _Address.clear();
    //  _amount.clear();

     _name.text.toString(),
     _phone.text.toString(),
     _email.text.toString(),
     _Address.text.toString(),
     _amount.text.toString(),
       );
     subPaisaPay(paymentRequest);
    
  }

    // if (_name.text.isEmpty) {
    //   showPopUp("Please enter name");
    // } else if (_phone.text.isEmpty) {
    //   showPopUp("Please enter phone number");
    // } else if (_email.text.isEmpty) {
    //   showPopUp("Please enter email");
    // } else if (_Address.text.isEmpty) {
    //   showPopUp("Please enter address");
    // } else if (_amount.text.isEmpty) {
    //   showPopUp("Please enter amount");
    // }

    
    //  else {
    //  // postdata();
    //   subPaisaPay();
    // }
 // }

  void showPopUp(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: navyBlueColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}


}