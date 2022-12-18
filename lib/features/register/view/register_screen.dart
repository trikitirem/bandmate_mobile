import 'package:flutter/material.dart';
import 'package:mobile/core/components/text/error_message.dart';
import '../../../core/components/input/button.dart';
import '../../../core/components/input/form_text_input.dart';
import '../model/register.dart';
import 'post_register_screen.dart';
import '../provider/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String path = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formData = Register();

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<RegisterProvider>().loading;
    final errorMessage = context.watch<RegisterProvider>().errorMessage;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Register to BandMate",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const Text(
                      "Before we start we need some information",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    const Text(
                      "At the beggining enrer your name",
                      style: TextStyle(color: Colors.black54),
                    ),
                    FormTextInput(
                      hintText: "name",
                      onChanged: (value) => setState(() {
                        _formData.name = value ?? "";
                      }),
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    const Text(
                      "Now some authentication data...",
                      style: TextStyle(color: Colors.black54),
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
                    ErrorMessage(
                      errorMessage: errorMessage,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Button(
                    label: loading == true ? "Loading..." : "Register",
                    onClick: () => context.read<RegisterProvider>().register(
                      context,
                      _formData,
                      () {
                        if (!mounted) {
                          return;
                        }
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            PostRegisterScreen.path, (route) => false);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}