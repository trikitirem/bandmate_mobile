import 'package:flutter/material.dart';
import '../../../core/api/http_service.dart';
import '../../../core/api/routes.dart';
import '../../../core/errors/errors.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/models/musician/musician.dart';
import '../../../core/utils/local_storage.dart';
import '../../home/provider/user_provider.dart';
import '../model/register.dart';
import 'package:provider/provider.dart';

class RegisterProvider with ChangeNotifier {
  RegisterProvider(this._context);

  final BuildContext _context;
  final HttpService _httpService = HttpService();
  Register form = Register();

  bool? _loading;
  bool? get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setInstruments(List<String> instruments) {
    form.about.instruments = instruments;
    notifyListeners();
  }

  void setGenres(List<String> genres) {
    form.about.genres = genres;
    notifyListeners();
  }

  Future register(VoidCallback onSuccess) async {
    final body = form.toJson();
    try {
      _errorMessage = null;
      _loading = true;
      notifyListeners();

      var response = await _httpService.post(UserRoutes.register, body);

      var you = Musician.fromJson(response['musician']);
      // ignore: use_build_context_synchronously
      _context.read<UserProvider>().setUser(you);

      await cacheToken(response['token']);

      onSuccess.call();
    } on ApiException catch (e) {
      _errorMessage = e.cause;

      _loading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = CommonErrors.unknownError;

      _loading = false;
      notifyListeners();
    }
  }
}
