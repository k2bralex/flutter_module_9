import 'package:dio/dio.dart';

import '../models/hotel.dart';

Future<Hotel> fetchHotelDetails(String path) async {
  var dio = Dio();
  var response = await dio.get(path);
  return Hotel.fromJson(response.data);
}