// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musician.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicianAdapter extends TypeAdapter<Musician> {
  @override
  final int typeId = 1;

  @override
  Musician read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Musician(
      fields[0] as String,
      fields[1] as Name,
      fields[2] as Interests,
    );
  }

  @override
  void write(BinaryWriter writer, Musician obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.interests);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicianAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Musician _$MusicianFromJson(Map<String, dynamic> json) => Musician(
      json['id'] as String,
      Name.fromJson(json['name'] as Map<String, dynamic>),
      Interests.fromJson(json['interests'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicianToJson(Musician instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'interests': instance.interests,
    };
