import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class HotelCard {
  final String uuid;
  final String name;
  final String poster;

  HotelCard(this.uuid, this.name, this.poster);

  factory HotelCard.fromJson(Map<String, dynamic> json) => _$HotelCardFromJson(json);
  Map<String, dynamic> toJson() => _$HotelCardToJson(this);
}