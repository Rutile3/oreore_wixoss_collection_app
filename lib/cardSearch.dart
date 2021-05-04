import 'package:flutter/material.dart';
import 'package:oreore_wixoss_collection_app/cardSearchWidget.dart';

class CardSearch extends StatelessWidget {
  static const namedRoute = 'CardSearch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カード検索'),
      ),
      body: Center(
        child: CardSearchWidget(),
      ),
    );
  }
}
