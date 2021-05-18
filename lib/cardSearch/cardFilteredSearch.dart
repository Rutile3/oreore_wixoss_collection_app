import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:oreore_wixoss_collection_app/constant/cardDeckType.dart';

class CardFilteredSearch extends StatefulWidget {
  static const namedRoute = 'CardFilteredSearch';

  @override
  _CardFilteredSearchState createState() => _CardFilteredSearchState();
}

class _CardFilteredSearchState extends State<CardFilteredSearch> {
  List<_FilterPanelData> _lrigDeckFilter =
      _FilterPanelData.createLrigDeckPanelDataList();
  List<_FilterPanelData> _mainDeckFilter =
      _FilterPanelData.createMainDeckPanelDataList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('条件検索'),
          centerTitle: true,
          actions: [
            IconButton(icon: const Icon(Icons.clear), onPressed: () {}),
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
          bottom: TabBar(tabs: [
            Tab(text: CardDeckTypeText[CardDeckType.lrigDeck]),
            Tab(text: CardDeckTypeText[CardDeckType.mainDeck]),
          ]),
        ),
        body: TabBarView(children: [
          _generateExpansionPanelList(_lrigDeckFilter),
          _generateExpansionPanelList(_mainDeckFilter),
        ]),
      ),
    );
  }

  /// フィルターのパネルリストの生成
  Widget _generateExpansionPanelList(List<_FilterPanelData> panelDataList) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        children: panelDataList.map((panelData) {
          return ExpansionPanel(
            headerBuilder: (context, isOpen) {
              return Container(
                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsets.only(left: 20),
                child: Text(panelData.title),
              );
            },
            body: _generateExpansionPanelBody(panelData),
            isExpanded: panelData.isExpanded,
          );
        }).toList(),
        expansionCallback: (index, isOpen) {
          setState(() {
            panelDataList[index].isExpanded = !isOpen;
          });
        },
      ),
    );
  }

  /// フィルターのパネルのボディの生成
  Widget _generateExpansionPanelBody(_FilterPanelData panelData) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _generateThreeLineButton(panelData.filterButtonList),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  /// フィルターボタンを3ライン区切りで表示するウィジェットの生成
  Widget _generateThreeLineButton(List<_FilterButton> buttonList) {
    var threeLineButtonList = _from1DWidgetListTo2DWidgetList(buttonList, 3);

    return Column(
      children: threeLineButtonList.map((threeLineButton) {
        return Row(
          children: [
            Expanded(child: threeLineButton[0]),
            SizedBox(width: 5),
            Expanded(child: threeLineButton[1]),
            SizedBox(width: 5),
            Expanded(child: threeLineButton[2]),
          ],
        );
      }).toList(),
    );
  }

  /// 1次元配列のウィジェットを2次元配列に変換します
  List<List<Widget>> _from1DWidgetListTo2DWidgetList(
      List<Widget> list, int part) {
    var outer = List<List<Widget>>();
    int outerIndex = 0;

    while (outerIndex < list.length) {
      var inner = List<Widget>.generate(part, (index) => SizedBox.shrink());
      int innerIndex = 0;

      while (outerIndex < list.length && innerIndex < part) {
        inner[innerIndex] = list[outerIndex];
        innerIndex++;
        outerIndex++;
      }
      outer.add(inner);
    }

    return outer;
  }
}

/// フィルター項目のデータ
class _FilterPanelData {
  final String title;
  final List<_FilterButton> filterButtonList;
  bool isExpanded = false;

  _FilterPanelData(this.title, this.filterButtonList);

  /// ルリグデッキのフィルターのパネルリストを生成
  static List<_FilterPanelData> createLrigDeckPanelDataList() {
    return [
      _FilterPanelData('カード種類', [
        _FilterButton('ルリグ'),
        _FilterButton('アシスト'),
        _FilterButton('ピース'),
        _FilterButton('アーツ'),
        _FilterButton('キー'),
        _FilterButton('レゾナ'),
        _FilterButton('クラフト'),
      ]),
      _FilterPanelData('フォーマット', [
        _FilterButton('ディーヴァ'),
        _FilterButton('キー'),
        _FilterButton('オール'),
      ]),
      _FilterPanelData('色', [
        _FilterButton('白'),
        _FilterButton('赤'),
        _FilterButton('青'),
        _FilterButton('緑'),
        _FilterButton('黒'),
        _FilterButton('無'),
      ]),
      _FilterPanelData('レベル', [
        _FilterButton('0'),
        _FilterButton('1'),
        _FilterButton('2'),
        _FilterButton('3'),
        _FilterButton('4'),
        _FilterButton('5'),
      ]),
    ];
  }

