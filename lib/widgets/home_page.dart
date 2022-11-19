import 'package:flutter/material.dart';

import '../src/fetch_hotel_cards.dart';
import '../models/hotel_card.dart';
import 'grid_view_mode.dart';
import 'list_view_mode.dart';
import 'custom_app_bar.dart';

class HomePage extends StatefulWidget {
  final String title;
  static const routeName = "/";
  final String path = "https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301";

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

///Use [Dio] to get data from server. Deserialize into model [HotelCard].
///View model list due to selected mode
class _HomePageState extends State<HomePage> {
  int index = 0;
  late List<HotelCard> cards;

  void updateIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          onButtonClick: updateIndex,
        ),
        body: FutureBuilder(
          future: fetchHotelCards(widget.path),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.none:
                return const Center(
                    child: Text("Service currently unavailable"));
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return const Center(child: Text("Error"));
                }
                cards = snapshot.data!;
                return index == 0
                    ? ListViewMode(cards: cards)
                    : GridViewMode(cards: cards);
            }
          },
        ));
  }
}