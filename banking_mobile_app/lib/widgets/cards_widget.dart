import 'package:banking_mobile_app/models/cards_model.dart';
import 'package:banking_mobile_app/models/dto/card_dto.dart';
import 'package:banking_mobile_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CardsWidget extends StatefulWidget {
  //

  const CardsWidget({super.key});

  @override
  State<CardsWidget> createState() => _CardsWidgetState();
}

class _CardsWidgetState extends State<CardsWidget> {
  /// Store the user's cards.
  late Future<List<CardDto>>? cards;

  @override
  void initState() {
    super.initState();

    cards = context.read<CardsModel>().viewCardsByEmail();
  }

  @override
  Widget build(BuildContext context) {
    //

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsetsGeometry.only(top: 10, bottom: 15),
                child: Text("Your Cards", style: TextStyle(fontSize: 35)),
              ),
              Consumer<CardsModel>(
                builder: (context, cardsModel, child) {
                  return FutureBuilder<List<CardDto>>(
                    future: cards,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Padding(
                          padding: EdgeInsetsGeometry.only(top: 20, bottom: 20),
                          child: Center(
                            child: const Text(
                              "No cards available",
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            ),
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Padding(
                          padding: EdgeInsetsGeometry.only(top: 20, bottom: 20),
                          child: Center(
                            child: const CircularProgressIndicator(),
                          ),
                        );
                      }

                      // cards are available
                      return Expanded(
                        child: ListView.separated(
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (context, index) =>
                              const Divider(color: Colors.grey),
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.blueGrey[800],
                              elevation: 10,
                              child: ListTile(
                                isThreeLine: true,
                                title: Text(snapshot.data![index].cardNo!),
                                subtitle: Text(
                                  "Status: ${snapshot.data![index].status}",
                                ),
                                leading: Icon(MdiIcons.accountCard),
                                trailing: Text("${snapshot.data![index].type}"),
                                selectedColor: Colors.cyanAccent,
                                selected: cardsModel.selectedCardIndex == index
                                    ? true
                                    : false,
                                onTap: () {
                                  cardsModel.updateSelectedCardIndex(index);
                                  Navigator.of(
                                    context,
                                  ).pushNamed(RouteGenerator.cardDetailsPage);
                                  // navigate to the
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