  /// メインデッキのフィルターのパネルリストを生成
  static List<_FilterPanelData> createMainDeckPanelDataList() {
    return [
      _FilterPanelData('カード種類', [
        _FilterButton('シグニ'),
        _FilterButton('スペル'),
      ]),
      _FilterPanelData('フォーマット', [
        _FilterButton('ディーヴァ'),
        _FilterButton('キー'),
        _FilterButton('オール'),
      ]),
      _FilterPanelData('色', [
        _FilterButton('白'),
        _FilterButton('赤'),
        _FilterButton('青'),
        _FilterButton('緑'),
        _FilterButton('黒'),
        _FilterButton('無'),
      ]),
      _FilterPanelData('レベル', [
        _FilterButton('0'),
        _FilterButton('1'),
        _FilterButton('2'),
        _FilterButton('3'),
        _FilterButton('4'),
        _FilterButton('5'),
      ]),
      _FilterPanelData('クラス（小分類）', [
        _FilterButton('アーム'),
        _FilterButton('悪魔'),
        _FilterButton('ウェポン'),
        _FilterButton('宇宙'),
        _FilterButton('英知'),
        _FilterButton('怪異'),
        _FilterButton('凶蟲'),
        _FilterButton('空獣'),
        _FilterButton('原子'),
        _FilterButton('鉱石'),
        _FilterButton('古代兵器'),
        _FilterButton('植物'),
        _FilterButton('乗機'),
        _FilterButton('水獣'),
        _FilterButton('地獣'),
        _FilterButton('調理'),
        _FilterButton('天使'),
        _FilterButton('電機'),
        _FilterButton('トリック'),
        _FilterButton('毒牙'),
        _FilterButton('微菌'),
        _FilterButton('美巧'),
        _FilterButton('武勇'),
        _FilterButton('宝石'),
        _FilterButton('迷宮'),
        _FilterButton('遊具'),
        _FilterButton('龍獣'),
      ]),
      _FilterPanelData('クラス（中分類）', [
        _FilterButton('奏武'),
        _FilterButton('奏像'),
        _FilterButton('奏械'),
        _FilterButton('奏羅'),
        _FilterButton('奏生'),
        _FilterButton('奏元'),
        _FilterButton('精武'),
        _FilterButton('精像'),
        _FilterButton('精械'),
        _FilterButton('精羅'),
        _FilterButton('精生'),
        _FilterButton('精元'),
      ]),
      _FilterPanelData('限定条件', [
        _FilterButton('無し'),
        _FilterButton('アイヤイ'),
        _FilterButton('あや'),
        _FilterButton('アルフォウ'),
        _FilterButton('アン'),
        _FilterButton('イオナ'),
        _FilterButton('ウムル'),
        _FilterButton('ウリス'),
        _FilterButton('エマ'),
        _FilterButton('エルドラ'),
        _FilterButton('カーニバル'),
        _FilterButton('グズ子'),
        _FilterButton('サシェ'),
        _FilterButton('タウィル'),
        _FilterButton('タマ'),
        _FilterButton('ドーナ'),
        _FilterButton('？'),
        _FilterButton('花代'),
        _FilterButton('ナナシ'),
        _FilterButton('にじさんじ'),
        _FilterButton('ハナレ'),
        _FilterButton('ピルルク'),
        _FilterButton('ママ'),
        _FilterButton('マユ'),
        _FilterButton('緑子'),
        _FilterButton('ミュウ'),
        _FilterButton('ミルルン'),
        _FilterButton('夢限'),
        _FilterButton('メル'),
        _FilterButton('ユキ'),
        _FilterButton('ユヅキ'),
        _FilterButton('リメンバ'),
        _FilterButton('リル'),
        _FilterButton('レイラ'),
        _FilterButton('LoV'),
      ]),
      _FilterPanelData('ガード', [
        _FilterButton('あり'),
        _FilterButton('なし'),
      ]),
      _FilterPanelData('バースト', [
        _FilterButton('あり'),
        _FilterButton('なし'),
      ]),
      _FilterPanelData('パワー', [
        _FilterButton('1,000'),
        _FilterButton('2,000'),
        _FilterButton('3,000'),
        _FilterButton('4,000'),
        _FilterButton('5,000'),
        _FilterButton('6,000'),
        _FilterButton('7,000'),
        _FilterButton('8,000'),
        _FilterButton('9,000'),
        _FilterButton('10,000'),
        _FilterButton('11,000'),
        _FilterButton('12,000'),
        _FilterButton('13,000'),
        _FilterButton('14,000'),
        _FilterButton('15,000'),
      ]),
    ];
  }
}

/// フィルターボタン
class _FilterButton extends StatefulWidget {
  final String title;
  bool checked = false;

  _FilterButton(this.title, {Key key}) : super(key: key);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<_FilterButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: widget.checked ? Colors.lightBlue : Colors.black12,
      child: Text(
        widget.title,
        style: TextStyle(
          color: widget.checked ? Colors.white : Colors.black87,
        ),
      ),
      onPressed: () {
        setState(() {
          widget.checked = !widget.checked;
        });
      },
    );
  }
}
