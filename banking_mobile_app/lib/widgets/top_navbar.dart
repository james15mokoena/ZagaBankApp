import 'package:banking_mobile_app/models/login_model.dart';
import 'package:banking_mobile_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TopNavbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginModel>(
      builder: (context, model, child) {
        return AppBar(
          automaticallyImplyLeading: true,
          title: const Text("ZagaBank", style: TextStyle(fontSize: 25)),
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                model.invalidate(context);
                Navigator.of(context).popAndPushNamed(RouteGenerator.loginPage);
              },
              icon: Icon(Icons.logout),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
