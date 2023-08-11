import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:genie_money/Model/cowin_model.dart';
import 'package:genie_money/Screens/vaccination_dashboard.dart';

class CowinScreen extends StatefulWidget {
  @override
  _CowinScreenState createState() => _CowinScreenState();
}

class _CowinScreenState extends State<CowinScreen> {
  List<CowinModel> list = [];

  @override
  void initState() {
    list = [
      CowinModel(
          "Share vaccination Status",
          "Procees >",
          "images/cowin_status.png",
          "https://cdn-api.co-vin.in/api/v3/vaccination/status/knowYourStatus"),
      CowinModel(
          "Vaccination Information",
          "Procees >",
          "images/cowin_information.png",
          "https://www.youtube.com/results?search_query=cowin+vaccination+info+"),
      CowinModel("Vaccination(Login/Register)", "Procees >",
          "images/cowin_login.png", "https://selfregistration.cowin.gov.in/"),
      CowinModel("Vaccination Certificate", "Procees >",
          "images/cowin_certificate.png", "https://verify.cowin.gov.in/"),
      CowinModel(
          "Vaccine Availability",
          "Procees >",
          "images/cowin_vaccination_availabitiy.png",
          "https://selfregistration.cowin.gov.in/"),
      CowinModel(
          "Vaccination Dashboard",
          "Procees >",
          "images/cowin_vaccination_dashboard.png",
          "https://dashboard.cowin.gov.in/"),
      CowinModel("Frequently Asked Question", "See All FAQs >",
          "images/cowin_faq.png", "https://www.cowin.gov.in/faq"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "CoWIN",
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
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: height * 0.25),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VaccinationDashboardScreen(
                              list[index].optionName, list[index].url)));
                },
                child: Container(
                  child: Card(
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        side: BorderSide(
                          color: Color(0xFFFFAE00),
                          width: 2.0,
                        )),
                    color: const Color(0xFF444444),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: Image(
                              image: AssetImage(list[index].imagePath),
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 5.0, right: 5.0),
                            child: Text(
                              list[index].optionName,
                              style: const TextStyle(
                                color: Color(0xFFFFAE00),
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
