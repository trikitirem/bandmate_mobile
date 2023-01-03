import 'package:flutter/material.dart';
import '../../../core/models/musician/musician.dart';

class UserProvider with ChangeNotifier {
  Musician? _musician;
  Musician? get musician => _musician;

  void setUser(Musician musician) {
    _musician = musician;
    notifyListeners();
  }
}
