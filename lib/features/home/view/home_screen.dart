import 'package:flutter/material.dart';
import 'package:mobile/features/profile/view/profile_screen.dart';
import 'package:mobile/features/swiping/view/swiping_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String path = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentScreen = 0;

  Widget displayCurrentScreen() {
    switch (_currentScreen) {
      case 0:
        return const SwipingScreen();
      case 2:
        return const ProfileScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Container(), label: "swiping"),
          BottomNavigationBarItem(icon: Container(), label: "matches"),
          BottomNavigationBarItem(icon: Container(), label: "profile"),
        ],
        currentIndex: _currentScreen,
        onTap: (value) {
          setState(() {
            _currentScreen = value;
          });
        },
      ),
      body: displayCurrentScreen(),
    );
  }
}
