import 'package:flutter/material.dart';
import 'package:mobile/common/api/http_service.dart';
import 'package:mobile/common/api/routes.dart';
import 'package:mobile/common/errors/exceptions.dart';
import 'package:mobile/common/models/musician/musician.dart';

import '../../../common/errors/errors.dart';

class SwipingProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<Musician>? _swipes;
  List<Musician>? get swipes => _swipes;

  Future loadSwipes() async {
    try {
      _errorMessage = null;
      _loading = true;
      notifyListeners();

      var response = await _httpService.getData(MusiciansRoutes.get);
      _swipes = List<Musician>.from(
          response["musicians"].map((musician) => Musician.fromJson(musician)));

      _loading = false;
      notifyListeners();
    } on ApiException catch (e) {
      _errorMessage = e.cause;
      _loading = false;
      notifyListeners();
    } catch (_) {
      _errorMessage = CommonErrors.unknownError;
      _loading = false;
      notifyListeners();
    }
  }
}
