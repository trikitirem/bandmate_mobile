import 'package:flutter/material.dart';
import 'package:mobile/common/utils/local_storage.dart';
import 'features/home/view/home_screen.dart';
import 'features/home/provider/user_provider.dart';
import 'features/login/view/login_screen.dart';
import 'features/register/view/register_screen.dart';
import 'features/welcome/view/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await initHive();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'BandMate',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: {
          WelcomeScreen.path: (context) => const WelcomeScreen(),
          RegisterScreen.path: (context) => const RegisterScreen(),
          HomeScreen.path: (context) => const HomeScreen(),
          LoginScreen.path: (context) => const LoginScreen()
        },
        initialRoute: WelcomeScreen.path,
        theme: ThemeData(fontFamily: "Quicksand"),
      ),
    );
  }
}
