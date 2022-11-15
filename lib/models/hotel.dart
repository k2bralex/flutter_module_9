import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'hotel.g.dart';

@JsonSerializable()
class Hotel {
  final String uuid;

  @JsonKey(defaultValue: "Hotel", )
  final String name;

  @JsonKey(defaultValue: "assets/images/134093.jpg")
  final String poster;

  @JsonKey(defaultValue: 0)
  final double price;

  @JsonKey(defaultValue: 0)
  final double rating;

  final Map<String, List<String>> services;
  final List<String> photos;
  final Address address;


  Hotel(this.uuid, this.name, this.poster, this.price, this.rating,
      this.address, this.services, this.photos);

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}