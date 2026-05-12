import 'package:banking_mobile_app/widgets/reset_card_pin.dart';
import 'package:banking_mobile_app/widgets/top_navbar.dart';
import 'package:flutter/material.dart';

class ResetCardPinPage extends StatelessWidget {
  //
  const ResetCardPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(title: "ZagaBank"),
      body: ResetCardPin(),
    );
  }
}
