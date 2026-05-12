import 'package:banking_mobile_app/models/bottom_navbar_model.dart';
import 'package:banking_mobile_app/routes/cards_page.dart';
import 'package:banking_mobile_app/routes/home_page.dart';
import 'package:banking_mobile_app/widgets/bottom_navbar.dart';
import 'package:banking_mobile_app/widgets/top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(title: "ZagaBank"),
      body: Consumer<BottomNavbarModel>(
        builder: (context, model, child) {
          return <Widget>[
            const HomePage(),
            const CardsPage(),
          ][model.selectedIndex];
        },
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
