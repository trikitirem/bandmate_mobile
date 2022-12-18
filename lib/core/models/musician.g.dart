// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musician.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Musician _$MusicianFromJson(Map<String, dynamic> json) => Musician(
      id: json['_id'] as String,
      name: json['name'] as String,
      instruments: (json['instruments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MusicianToJson(Musician instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'instruments': instance.instruments,
      'genres': instance.genres,
    };
