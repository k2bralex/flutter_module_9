import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../models/hotel.dart';

List<Widget> images = [
  Image.asset("assets/images/134093.jpg"),
  Image.asset("assets/images/134094.jpg"),
  Image.asset("assets/images/134095.jpg"),
  Image.asset("assets/images/134096.jpg"),
];

class AboutPage extends StatefulWidget {
  static const routeName = "/detail";
  final String uuid;

  const AboutPage({super.key, required this.uuid});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final Dio _dio = Dio();
  late Hotel _hotel;
  String name = "";
  bool isLoading = false;
  bool hasError = false;
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    getHotelDetail();
  }

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

  void getHotelDetail() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await _dio.get("https://run.mocky.io/v3/${widget.uuid}");
      _hotel = Hotel.fromJson(response.data);
      name = _hotel.name;
    } on DioError catch (e) {
      setState(() {
        hasError = true;
        errorMessage = e.error;
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: !isLoading && hasError
            ? Center(
                child: Text(
                "$errorMessage\nService currently unavailable",
                textAlign: TextAlign.center,
              ))
            : !isLoading && !hasError
                ? Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CarouselSlider(
                              items: List.generate(images.length, (index) => Container(margin: EdgeInsets.all(6.0), child: images[index],)),
                              options: CarouselOptions(height: 200)),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: getHotelServices(_hotel),
                              ),
                            )),
                      ]))
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
  }
}