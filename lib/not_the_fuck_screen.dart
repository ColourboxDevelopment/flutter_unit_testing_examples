import 'package:flutter/material.dart';
import 'package:some_testing/some_functions/functions.dart';

class NotTheFuckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'This screen imports some functions.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(randomStringFunction(25)),
              SizedBox(
                height: 15,
              ),
              Text(add(5, 5).toString()),
            ],
          ),
        ),
      ),
    );
  }
}
