import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.blueGrey,
      destinations: <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home),
          label: "Home",
          selectedIcon: Icon(Icons.home),
        ),
        NavigationDestination(icon: Icon(Icons.pin), label: "Card"),
      ],
    );
  }
}
