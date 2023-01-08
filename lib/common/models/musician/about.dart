// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'about.g.dart';

@JsonSerializable()
class About {
  About({
    required this.genres,
    required this.instruments,
    this.description,
  });

  List<String> genres;
  List<String> instruments;
  String? description;

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);

  Map<String, dynamic> toJson() => _$AboutToJson(this);
}
