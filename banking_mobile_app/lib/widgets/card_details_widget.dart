import 'package:banking_mobile_app/routes.dart';
import 'package:flutter/material.dart';

class CardDetailsWidget extends StatefulWidget {
  //

  const CardDetailsWidget({super.key});

  @override
  State<CardDetailsWidget> createState() => _CardDetailsWidgetState();
}

class _CardDetailsWidgetState extends State<CardDetailsWidget> {
  //

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: constraints.maxWidth * 0.80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 10, bottom: 10),
                    child: const Text(
                      "Card Details",
                      style: TextStyle(fontSize: 30, decoration: null),
                    ),
                  ),
                  Card(
                    elevation: 20,
                    child: ListTile(
                      leading: const Text(
                        "Card No:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: const Text("1234567890"),
                    ),
                  ),
                  Card(
                    elevation: 20,
                    child: ListTile(
                      leading: const Text(
                        "Pin:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: const Text("1234"),
                    ),
                  ),
                  Card(
                    elevation: 20,
                    child: ListTile(
                      leading: const Text(
                        "Type:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: const Text("Debit"),
                    ),
                  ),
                  Card(
                    elevation: 20,
                    child: ListTile(
                      leading: const Text(
                        "Network Provider:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: const Text("Visa"),
                    ),
                  ),
                  Card(
                    elevation: 20,
                    child: ListTile(
                      leading: const Text(
                        "Issuer:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: const Text("ZagaBank"),
                    ),
                  ),
                  Card(
                    elevation: 20,
                    child: ListTile(
                      leading: const Text(
                        "Expiry Date:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text("${DateTime.now()}"),
                    ),
                  ),
                  Card(
                    elevation: 20,
                    child: ListTile(
                      leading: const Text(
                        "Status:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: const Text("Active"),
                    ),
                  ),
                  Card(
                    elevation: 20,
                    child: ListTile(
                      leading: const Text(
                        "CVV:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: const Text("111"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(bottom: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 35),
                      ),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(RouteGenerator.resetCardPinPage);
                      },
                      child: const Text(
                        "Change Pin",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
