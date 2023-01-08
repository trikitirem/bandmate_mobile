import 'package:flutter/material.dart';
import 'package:mobile/features/home/view/components/bottom_navigation.dart';
import 'package:mobile/features/inbox/view/inbox_screen.dart';
import 'package:mobile/features/profile/view/profile_screen.dart';
import 'package:mobile/features/swiping/view/swiping_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String path = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentScreenIndex = 0;

  Widget displayCurrentScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return const SwipingScreen();
      case 1:
        return const InboxScreen();
      case 3:
        return const ProfileScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: displayCurrentScreen()),
          BottomNavigation(
            currendScreenIndex: _currentScreenIndex,
            onChange: (index) => setState(() {
              _currentScreenIndex = index;
            }),
          )
        ],
      ),
    );
  }
}
