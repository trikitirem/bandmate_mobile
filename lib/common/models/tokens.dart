import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'tokens.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Tokens {
  const Tokens(this.token);

  @HiveField(0)
  final String token;

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

  Map<String, dynamic> toJson() => _$TokensToJson(this);
}
