import 'package:flutter/material.dart';

class MyDeck extends StatelessWidget {
  static const namedRoute = 'MyDeck';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('マイデッキ'),
      ),
      body: Center(
        child: Text('マイデッキ'),
      ),
    );
  }
}