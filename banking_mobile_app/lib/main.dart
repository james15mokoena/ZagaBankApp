import 'package:banking_mobile_app/models/login_model.dart';
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
        Provider<LoginModel>(create: (context) => LoginModel()),
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
