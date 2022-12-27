import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/core/models/musician/interests.dart';

import 'name.dart';

part 'musician.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Musician {
  Musician(
    this.id,
    this.name,
    this.interests,
  );

  @HiveField(0)
  String id;

  @HiveField(1)
  Name name;

  @HiveField(2)
  Interests interests;

  factory Musician.fromJson(Map<String, dynamic> json) =>
      _$MusicianFromJson(json);

  Map<String, dynamic> toJson() => _$MusicianToJson(this);
}
