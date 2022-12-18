import 'package:flutter/material.dart';
import 'package:mobile/features/login/view/login_screen.dart';
import '../../../core/components/input/button.dart';
import '../../register/view/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static String path = '/welcome';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Hero(
            tag: "title",
            child: Text(
              "BandMate",
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                onClick: () =>
                    Navigator.of(context).pushNamed(LoginScreen.path),
                label: "Login",
              ),
              const SizedBox(
                width: 8.0,
              ),
              Button(
                onClick: () =>
                    Navigator.of(context).pushNamed(RegisterScreen.path),
                label: "Register",
              ),
            ],
          )
        ],
      ),
    );
  }
}
