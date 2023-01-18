import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/common/api/api_message.dart';
import 'package:mobile/common/api/http_service.dart';
import 'package:mobile/common/api/routes.dart';
import 'package:mobile/common/errors/errors.dart';
import 'package:mobile/common/errors/exceptions.dart';
import 'package:mobile/common/models/musician/musician.dart';
import 'package:mobile/features/swiping/provider/swiping_provider.dart';
import "package:provider/provider.dart";

class JudgingProvider with ChangeNotifier {
  JudgingProvider(this.context) {
    swipingProvider = context.read<SwipingProvider>();
  }

  late SwipingProvider swipingProvider;
  final BuildContext context;
  final HttpService _httpService = HttpService();

  final StreamController<Musician> _matchController =
      StreamController<Musician>();
  Stream<Musician> get matchStream => _matchController.stream;
  Sink get _matchSink => _matchController.sink;

  final StreamController<String> _errorController = StreamController<String>();
  Stream get errorStream => _errorController.stream;
  Sink get _errorSink => _errorController.sink;

  Future like() async {
    try {
      var id = swipingProvider.swipes![swipingProvider.currentSwipe].id;
      var response = await _httpService.post(MusiciansRoutes.like, {"id": id});

      if (response['message'] == ApiMessage.itsAMatch) {
        _matchSink.add(Musician.fromJson(response["match"]));
      }

      swipingProvider.nextSwipe();
    } on ApiException catch (e) {
      _errorSink.add(e.cause);
    } catch (e) {
      _errorSink.add(CommonErrors.unknownError);
    }
  }

  Future dislike() async {}

  @override
  void dispose() {
    super.dispose();
    _matchController.close();
    _errorController.close();
  }
}
