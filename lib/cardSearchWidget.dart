import 'package:flutter/material.dart';

enum SearchDisplayCardTypeCondition {
  all,
  lrig,
  main,
}

class CardSearchWidget extends StatefulWidget {
  @override
  _CardSearchWidgetState createState() => _CardSearchWidgetState();
}

class _CardSearchWidgetState extends State<CardSearchWidget> {
  var _isViewSearchDisplayConditions = true;
  var _searchDisplayCardTypeCondition = SearchDisplayCardTypeCondition.all;

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
          _buildSearchDisplayCardTypeCondition(),
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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.grid_on_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  /// 検索表示カードタイプ条件ウィジェット
  Widget _buildSearchDisplayCardTypeCondition() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: RaisedButton(
            child: const Text('全て'),
            color: _searchDisplayCardTypeCondition ==
                    SearchDisplayCardTypeCondition.all
                ? Colors.blue
                : Colors.white,
            onPressed: () => _onPressedSearchDisplayCardTypeCondition(
                SearchDisplayCardTypeCondition.all),
          ),
        ),
        Expanded(
          child: RaisedButton(
            child: const Text('ルリグデッキ'),
            color: _searchDisplayCardTypeCondition ==
                    SearchDisplayCardTypeCondition.lrig
                ? Colors.blue
                : Colors.white,
            onPressed: () => _onPressedSearchDisplayCardTypeCondition(
                SearchDisplayCardTypeCondition.lrig),
          ),
        ),
        Expanded(
          child: RaisedButton(
            child: const Text('メインデッキ'),
            color: _searchDisplayCardTypeCondition ==
                    SearchDisplayCardTypeCondition.main
                ? Colors.blue
                : Colors.white,
            onPressed: () => _onPressedSearchDisplayCardTypeCondition(
                SearchDisplayCardTypeCondition.main),
          ),
        ),
      ],
    );
  }

  /// 検索結果ウィジェット
  Widget _buildSearchResults() {
    final double itemHeight = 349;
    final double itemWidth = 250;

    return GridView.count(
      crossAxisCount: 6,
      mainAxisSpacing: 4.0,
      childAspectRatio: (itemWidth / itemHeight),
      children: _getTestImage(),
    );
  }

  /// 検索表示条件の表示・非表示の切り替え
  void _onPressedIsViewSearchDisplayConditions() {
    setState(() {
      _isViewSearchDisplayConditions = !_isViewSearchDisplayConditions;
    });
  }

  /// 検索表示カードタイプ条件の切り替え
  void _onPressedSearchDisplayCardTypeCondition(
      SearchDisplayCardTypeCondition type) {
    setState(() => _searchDisplayCardTypeCondition = type);
  }

  Widget _photoItem(String image) {
    var assetsImage = "assets/img/" + image + ".jpg";
    return Container(
      child: Image.asset(
        assetsImage,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  /// テストデータ作成用
  List<Widget> _getTestImage() {
    return [
      _photoItem("0001_WX01-001"),
      _photoItem("0002_WX01-002"),
      _photoItem("0003_WX01-003"),
      _photoItem("0004_WX01-004"),
      _photoItem("0005_WX01-005"),
      _photoItem("0006_WX01-006"),
      _photoItem("0007_WX01-007"),
      _photoItem("0008_WX01-008"),
      _photoItem("0009_WX01-009"),
      _photoItem("0010_WX01-010"),
      _photoItem("0011_WX01-011"),
      _photoItem("0012_WX01-012"),
      _photoItem("0013_WX01-013"),
      _photoItem("0014_WX01-014"),
      _photoItem("0015_WX01-015"),
      _photoItem("0016_WX01-016"),
      _photoItem("0017_WX01-017"),
      _photoItem("0018_WX01-018"),
      _photoItem("0019_WX01-019"),
      _photoItem("0020_WX01-020"),
      _photoItem("0021_WX01-021"),
      _photoItem("0022_WX01-022"),
      _photoItem("0023_WX01-023"),
      _photoItem("0024_WX01-024"),
      _photoItem("0025_WX01-025"),
      _photoItem("0026_WX01-026"),
      _photoItem("0027_WX01-027"),
      _photoItem("0028_WX01-028"),
      _photoItem("0029_WX01-029"),
      _photoItem("0030_WX01-030"),
      _photoItem("0031_WX01-031"),
      _photoItem("0032_WX01-032"),
      _photoItem("0033_WX01-033"),
      _photoItem("0034_WX01-034"),
      _photoItem("0035_WX01-035"),
      _photoItem("0036_WX01-036"),
      _photoItem("0037_WX01-037"),
      _photoItem("0038_WX01-038"),
      _photoItem("0039_WX01-039"),
      _photoItem("0040_WX01-040"),
      _photoItem("0040_WX01-040"),
      _photoItem("0041_WX01-041"),
      _photoItem("0042_WX01-042"),
      _photoItem("0043_WX01-043"),
      _photoItem("0044_WX01-044"),
      _photoItem("0045_WX01-045"),
      _photoItem("0046_WX01-046"),
      _photoItem("0047_WX01-047"),
      _photoItem("0048_WX01-048"),
      _photoItem("0049_WX01-049"),
      _photoItem("0050_WX01-050"),
    ];
  }
}
