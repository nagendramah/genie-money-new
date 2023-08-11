import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:genie_money/Model/service_list_model.dart';
import 'package:genie_money/Screens/essential_details_screen.dart';

// ignore: must_be_immutable
class SubSubCategoriesScreen extends StatefulWidget {
  String title;

  SubSubCategoriesScreen(this.title, {Key? key}) : super(key: key);

  @override
  _SubSubCategoriesScreenState createState() => _SubSubCategoriesScreenState();
}

class _SubSubCategoriesScreenState extends State<SubSubCategoriesScreen> {
  late List<ServiceModel> servicesList;

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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: Text(
            widget.title,
            style: const TextStyle(color: Color(0xFFFFAE00)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFFFFAE00),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: widget.title == "Air Conditioner" ? DataSearch() : DataGeneralSearch());
              },
              icon: const Icon(Icons.search),
              color: const Color(0xFFFFAE00),
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) =>
                            EssentialDetailsScreen(servicesList[index].name, servicesList[index].rating));
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
                            children: [
                              Image(
                                image: AssetImage(servicesList[index].image),
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      servicesList[index].name,
                                      style: const TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontSize: 18.0),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 5.0),
                                      child: RatingBarIndicator(
                                        rating: servicesList[index].rating,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Color(0xFFFFAE00),
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
                                  ],
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
              itemCount: servicesList.length),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final services = ["Atharva Enterprises", "Pawan Enterprises"];

  final recentSearches = ["Atharva Enterprises", "Pawan Enterprises"];

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
}

class DataGeneralSearch extends SearchDelegate<String> {
  final services = ["Dmart", "Big Bazzar", "Metro Mall", "Harbans Karyana Store"];

  final recentSearches = ["Dmart", "Metro Mall"];

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
}
