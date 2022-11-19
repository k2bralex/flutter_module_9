import 'package:dio/dio.dart';

import '../models/hotel_card.dart';

Future<List<HotelCard>> fetchHotelCards(String path) async {
  var dio = Dio();
  var response = await dio
      .get(path);
  var cards = (response.data as List)
      .map<HotelCard>((hotelCard) => HotelCard.fromJson(hotelCard))
      .toList();
  return cards;
}
