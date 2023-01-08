import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile/common/models/musician/musician.dart';
import 'package:mobile/common/models/tokens.dart';

class CacheKeys {
  static String tokens = "tokens";
  static String you = "you";
}

initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MusicianAdapter());
  Hive.registerAdapter(TokensAdapter());
}

userLogOut() async {
  var box = await Hive.openBox<Tokens>(CacheKeys.tokens);
  box.clear();
  box.close();

  //TODO: remove cached user when
}

cacheToken(String token) async {
  var box = await Hive.openBox<Tokens>(CacheKeys.tokens);
  box.put(CacheKeys.tokens, Tokens(token));
  box.close();
}

Future<String> readToken() async {
  var box = await Hive.openBox<Tokens>(CacheKeys.tokens);
  var token = box.get(CacheKeys.tokens, defaultValue: const Tokens(''))!.token;
  box.close();

  return token;
}

cacheYou(Musician you) async {
  // var box = await Hive.openBox<Musician>(CacheKeys.you);
  // box.put(CacheKeys.you, you);
  // box.close();
}
