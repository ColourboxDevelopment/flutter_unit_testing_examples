import 'package:flutter/material.dart';

import 'not_the_fuck_screen.dart';

class FuckScreen extends StatefulWidget {
  @override
  _FuckScreenState createState() => _FuckScreenState();
}

class _FuckScreenState extends State<FuckScreen> {
  String toggleText = 'This text can disappear';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Well, I don\'t have anything to do with count,',
                key: Key('first text'),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                ' but I can run some functions \'n stuff.',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                toggleText,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    toggleText =
                        toggleText == '' ? 'This text can disappear' : '';
                  });
                },
                key: Key('button'),
              ),
              IconButton(
                  icon: Icon(Icons.screen_lock_rotation),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotTheFuckScreen()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
