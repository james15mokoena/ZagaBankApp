import 'package:banking_mobile_app/models/cards_model.dart';
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
  //

  @override
  Widget build(BuildContext context) {
    //

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Consumer<CardsModel>(
            builder: (context, model, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsetsGeometry.only(top: 10, bottom: 15),
                    child: Text("Your Cards", style: TextStyle(fontSize: 35)),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: model.cards.length,
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.grey),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.blueGrey[800],
                          elevation: 10,
                          child: ListTile(
                            isThreeLine: true,
                            title: Text(model.cards[index]),
                            subtitle: Text("Status: Active"),
                            leading: Icon(MdiIcons.accountCard),
                            trailing: Text("Debit"),
                            selectedColor: Colors.cyanAccent,
                            selected: model.selectedCardIndex == index
                                ? true
                                : false,
                            onTap: () {
                              model.updateSelectedCardIndex(index);
                              Navigator.of(
                                context,
                              ).pushNamed(RouteGenerator.cardDetailsPage);
                              // navigate to the
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
