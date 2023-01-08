import 'package:flutter/material.dart';
import 'package:mobile/common/api/http_service.dart';
import 'package:mobile/common/api/routes.dart';
import 'package:mobile/common/errors/exceptions.dart';
import 'package:mobile/common/models/musician/musician.dart';
import 'package:mobile/common/utils/local_storage.dart';
import 'package:mobile/features/home/provider/user_provider.dart';
import '../../../common/errors/errors.dart';
import 'package:provider/provider.dart';

class WelcomeProvider with ChangeNotifier {
  WelcomeProvider(this._context);

  final BuildContext _context;
  final HttpService _httpService = HttpService();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future welcome(VoidCallback onSuccess) async {
    try {
      _loading = true;
      _errorMessage = null;
      notifyListeners();

      var response = await _httpService.getData(UserRoutes.you);
      Musician you = Musician.fromJson(response['you']);
      // ignore: use_build_context_synchronously
      _context.read<UserProvider>().setUser(you);
      cacheYou(you);

      onSuccess.call();
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
