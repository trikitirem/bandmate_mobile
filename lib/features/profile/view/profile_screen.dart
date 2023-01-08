import 'package:flutter/material.dart';
import 'package:mobile/core/components/input/button.dart';
import 'package:mobile/features/home/provider/user_provider.dart';
import 'package:mobile/features/welcome/view/welcome_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final you = context.watch<UserProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(you.musician!.name.firstName),
          Button(
            onClick: () async {
              await you.logOut();

              Navigator.of(context).pushNamedAndRemoveUntil(
                  WelcomeScreen.path, (route) => false);
            },
            label: "log out",
          )
        ],
      ),
    );
  }
}
