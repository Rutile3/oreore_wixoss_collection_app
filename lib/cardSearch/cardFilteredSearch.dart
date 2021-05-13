import 'package:flutter/material.dart';
import 'package:oreore_wixoss_collection_app/constant/cardDeckType.dart';

class _FilterItem {
  final String title;
  final List<String> buttonTitleList;
  bool isOpen = false;

  _FilterItem(this.title, this.buttonTitleList);
}

class CardFilteredSearch extends StatefulWidget {
  static const namedRoute = 'CardFilteredSearch';

  @override
  _CardFilteredSearchState createState() => _CardFilteredSearchState();
}

class _CardFilteredSearchState extends State<CardFilteredSearch> {
  final _lrigDeckFilterList = [
    _FilterItem('カード種類', [
      'シグニ',
      'スペル',
    ]),
    _FilterItem('フォーマット', [
      'ディーヴァ',
      'キー',
      'オール',
    ]),
    _FilterItem('色', [
      '白',
      '赤',
      '青',
      '緑',
      '黒',
      '無',
    ]),
    _FilterItem('レベル', [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
    ]),
    _FilterItem('クラス（小分類）', [
      'アーム',
      '悪魔',
      'ウェポン',
      '宇宙',
      '英知',
      '怪異',
      '凶蟲',
      '空獣',
      '原子',
      '鉱石',
      '古代兵器',
      '植物',
      '乗機',
      '水獣',
      '地獣',
      '調理',
      '天使',
      '電機',
      'トリック',
      '毒牙',
      '微菌',
      '美巧',
      '武勇',
      '宝石',
      '迷宮',
      '遊具',
      '龍獣',
    ]),
    _FilterItem('クラス（中分類）', [
      '奏武',
      '奏像',
      '奏械',
      '奏羅',
      '奏生',
      '奏元',
      '精武',
      '精像',
      '精械',
      '精羅',
      '精生',
      '精元',
    ]),
    _FilterItem('限定条件', [
      '無し',
      'アイヤイ',
      'あや',
      'アルフォウ',
      'アン',
      'イオナ',
      'ウムル',
      'ウリス',
      'エマ',
      'エルドラ',
      'カーニバル',
      'グズ子',
      'サシェ',
      'タウィル',
      'タマ',
      'ドーナ',
      '？',
      '花代',
      'ナナシ',
      'にじさんじ',
      'ハナレ',
      'ピルルク',
      'ママ',
      'マユ',
      '緑子',
      'ミュウ',
      'ミルルン',
      '夢限',
      'メル',
      'ユキ',
      'ユヅキ',
      'リメンバ',
      'リル',
      'レイラ',
      'LoV',
    ]),
    _FilterItem('ガード', [
      'あり',
      'なし',
    ]),
    _FilterItem('バースト', [
      'あり',
      'なし',
    ]),
    _FilterItem('パワー', [
      '1,000',
      '2,000',
      '3,000',
      '4,000',
      '5,000',
      '6,000',
      '7,000',
      '8,000',
      '9,000',
      '10,000',
      '11,000',
      '12,000',
      '13,000',
      '14,000',
      '15,000',
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('条件検索'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: CardDeckTypeText[CardDeckType.lrigDeck]),
              Tab(text: CardDeckTypeText[CardDeckType.mainDeck]),
            ],
          ),
        ),
        body: TabBarView(children: [
          _buildLrigDeckFilter(),
          _buildMainDeckFilter(),
        ]),
      ),
    );
  }

  /// ルリグデッキの条件検索
  Widget _buildLrigDeckFilter() {
    return Text('_buildLrigDeckFilter');
  }

  /// メインデッキの条件検索
  Widget _buildMainDeckFilter() {
    return ListView(
      children: _lrigDeckFilterList.map((e) {
        return _generateFilterExpansionPanel(e);
      }).toList(),
    );
    // return ExpansionPanelList(
    //   children: _lrigDeckFilterList.map((e) {
    //     return _generateFilterExpansionPanel(e);
    //   }).toList(),
    //   expansionCallback: (i, isOpen) =>
    //       setState(() => _lrigDeckFilterList[i].isOpen = !isOpen),
    // );
  }

  /// フィルターの項目
  Widget _generateFilterExpansionPanel(_FilterItem _filterItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _generateFilterTitle(_filterItem.title),
        _generateFilterButtons(_filterItem.buttonTitleList),
      ],
    );

    // return ExpansionPanel(
    //   headerBuilder: (context, isOpen) {
    //     return _generateFilterTitle(_filterItem.title);
    //   },
    //   body: _generateFilterButtons(_filterItem.buttonTitleList),
    //   isExpanded: _filterItem.isOpen,
    // );
  }

  /// フィルターの名前
  Widget _generateFilterTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(thickness: 3),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(title),
        ),
        Divider(thickness: 3),
      ],
    );
  }

  /// フィルターのボタン
  Widget _generateFilterButtons(List<String> buttonTitleList) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            runSpacing: 5,
            children: buttonTitleList.map((e) {
              return RaisedButton(
                child: Container(
                  alignment: Alignment.center,
                  width: 75,
                  child: Text(e),
                ),
                onPressed: () {},
              );
            }).toList(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
