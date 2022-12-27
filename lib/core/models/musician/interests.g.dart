// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Interests _$InterestsFromJson(Map<String, dynamic> json) => Interests(
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      instruments: (json['instruments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InterestsToJson(Interests instance) => <String, dynamic>{
      'genres': instance.genres,
      'instruments': instance.instruments,
    };
