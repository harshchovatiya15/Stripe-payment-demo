class CardModel {
  List<Cards> _cardList = [];
  CardModel(List<dynamic> parsedData) {
    for (int i = 0; i < parsedData.length; i++) {
      _cardList.add(Cards(parsedData[i]));
    }
  }
  List<Cards> get cardList => _cardList;
}

class Cards {
  String _id;
  String _brand;
  String _country;
  String _customer;
  String _last4;
  Cards(Map<String, dynamic> parsedData) {
    _id = parsedData['id'];
    _brand = parsedData['brand'];
    _country = parsedData['country'];
    _customer = parsedData['customer'];
    _last4 = parsedData['last4'];
  }
  Map<String, dynamic> toJson() => {
        "id": _id,
        "brand": _brand,
        "country": _country,
        "customer": _customer,
        "last4": _last4
      };
  String get id => _id;
  String get brand => _brand;
  String get country => _country;
  String get customer => _customer;
  String get last4 => _last4;
}
