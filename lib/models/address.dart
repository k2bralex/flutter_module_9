import 'package:json_annotation/json_annotation.dart';

import 'coordinates.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String country;
  final String street;
  final String city;
  @JsonKey(name: "zip_code")
  final int zipcode;
  final Coordinates coords;

  Address(this.country, this.street, this.zipcode, this.coords, this.city);

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Coordinates {
  final double lat;
  final double lan;

  Coordinates(this.lat, this.lan);

  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}