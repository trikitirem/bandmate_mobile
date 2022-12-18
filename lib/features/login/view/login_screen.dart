import 'package:flutter/material.dart';
import 'package:mobile/features/home/view/home_screen.dart';
import '../../../core/components/input/form_text_input.dart';
import '../models/login.dart';
import '../provider/login_provider.dart';
import '../../../core/components/input/button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String path = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formData = Login();

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<LoginProvider>().loading;
    final errorMessage = context.watch<LoginProvider>().errorMessage;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Hero(
                  tag: "title",
                  child: Material(
                    child: Text(
                      "Login to BandMate",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                FormTextInput(
                  hintText: "email",
                  onChanged: (value) => setState(() {
                    _formData.email = value ?? "";
                  }),
                ),
                FormTextInput(
                  hintText: "password",
                  obscure: true,
                  onChanged: (value) => setState(() {
                    _formData.password = value ?? "";
                  }),
                ),
                errorMessage != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: Text(
                          errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Button(
                label: loading == true ? "Loading..." : "Login",
                onClick: () => context.read<LoginProvider>().login(
                  context,
                  _formData,
                  () {
                    if (!mounted) {
                      return;
                    }
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HomeScreen.path, (route) => false);
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
