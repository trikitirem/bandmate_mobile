// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'post_register.g.dart';

@JsonSerializable()
class PostRegister {
  PostRegister();

  List<String> genres = [];
  List<String> instruments = [];

  factory PostRegister.fromJson(Map<String, dynamic> json) =>
      _$PostRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$PostRegisterToJson(this);
}
