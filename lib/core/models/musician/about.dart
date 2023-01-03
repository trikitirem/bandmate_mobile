// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'about.g.dart';

@JsonSerializable()
class About {
  const About({
    required this.genres,
    required this.instruments,
    this.description,
  });

  final List<String> genres;
  final List<String> instruments;
  final String? description;

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);

  Map<String, dynamic> toJson() => _$AboutToJson(this);
}
