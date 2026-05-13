import 'package:banking_mobile_app/models/card_details_model.dart';
import 'package:banking_mobile_app/models/dto/card_dto.dart';
import 'package:banking_mobile_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDetailsWidget extends StatefulWidget {
  //

  const CardDetailsWidget({super.key});

  @override
  State<CardDetailsWidget> createState() => _CardDetailsWidgetState();
}

class _CardDetailsWidgetState extends State<CardDetailsWidget> {
  //
  late Future<CardDto> card;

  @override
  void initState() {
    super.initState();

    card = context.read<CardDetailsModel>().getCardDetailsByEmailAndCardNo();
  }

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
                  FutureBuilder<CardDto>(
                    future: card,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Padding(
                          padding: EdgeInsetsGeometry.only(top: 20, bottom: 20),
                          child: Text(
                            snapshot.error!.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Padding(
                          padding: EdgeInsetsGeometry.only(top: 20, bottom: 20),
                          child: const CircularProgressIndicator(),
                        );
                      }

                      return Consumer<CardDetailsModel>(
                        builder: (context, cardModel, child) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: <Widget>[
                              Card(
                                elevation: 20,
                                child: ListTile(
                                  leading: const Text(
                                    "Card No:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  title: Text(snapshot.data!.cardNo!),
                                ),
                              ),
                              Card(
                                elevation: 20,
                                child: ListTile(
                                  leading: const Text(
                                    "Pin:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  title: Text(snapshot.data!.pin!.toString()),
                                ),
                              ),
                              Card(
                                elevation: 20,
                                child: ListTile(
                                  leading: const Text(
                                    "Type:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  title: Text(snapshot.data!.type!),
                                ),
                              ),
                              Card(
                                elevation: 20,
                                child: ListTile(
                                  leading: const Text(
                                    "Network Provider:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  title: Text(snapshot.data!.networkProvider!),
                                ),
                              ),
                              Card(
                                elevation: 20,
                                child: ListTile(
                                  leading: const Text(
                                    "Issuer:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  title: Text(snapshot.data!.issuingBank!),
                                ),
                              ),
                              Card(
                                elevation: 20,
                                child: ListTile(
                                  leading: const Text(
                                    "Expiry Date:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  title: Text(
                                    snapshot.data!.expiryDate!.toString(),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 20,
                                child: ListTile(
                                  leading: const Text(
                                    "Status:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  title: Text(snapshot.data!.status!),
                                ),
                              ),
                              Card(
                                elevation: 20,
                                child: ListTile(
                                  leading: const Text(
                                    "CVV:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  title: Text(snapshot.data!.cvv!.toString()),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
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
