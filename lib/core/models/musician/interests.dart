// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'interests.g.dart';

@JsonSerializable()
class Interests {
  const Interests({
    required this.genres,
    required this.instruments,
  });

  final List<String> genres;
  final List<String> instruments;

  factory Interests.fromJson(Map<String, dynamic> json) =>
      _$InterestsFromJson(json);

  Map<String, dynamic> toJson() => _$InterestsToJson(this);
}
