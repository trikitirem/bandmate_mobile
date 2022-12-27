import 'package:flutter/material.dart';
import 'package:mobile/features/home/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final you = context.watch<UserProvider>();

    return Center(
      child: Text(you.musician!.name.firstName),
    );
  }
}
