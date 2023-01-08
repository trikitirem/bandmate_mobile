import 'package:flutter/material.dart';
import 'package:mobile/common/errors/exceptions.dart';
import 'package:mobile/features/login/models/login.dart';
import 'package:provider/provider.dart';
import '../../../common/api/http_service.dart';
import '../../../common/api/routes.dart';
import '../../../common/errors/errors.dart';
import '../../../common/models/musician/musician.dart';
import '../../../common/utils/local_storage.dart';
import '../../home/provider/user_provider.dart';

class LoginProvider with ChangeNotifier {
  LoginProvider(this._context);

  final BuildContext _context;
  final HttpService _httpService = HttpService();

  // ignore: prefer_final_fields
  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future login(Login login, VoidCallback onSuccess) async {
    final body = login.toJson();
    try {
      _errorMessage = null;
      _loading = true;
      notifyListeners();

      var response = await _httpService.post(UserRoutes.login, body);

      var you = Musician.fromJson(response['musician']);
      // ignore: use_build_context_synchronously
      _context.read<UserProvider>().setUser(you);

      await cacheToken(response['token']);
      await cacheYou(you);

      onSuccess.call();
    } on ApiException catch (e) {
      _errorMessage = e.cause;
      _loading = false;
      notifyListeners();
    } catch (err) {
      _errorMessage = CommonErrors.unknownError;

      _loading = false;
      notifyListeners();
    }
  }
}
