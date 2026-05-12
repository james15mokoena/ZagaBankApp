import 'package:banking_mobile_app/models/bottom_navbar_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavbar> {
  //

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavbarModel>(
      builder: (context, model, child) {
        return NavigationBar(
          backgroundColor: Colors.blueGrey,
          onDestinationSelected: (value) {
            model.updateSelectedIndex(value);
          },
          selectedIndex: model.selectedIndex,
          indicatorColor: Colors.amber,
          destinations: <Widget>[
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
              icon: Icon(MdiIcons.cardAccountDetails),
              label: "Cards",
            ),
          ],
        );
      },
    );
  }
}
