import 'package:banking_mobile_app/models/card_details_model.dart';
import 'package:banking_mobile_app/models/cards_model.dart';
import 'package:banking_mobile_app/models/bottom_navbar_model.dart';
import 'package:banking_mobile_app/models/app_cache_model.dart';
import 'package:banking_mobile_app/models/reset_card_pin_model.dart';
import 'package:banking_mobile_app/routes.dart';
import 'package:banking_mobile_app/services/card_service.dart';
import 'package:banking_mobile_app/services/login_service.dart';
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
        // register services
        Provider<CardService>(create: (_) => CardService()),
        Provider<LoginService>(create: (_) => LoginService()),
        // register models
        ChangeNotifierProvider<AppCacheModel>(create: (_) => AppCacheModel()),
        ChangeNotifierProvider<CardDetailsModel>(
          create: (context) =>
              CardDetailsModel(appCache: context.read<AppCacheModel>()),
        ),
        ChangeNotifierProvider<ResetCardPinModel>(
          create: (context) =>
              ResetCardPinModel(appCache: context.read<AppCacheModel>()),
        ),
        ChangeNotifierProvider<CardsModel>(
          create: (context) =>
              CardsModel(loginModel: context.read<AppCacheModel>()),
        ),
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
