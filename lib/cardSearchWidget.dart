import 'package:flutter/material.dart';

enum _DisplayDeckType {
  all,
  lrig,
  main,
}

enum _DisplayFormat {
  grid,
  list,
}

class CardSearchWidget extends StatefulWidget {
  @override
  _CardSearchWidgetState createState() => _CardSearchWidgetState();
}

class _CardSearchWidgetState extends State<CardSearchWidget> {
  bool _isViewSearchDisplayConditions = true;
  var _displayDeckType = _DisplayDeckType.all;
  var _displayFormat = _DisplayFormat.grid;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              _buildSearchConditions(),
              _buildSearchDisplayConditions(),
            ],
          ),
          _buildDisplayDeckType(),
          Expanded(child: _buildSearchResults()),
        ],
      ),
    );
  }

  /// 検索条件ウィジェット
  Widget _buildSearchConditions() {
    return Row(
      children: [
        IconButton(
          icon: _isViewSearchDisplayConditions
              ? const Icon(Icons.keyboard_arrow_up_outlined)
              : const Icon(Icons.keyboard_arrow_down_outlined),
          onPressed: () => _onPressedIsViewSearchDisplayConditions(),
        ),
        Expanded(
          child: TextField(
            enabled: true,
            maxLines: 1,
            decoration: const InputDecoration(
              hintText: 'カード名・キーワードを入力',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.find_in_page_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  /// 検索表示条件ウィジェット
  Widget _buildSearchDisplayConditions() {
    return Visibility(
      visible: _isViewSearchDisplayConditions,
      child: Row(
        children: [
          SizedBox(width: 50),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('表示順：カード名（昇順）'),
                Text('件数:0件'),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.swap_vert_outlined),
            onPressed: () => _onPressedDisplaySort(),
          ),
          IconButton(
            icon: const Icon(Icons.grid_on_outlined),
            onPressed: () => _onPressedDisplayFormat(),
          ),
        ],
      ),
    );
  }

  /// 検索表示カードタイプ条件ウィジェット
  Widget _buildDisplayDeckType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: RaisedButton(
            child: const Text('全て'),
            color: _displayDeckType == _DisplayDeckType.all
                ? Colors.blue
                : Colors.white,
            onPressed: () => _onPressedDisplayDeckType(_DisplayDeckType.all),
          ),
        ),
        Expanded(
          child: RaisedButton(
            child: const Text('ルリグデッキ'),
            color: _displayDeckType == _DisplayDeckType.lrig
                ? Colors.blue
                : Colors.white,
            onPressed: () => _onPressedDisplayDeckType(_DisplayDeckType.lrig),
          ),
        ),
        Expanded(
          child: RaisedButton(
            child: const Text('メインデッキ'),
            color: _displayDeckType == _DisplayDeckType.main
                ? Colors.blue
                : Colors.white,
            onPressed: () => _onPressedDisplayDeckType(_DisplayDeckType.main),
          ),
        ),
      ],
    );
  }

  /// 検索結果ウィジェット
  Widget _buildSearchResults() {
    return _displayFormat == _DisplayFormat.grid
        ? _buildSearchResultGridDisplay()
        : _buildSearchResultListDisplay();
  }

  /// 検索結果グリッド表示ウィジェット
  Widget _buildSearchResultGridDisplay() {
    final double _itemHeight = 349;
    final double _itemWidth = 250;

    return GridView.count(
      crossAxisCount: 6,
      mainAxisSpacing: 4.0,
      childAspectRatio: (_itemWidth / _itemHeight),
      children: _getTestGridImage(),
    );
  }

  /// 検索結果リスト表示ウィジェット
  Widget _buildSearchResultListDisplay() {
    return ListView(
      children: _getTestListData(),
    );
  }

  /// 検索表示条件の表示・非表示の切り替え
  void _onPressedIsViewSearchDisplayConditions() {
    setState(() {
      _isViewSearchDisplayConditions = !_isViewSearchDisplayConditions;
    });
  }

  /// 検索表示カードタイプ条件の切り替え
  void _onPressedDisplayDeckType(_DisplayDeckType type) {
    setState(() => _displayDeckType = type);
  }

  /// 検索表示ソート条件の表示
  void _onPressedDisplaySort() {
    Widget _generateRow(String name, String high, String low) {
      // Expanded でボタンの比率をそろえる
      return Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Row(
          children: [
            Container(
              width: 75,
              child: Text(name + "：", textAlign: TextAlign.end),
            ),
            SizedBox(width: 10),
            Expanded(
              child: RaisedButton(
                child: Text(high),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: RaisedButton(
                child: Text(low),
              ),
            ),
          ],
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("並び替え", textAlign: TextAlign.center),
          children: <Widget>[
            _generateRow("カード名", "昇順", "降順"),
            _generateRow("レベル", "昇順", "降順"),
          ],
        );
      },
    );
  }

  /// 検索結果表示形式
  void _onPressedDisplayFormat() {
    setState(() {
      _displayFormat = _displayFormat == _DisplayFormat.grid
          ? _DisplayFormat.list
          : _DisplayFormat.grid;
    });
  }

  Widget _photoItem(String img) {
    var _assetsImg = "assets/img/" + img + ".jpg";
    return Container(
      child: Image.asset(
        _assetsImg,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _menuItem(String img) {
    var _assetsImg = "assets/img/" + img + ".jpg";
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            border:
                new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Container(
          height: 100,
          child: Row(
            children: <Widget>[
              Image.asset(
                _assetsImg,
                fit: BoxFit.fitHeight,
                // fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("カード名"),
                    Divider(height: 5),
                    Expanded(
                      child: Text(
                        "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }

  /// テストデータ作成用
  List<Widget> _getTestGridImage() {
    var _list = new List<Widget>();
    for (int i = 1; i <= 50; i++) {
      var num = i.toString().padLeft(3, "0");
      _list.add(_photoItem("0" + num + "_WX01-" + num));
    }
    return _list;
  }

  /// テストデータの作成用
  List<Widget> _getTestListData() {
    var _list = new List<Widget>();
    for (int i = 1; i <= 50; i++) {
      var num = i.toString().padLeft(3, "0");
      _list.add(_menuItem("0" + num + "_WX01-" + num));
    }
    return _list;
  }
}
