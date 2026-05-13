import 'package:banking_mobile_app/models/login_model.dart';
import 'package:banking_mobile_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// The login form for the login page.
class LoginForm extends StatefulWidget {
  //
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

/// Contains the mutable state of the LoginForm.
class _LoginFormState extends State<LoginForm> {
  //
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: <Widget>[
          const Text(
            "Login",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Consumer<LoginModel>(
            builder: (context, model, child) {
              return TextFormField(
                controller: emailController,
                maxLength: 50,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Email",
                  constraints: BoxConstraints(maxWidth: 380),
                ),
                style: const TextStyle(fontSize: 20),
                validator: (value) => model.validateEmail(value),
              );
            },
          ),
          Consumer<LoginModel>(
            builder: (context, model, child) {
              return TextFormField(
                controller: passwordController,
                maxLength: 50,
                decoration: const InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  hintText: "Password",
                  constraints: BoxConstraints(maxWidth: 380),
                ),
                obscureText: true,
                style: const TextStyle(fontSize: 20),
                validator: (value) => model.validatePassword(value),
              );
            },
          ),
          Consumer<LoginModel>(
            builder: (context, model, child) {
              return Padding(
                padding: EdgeInsetsGeometry.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () async {
                    await model.login(
                      _key,
                      emailController.text,
                      passwordController.text,
                    );

                    if (model.isLoggedIn && context.mounted) {
                      Navigator.of(context).pop();
                      Navigator.of(
                        context,
                      ).pushNamed(RouteGenerator.layoutPage);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(fontSize: 25),
                    fixedSize: Size(180, 40),
                  ),
                  child: const Text("Login"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
