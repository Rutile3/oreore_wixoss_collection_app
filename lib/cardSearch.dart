import 'package:flutter/material.dart';

class CardSearch extends StatelessWidget {
  static const namedRoute = 'CardSearch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カード検索'),
      ),
      body: Center(
        child: Text('カード検索'),
      ),
    );
  }
}