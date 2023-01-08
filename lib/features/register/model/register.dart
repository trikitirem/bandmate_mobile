// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/common/models/musician/about.dart';
import 'package:mobile/common/models/musician/contact.dart';

import '../../../common/models/musician/name.dart';

part 'register.g.dart';

@JsonSerializable()
class Register {
  Register();

  Name name = Name(firstName: "");
  Contact contact = Contact(email: "");
  About about = About(genres: [], instruments: []);
  String password = "";

  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
