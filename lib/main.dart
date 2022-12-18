import 'package:flutter/material.dart';
import 'package:mobile/features/register/provider/post_register_provider.dart';
import 'features/home/view/home_screen.dart';
import 'features/home/provider/user_provider.dart';
import 'features/login/view/login_screen.dart';
import 'features/register/view/post_register_screen.dart';
import 'features/register/view/register_screen.dart';
import 'features/register/provider/register_provider.dart';
import 'features/welcome/view/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'features/login/provider/login_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => PostRegisterProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BandMate',
      routes: {
        WelcomeScreen.path: (context) => const WelcomeScreen(),
        RegisterScreen.path: (context) => const RegisterScreen(),
        HomeScreen.path: (context) => const HomeScreen(),
        PostRegisterScreen.path: (context) => const PostRegisterScreen(),
        LoginScreen.path: (context) => const LoginScreen()
      },
      initialRoute: WelcomeScreen.path,
    );
  }
}
