import 'package:flutter/material.dart';
import '../../../../common/components/input/button.dart';
import '../../../login/view/login_screen.dart';
import '../../../register/view/register_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserNotPresent extends StatelessWidget {
  const UserNotPresent({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: "title",
          child: Text(
            localizations.welcome_title,
            style: const TextStyle(
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
              onClick: () => Navigator.of(context).pushNamed(LoginScreen.path),
              label: localizations.welcome_button_login,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Button(
              onClick: () =>
                  Navigator.of(context).pushNamed(RegisterScreen.path),
              label: localizations.welcome_button_register,
            ),
          ],
        )
      ],
    );
  }
}
