import 'package:banking_mobile_app/models/reset_card_pin_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetCardPin extends StatefulWidget {
  //

  const ResetCardPin({super.key});

  @override
  State<ResetCardPin> createState() => _ResetCardPinState();
}

class _ResetCardPinState extends State<ResetCardPin> {
  //
  final _previousPinController = TextEditingController();
  final _newPinController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    _previousPinController.dispose();
    _newPinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SingleChildScrollView(
            child: Consumer<ResetCardPinModel>(
              builder: (context, model, child) {
                return SizedBox(
                  width: constraints.maxWidth * 0.80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsetsGeometry.only(top: 10, bottom: 10),
                        child: const Text(
                          "Reset pin",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Form(
                        key: _key,
                        child: Column(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              controller: _previousPinController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.key),
                                hintText: "Old pin",
                              ),
                              validator: (value) =>
                                  model.validatePreviousPin(value),
                              maxLength: 4,
                            ),
                            TextFormField(
                              controller: _newPinController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.key),
                                hintText: "New pin",
                              ),
                              validator: (value) => model.validateNewPin(value),
                              maxLength: 4,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(200, 30),
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () async {
                                bool isReset = await model.resetPin(
                                  _key,
                                  _previousPinController.text,
                                  _newPinController.text,
                                );

                                if (context.mounted && isReset) {
                                  Navigator.of(context).pop();
                                } else if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        "Reset failed",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                "Reset",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
