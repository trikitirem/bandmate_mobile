// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumber _$PhoneNumberFromJson(Map<String, dynamic> json) => PhoneNumber(
      number: json['number'] as String,
      prefix: json['prefix'] as String,
    );

Map<String, dynamic> _$PhoneNumberToJson(PhoneNumber instance) =>
    <String, dynamic>{
      'number': instance.number,
      'prefix': instance.prefix,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] == null
          ? null
          : PhoneNumber.fromJson(json['phoneNumber'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
