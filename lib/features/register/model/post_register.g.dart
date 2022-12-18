// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRegister _$PostRegisterFromJson(Map<String, dynamic> json) => PostRegister()
  ..genres = (json['genres'] as List<dynamic>).map((e) => e as String).toList()
  ..instruments =
      (json['instruments'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$PostRegisterToJson(PostRegister instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'instruments': instance.instruments,
    };
