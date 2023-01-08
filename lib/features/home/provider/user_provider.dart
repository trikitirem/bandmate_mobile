import 'package:flutter/material.dart';
import '../../../common/models/musician/musician.dart';

class UserProvider with ChangeNotifier {
  Musician? _musician;
  Musician? get musician => _musician;

  void setUser(Musician musician) {
    _musician = musician;
    notifyListeners();
  }

  logOut() async {
    _musician = null;
  }
}
