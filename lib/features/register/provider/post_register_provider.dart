import 'package:flutter/material.dart';
import 'package:mobile/features/home/provider/user_provider.dart';
import '../../../core/api/http_service.dart';
import '../../../core/api/routes.dart';
import '../../../core/errors/errors.dart';
import '../../../core/errors/exceptions.dart';
import '../model/post_register.dart';
import 'package:provider/provider.dart';

class PostRegisterProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();

  bool? _loading;
  bool? get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future postRegister(BuildContext context, PostRegister postRegister,
      VoidCallback onSuccess) async {
    final body = postRegister.toJson();
    try {
      _errorMessage = null;
      _loading = true;
      notifyListeners();

      await _httpService.put(UserRoutes.postRegister, body);
      // ignore: use_build_context_synchronously
      context.read<UserProvider>().postRegister(postRegister);

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
