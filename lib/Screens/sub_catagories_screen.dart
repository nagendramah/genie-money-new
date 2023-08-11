import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// ignore: unused_import
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:genie_money/Model/SubCategoryModel.dart';
import 'package:genie_money/Model/service_list_model.dart';
import 'package:genie_money/Screens/sub_sub_categories_screen.dart';

import '../data/remote/network/NetworkApiServiceNewVendor.dart';
import 'demo.dart';

// ignore: must_be_immutable
class SubCatagoriesScreen extends StatefulWidget {
  String title;
  final String categoryId;
  final String pincode;
  bool get hasFocus => false;




  SubCatagoriesScreen({ required this.title, Key? key, required this.categoryId, required this.pincode}) : super(key: key);

  @override
  _SubCatagoriesScreenState createState() => _SubCatagoriesScreenState();
}

class _SubCatagoriesScreenState extends State<SubCatagoriesScreen> {
  late List<ServiceModel> servicesList;
  List<Category> SubCatList = [];
  List<Category> FileterSubCatList = [];
  List<Category> listc = [];
  bool isSearching = false;


  @override
  void initState() {
    if (widget.title == "General Store") {
      servicesList = [
        ServiceModel("Dmart", "images/dmart_logo.png", 5.0),
        ServiceModel("Big Bazzar", "images/bigbazzar_logo.png", 4.5),
        ServiceModel("Metro Mall", "images/metro_mall.png", 4.0),
        ServiceModel("Harbans Karyana Store", "images/general_store.png", 3.5)
      ];
    } else {
      servicesList = [
        ServiceModel("Atharva Enterprises", "images/appliance_repair.png", 4.5),
        ServiceModel("Pawan Enterprises", "images/chimney.png", 3.5),
      ];
    }

    super.initState();
    getDatas();

  }
  void _filterCountries(String value) {

    SubCatList = listc.where((element) => element.merchantName!.contains(value)).toList();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: !isSearching
              ? Text(widget.title,style: const TextStyle(color:  Color(0xFFFFAE00)))
              : TextField(
            onChanged: (value) {
              _filterCountries(value);
            },
            style: const TextStyle(color:  Color(0xFFFFAE00)),
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.search,
                  color:  Color(0xFFFFAE00),
                ),
                hintText: "Search Merchants",
                hintStyle: TextStyle(color:  Color(0xFFFFAE00))),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFFFFAE00),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            isSearching
                ? IconButton(
              icon: const Icon(Icons.cancel),
              color: const Color(0xFFFFAE00),

              onPressed: () {
                setState(() {
                  this.isSearching = false;
                  FileterSubCatList = SubCatList;
                });
              },
            )
                : IconButton(
              icon: const Icon(Icons.search),
              color: const Color(0xFFFFAE00),

              onPressed: () {
                setState(() {
                  this.isSearching = true;
                });
              },
            )
          ],
        ),

        body: Container(
          margin: const EdgeInsets.all(10.0),

          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {

                var datasend = SubCatList[index];
                return GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) =>
                            EssentialDetailsScreen( ad3: datasend.ad3.toString(), companyAddress: datasend.address2.toString()
                              , companyAddress2: datasend.address.toString(), ad2: datasend.ad2.toString(),
                              companyPhone: datasend.phone.toString(), companyEmail: '', ad4: datasend.ad4.toString(),
                              companyName: datasend.merchantName.toString(), ad1:datasend.ad1.toString() , title: datasend.categoryName.toString(), pincode: datasend.pincode.toString(), remark: datasend.remark.toString(), district: datasend.city.toString(), state: datasend.state.toString(), taluka: datasend.city.toString(),));

                    Navigator.push(context, route);
                  },
                  child: Card(
                    color: const Color(0xFF3A3A3A),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(

                                SubCatList[index].ad1=="https://geniemoneyy.com/genie_money/public/uploads/essential/"?"images/logogeniemoney.png":SubCatList[index]
                                    .ad1
                                    .toString(),
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                                child: Text(
                                  SubCatList[index].merchantName.toString().length>22?"${
                                      SubCatList[index].merchantName.toString().substring(0,22)
                                  }....":  SubCatList[index].merchantName.toString(),

                                  overflow: TextOverflow.ellipsis,

                                  softWrap: true,


                                  style: const TextStyle(
                                      color: Color(0xFFFFAE00),
                                      fontSize: 18.0,),

                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: Color(0xFFFFAE00),
                          size: 40.0,
                        ),
                      ],
                    ),
                  ),
                );
              },
              // ignore: unnecessary_null_comparison
              itemCount: SubCatList==null?0:SubCatList.length
          ),
        ),
      ),
    );
  }

  Future _alertDialog(BuildContext context) {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          contentText: 'Getting Activated Soon',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  Future<void> getDatas() async {
    String url =
        "https://geniemoneyy.com/genie_money/public/index.php/getessentials?""pincode="+widget.pincode+"&"+"category="+widget.categoryId;

    var network = new NewVendorApiService();
    var response = await network.getresponse(url);
    print("" + response!.toString());
    print("" + url);
    var Sub_CatList = SubCategoryModel.fromJson(response);

    setState(() {
      SubCatList = Sub_CatList.category!;

    });

  }



/*
  Future getDatas() async{
    String url =
        "http://165.22.219.135/genie_money/public/index.php/categoryimage";
    var network = new NewVendorApiService();
    var res = await network.getresponse(url);
*/
/*    String url =
        "http://165.22.219.135/genie_money/public/index.php/categoryimage";
    var network = new NewVendorApiService();
    var res = await network.getresponse(url);*//*

    setState((){
    });
  }
*/
}


/*
void _filterCountries(String value) {
}
*/





class DataSearch extends SearchDelegate<String> {
  final services = [
    "Air Conditioner",
    "Chimney",
    "Geyser",
    "Microwave",
    "Refrigerator",
    "Television",
    "Washing Machine",
    "Water Purifier",
    "Appliance Protection Plan"
  ];

  final recentSearches = [
    "Air Conditioner",
    "Geyser",
    "Refrigerator",
    "Washing Machine"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for the app bar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of app bar
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when some one searches for something
    final suggestionList = query.isEmpty
        ? recentSearches
        : services
        .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (suggestionList[index] == "Air Conditioner") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubSubCategoriesScreen(
                        suggestionList[index])));
          } else {
            _alertDialog(context);
          }
        },
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Color(0xFF3A3A3A),
        );
      },
    );
  }

  Future _alertDialog(BuildContext context) {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          contentText: 'Getting Activated Soon',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}