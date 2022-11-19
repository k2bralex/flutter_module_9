import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../src/fetch_hotel_details.dart';
import '../models/hotel.dart';

class AboutPage extends StatefulWidget {
  static const routeName = "/detail";
  final String uuid;
  late String path;

  AboutPage({super.key, required this.uuid}) {
    path = "https://run.mocky.io/v3/$uuid";
  }

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late Hotel _hotel;

  static const List<String> details = [
    "Country",
    "City",
    "Street",
    "Country",
    "Price",
  ];

  List<Widget> getHotelDetails(Hotel h) {
    List<String> values = [
      h.address.country,
      h.address.city,
      h.address.street,
      h.address.country,
      h.price.toString()
    ];

    return [
      for (int i = 0; i < details.length; i++)
        RichText(
          text: TextSpan(
              text: "${details[i]}: ",
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: values[i],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))
              ]),
        )
    ];
  }

  List<Widget> getHotelServices(Hotel h) {
    var services = h.services;
    return [
      for (var key in services.keys)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(key[0].toUpperCase() + key.substring(1)),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: services[key]!
                      .map((service) => Text(
                            service,
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchHotelDetails(widget.path),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.hasData ? (snapshot.data! as Hotel).name : ""),
            ),
            body: Center(
              child: (snapshot.hasData)
                  ? Builder(builder: (BuildContext context) {
                      _hotel = snapshot.data!;
                      return Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CarouselSlider(
                                items: List.generate(
                                    _hotel.photos.length,
                                    (index) => Container(
                                          margin: const EdgeInsets.all(6.0),
                                          child: Image.asset(
                                            "assets/images/${_hotel.photos[index]}",
                                            fit: BoxFit.contain,
                                          ),
                                        )),
                                options: CarouselOptions(
                                    height: 200, viewportFraction: 0.7),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: getHotelDetails(_hotel),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text("SERVICES")),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRect(
                                  clipBehavior: Clip.antiAlias,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: getHotelServices(_hotel),
                                  ),
                                )),
                          ]));
                    })
                  : (snapshot.hasError)
                      ? const Text("Service currently unavailable")
                      : const CircularProgressIndicator(),
            ),
          );
        });
  }
}