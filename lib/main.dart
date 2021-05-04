import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 中国語フォントにならないようにするため
import 'package:flutter/rendering.dart';
import 'package:oreore_wixoss_collection_app/cardSearch.dart';
import 'package:oreore_wixoss_collection_app/myDeck.dart'; // レイアウト確認用

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const locale = Locale("ja", "JP");

    return MaterialApp(
      title: 'オレオレウィクロス図鑑',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 中国語フォントにならないようにするため
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
      ],
      initialRoute: HomePage.namedRoute,
      routes: {
        HomePage.namedRoute: (_) => HomePage(),
        CardSearch.namedRoute: (_) => CardSearch(),
        MyDeck.namedRoute: (_) => MyDeck(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  static const namedRoute = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Center(
                child: const Text(
                  'オレオレウィクロス図鑑',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: const Text('カード検索'),
                    onPressed: () => _onPressedCardSearch(context),
                  ),
                  RaisedButton(
                    child: const Text('マイデッキ'),
                    onPressed: () => _onPressedMyDeck(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onPressedCardSearch(BuildContext context) {
    Navigator.pushNamed(
      context,
      CardSearch.namedRoute,
    );
  }

  void _onPressedMyDeck(BuildContext context) {
    Navigator.pushNamed(
      context,
      MyDeck.namedRoute,
    );
  }
}
