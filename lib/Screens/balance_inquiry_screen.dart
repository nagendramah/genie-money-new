import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BalanceInquiry extends StatefulWidget{
  @override
  _BalanceInquiry createState() {
    // TODO: implement createState
    return _BalanceInquiry();
  }
}

class _BalanceInquiry extends State<BalanceInquiry>{
  late List<String> bankList;
  late List<String> deviceList;
  late String selectedBank;
  late String selectedDevice;

  @override
  void initState() {
    bankList = [
      "Select Bank",
      "Airtel Payment Bank",
      "Allahabad Bank",
      "Allahabas UP Gramin Bank",
      "Andhra Bank",
      "Andhra Pradhesh Grameena Vikash Bank",
      "Anshra Pragathi Grameena Bank",
      "AP Mahesh Coop Urban Bank Ltd",
      "Assam Gramin Vikash Bank",
      "AU Small Finance Bank",
      "Axis Bank",
      "Bangiya Gramin Viksah Bank",
      "Bank Od Baroda",
      "Bank Of India",
      "Bank Of Maharashtra",
      "Baroda Rajasthna Kshetriya Gramin Bank",
      "Boroda Uttar Pradesh Gramin Bank",
      "Canara Bank",
      "Catholic Syrian Bank",
      "Central Bank Of India",
      "Chaitanya Godavari Gramin Bank",
      "Chhattisgarh Rajaya Gramin Bank",
      "City Union Bamk",
      "Corporation Bank",
      "Dena Bank",
      "Dena Gujarat Gramin Bank",
      "Ellaquai Dehati Bank",
      "Equitas Small Finance Bank",
      "Fino Payments Bank",
      "Gramin bank of Aryavart",
      "HDFC Bank",
      "Himachal Pradesh Gramin Bank",
      "ICICI Bank",
      "IDBI Bank",
      "IDFC First Bank",
      "India Bank",
      "India Overseeas Bank",
      "IndusInd Bank",
      "Jammu & Kashmir Bank",
      "Jharkhand Gramin Bank",
      "Karnataka Bank",
      "Karnataka Gramin Bank",
      "Karnataka Vikas Grameena Bank",
      "Karur Vysya Bank",
      "Kashi Gomati Samyut Gramin Bank",
      "Kerala Gramin Bank",
      "Kotak Mahindra Bank",
      "Lakshmi Vilas Bank",
      "Langpi Dehangi Rural Bank",
      "Madhya Bihar Gramin Bank erstwhile Dakshin Bihar G",
      "Madhyanchal Gramin Bank",
      "Maharashtra Gramin Bank",
      "Mainpur Rural Bank",
      "Meghalaya Rural Bank",
      "Mizoram Rural Bank",
      "Narmada Jhabua Gramin Bank",
      "Odisha Gramya Bank",
      "Oriental Bank Of Commerce",
      "Pallavan Grama Bank",
      "Pandyan Grama Bank",
      "Paschim Banga Gramin Bank",
      "Pragathi Krishna Gramin Bank",
      "Prathama Bank",
      "Puduvai Bharathiar Grama Bank",
      "Punjab & Sind Bank",
      "Punjab Gramin Bank",
      "Punjab National Bank",
      "Purvanchal Gramin Bank",
      "Rajasthan Marushara Gramin Bank",
      "Ratnakar Bank",
      "Saptagiri Grameena Bank",
      "Sarva Haryana Gramin Bank",
      "sarva UP Gramin Bank",
      "Saurashtra Gramin Bank",
      "Shivalik Mercantile Cooperative Bank",
      "South India Bank",
      "State Bank Of India",
      "Syndiacte Bank",
      "Tamilnad Mercantile Bank",
      "Telangana Grameena Bank",
      "The Saraswat Co-operative Bank Ltd",
      "Tripura Gramin Bank",
      "UCO Bank",
      "Ujjivan SMall Finance Bank Limited",
      "Union Bank Of India",
      "United Bank Of India",
      "Utkal Gramin Bank",
      "uttar Banga Kshetriya Gramin Bank",
      "Uttar Bihar Grameen Bank",
      "Uttarakhand Gramin Bank",
      "Vananchal Gramin Bank",
      "Vidarbha konkan Gramin Bank",
      "Vijaya Bank",
      "YES Bank"
    ];

    deviceList = [
      "Select Device",
      "Mantra",
      "Startek",
      "Morpho"
    ];
    selectedBank = bankList[0];
    selectedDevice = deviceList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "Balance Inquiry",
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
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10),
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
/*
              Container(
                child: Image(
                  image: const AssetImage('images/india_logo.png'),
                  width: width,
                  height: 60,
                )
              ),
*/
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: TextField(
                      //controller: _email_mobile_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Mobile Number',
                        isDense: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),

                    width: width,
                    //color: Color(0xFFFFAE00),
                    child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                          label: Text("Bank"),
                          isDense: true,
                        ),
                        dropdownColor: Color(0xFF3A3A3A),
                        isExpanded: true,
                        hint: Text('Please Select Bank'),
                        value: selectedBank,
                        items: bankList.map((e){
                          return DropdownMenuItem(
                            child: new Text(e,
                              style: TextStyle(color: Color(0xFFFFAE00)),
                            ),
                            value: e,);
                        }).toList(),
                        onChanged: (newValue){
                          setState(() {
                            selectedBank = newValue.toString();
                          });
                        }),

                  ),
/*              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                width: width,
                //color: Color(0xFFFFAE00),
                  child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                        label: Text("Device"),
                        isDense: true,
                      ),
                      dropdownColor: Color(0xFF3A3A3A),
                      isExpanded: true,
                      hint: Text('Please Select Device'),
                      value: selectedDevice,
                      items: deviceList.map((e){
                        return DropdownMenuItem(
                          child: new Text(e,
                            style: TextStyle(color: Color(0xFFFFAE00)),
                          ),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          selectedDevice = newValue.toString();
                        });
                      }),
              )*/
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: TextField(
                      //controller: _email_mobile_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color:Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color:Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Aadhar Number',
                        isDense: true,
                      ),
                    ),
                  ),
/*
              Container(
                  child: Image(
                    image: const AssetImage('images/aadhar.png'),
                    width: width,
                    height: 30,
                  )
              ),
*/
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 40.0),
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }

}