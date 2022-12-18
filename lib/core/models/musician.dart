// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'musician.g.dart';

@JsonSerializable()
class Musician {
  Musician({
    required this.id,
    required this.name,
    required this.instruments,
    required this.genres,
  });

  String id;
  String name;
  List<String> instruments;
  List<String> genres;

  factory Musician.fromJson(Map<String, dynamic> json) =>
      _$MusicianFromJson(json);

  Map<String, dynamic> toJson() => _$MusicianToJson(this);
}
