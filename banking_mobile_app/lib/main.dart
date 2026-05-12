import 'package:banking_mobile_app/models/card_details_model.dart';
import 'package:banking_mobile_app/models/cards_model.dart';
import 'package:banking_mobile_app/models/bottom_navbar_model.dart';
import 'package:banking_mobile_app/models/login_model.dart';
import 'package:banking_mobile_app/models/reset_card_pin_model.dart';
import 'package:banking_mobile_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(const BankingApp());
}

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider<LoginModel>(create: (_) => LoginModel()),
        Provider<CardDetailsModel>(create: (_) => CardDetailsModel()),
        Provider<ResetCardPinModel>(create: (_) => ResetCardPinModel()),
        ChangeNotifierProvider<CardsModel>(create: (_) => CardsModel()),
        ChangeNotifierProvider(create: (_) => BottomNavbarModel()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: RouteGenerator.loginPage,
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
