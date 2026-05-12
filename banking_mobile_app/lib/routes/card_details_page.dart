import 'package:banking_mobile_app/widgets/card_details_widget.dart';
import 'package:banking_mobile_app/widgets/top_navbar.dart';
import 'package:flutter/material.dart';

class CardDetailsPage extends StatelessWidget {
  //

  const CardDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(title: "ZagaBank"),
      body: CardDetailsWidget(),
    );
  }
}
