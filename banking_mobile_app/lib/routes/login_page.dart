import 'package:banking_mobile_app/widgets/login_form.dart';
import 'package:flutter/material.dart';

/// The login page for the app.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ZagaBank", style: TextStyle(fontSize: 30)),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // The UI is reponsive
          return Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: constraints.maxWidth * 0.80,
                child: const LoginForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
