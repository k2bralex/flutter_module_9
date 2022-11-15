// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      json['uuid'] as String,
      json['name'] as String? ?? 'Hotel',
      json['poster'] as String? ?? 'assets/images/134093.jpg',
      (json['price'] as num?)?.toDouble() ?? 0,
      (json['rating'] as num?)?.toDouble() ?? 0,
      Address.fromJson(json['address'] as Map<String, dynamic>),
      (json['services'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
      'address': instance.address,
    };
