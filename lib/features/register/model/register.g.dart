// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register()
  ..name = Name.fromJson(json['name'] as Map<String, dynamic>)
  ..contact = Contact.fromJson(json['contact'] as Map<String, dynamic>)
  ..about = About.fromJson(json['about'] as Map<String, dynamic>)
  ..password = json['password'] as String;

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'name': instance.name,
      'contact': instance.contact,
      'about': instance.about,
      'password': instance.password,
    };
