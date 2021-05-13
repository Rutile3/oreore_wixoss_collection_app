enum CardDeckType {
  all, // 全ての選択肢
  lrigDeck, // ルリグデッキ
  mainDeck, // メインデッキ
}

const Map<CardDeckType, String> CardDeckTypeText = {
  CardDeckType.all : '全て',
  CardDeckType.lrigDeck : 'ルリグデッキ',
  CardDeckType.mainDeck : 'メインデッキ',
};
