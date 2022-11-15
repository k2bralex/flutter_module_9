import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../models/hotel_card.dart';
import 'grid_view.dart';
import 'list_view.dart';
import 'my_app_bar.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  static const routeName = "/";

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
///Use [Dio] to get data from server. Deserialize into model [HotelCard].
///View model list due to selected mode
class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  final Dio _dio = Dio();
  bool isLoaded = false;
  bool hasError = false;
  late List<HotelCard> cards;
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  void updateIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void getData() async {
    setState(() {
      isLoaded = true;
    });

    var response = await _dio
        .get("https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301");
    cards = (response.data as List)
        .map<HotelCard>((hotelCard) => HotelCard.fromJson(hotelCard))
        .toList();
    //print(cards);

    setState(() {
      isLoaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        onButtonClick: updateIndex,
      ),
      body: Center(
        child: isLoaded
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : hasError
                ? const Text("Error")
                : index == 0
                    ? ListViewMode(cards: cards)
                    : GridViewMode(cards: cards),
      ),
    );
  }
}