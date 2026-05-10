import 'package:banking_mobile_app/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_balance),
        title: const Text("ZagaBank", style: TextStyle(fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: const Text("Banking App", style: TextStyle(fontSize: 30)),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
