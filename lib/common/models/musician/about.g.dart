// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

About _$AboutFromJson(Map<String, dynamic> json) => About(
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      instruments: (json['instruments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AboutToJson(About instance) => <String, dynamic>{
      'genres': instance.genres,
      'instruments': instance.instruments,
      'description': instance.description,
    };
