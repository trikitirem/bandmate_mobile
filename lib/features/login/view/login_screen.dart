import 'package:flutter/material.dart';
import 'package:mobile/features/home/view/home_screen.dart';
import '../../../common/components/input/form_text_input.dart';
import '../models/login.dart';
import '../provider/login_provider.dart';
import '../../../common/components/input/button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (constext) => LoginProvider(context),
        child: Builder(builder: (context) {
          final loginProvider = context.watch<LoginProvider>();

          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Hero(
                      tag: "title",
                      child: Material(
                        child: Text(
                          localizations.login_title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    FormTextInput(
                      hintText: localizations.login_input_hint_email,
                      onChanged: (value) => setState(() {
                        _formData.email = value ?? "";
                      }),
                    ),
                    FormTextInput(
                      hintText: localizations.login_input_hint_password,
                      obscure: true,
                      onChanged: (value) => setState(() {
                        _formData.password = value ?? "";
                      }),
                    ),
                    loginProvider.errorMessage != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                            ),
                            child: Text(
                              loginProvider.errorMessage!,
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
                    label: loginProvider.loading == true
                        ? localizations.common_loading
                        : localizations.login_button,
                    onClick: () => context.read<LoginProvider>().login(
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
          ));
        }),
      ),
    );
  }
}
