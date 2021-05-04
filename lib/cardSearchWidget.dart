import 'package:flutter/material.dart';

class CardSearchWidget extends StatefulWidget {
  @override
  _CardSearchWidgetState createState() => _CardSearchWidgetState();
}

class _CardSearchWidgetState extends State<CardSearchWidget> {
  @override
  Widget build(BuildContext context) {
    var list = [
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
    ];

    var size = MediaQuery.of(context).size;
    final double itemHeight = 349;
    final double itemWidth = 250;

    return Container(
      child: Column(
        children: [
          // 検索バー
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                onPressed: () {},
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
          ),
          // 検索結果
          Expanded(
            child: GridView.count(
              crossAxisCount: 6,
              mainAxisSpacing: 4.0,
              childAspectRatio: (itemWidth / itemHeight),
              children: list,
            ),
          ),
        ],
      ),
    );
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
}
