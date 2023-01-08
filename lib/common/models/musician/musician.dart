import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/common/models/musician/about.dart';

import 'name.dart';

part 'musician.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Musician {
  Musician(
    this.id,
    this.name,
    this.about,
  );

  @HiveField(0)
  String id;

  @HiveField(1)
  Name name;

  @HiveField(2)
  About about;

  factory Musician.fromJson(Map<String, dynamic> json) =>
      _$MusicianFromJson(json);

  Map<String, dynamic> toJson() => _$MusicianToJson(this);
}
