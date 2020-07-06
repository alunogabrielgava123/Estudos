import 'package:CatuaShopping/Model/item.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class ListItem extends ChangeNotifier {
  List<Item> _listView = [
    Item(name: "Chocolate",price: 5.00),
    Item(name: "Abajur",price: 25.00),
    Item(name: "Geladeira",price: 35.00)
  ];

  List<Item> _listFavorit = [];
    
  List get listaProducts => _listView;
  List get listaFavoritcs => _listFavorit;

  void isFavorit(Item item) {
    item.isSelect = true;
    notifyListeners();
  }

  void addListFavorit(Item item) {
    item.isSelect
        ? _listFavorit.add(Item(name: item.name, isSelect: item.isSelect))
        : _listFavorit.removeLast();
    notifyListeners();
  }

  void clear() {
    _listFavorit.clear();
    var isFavorit = _listView.where((item) => item.isSelect = false);
    print(isFavorit);
    notifyListeners();
  }

  void toTalPrice(){
    var isCountTotal = _listView.where((item) => item.price != 0);
  }

  String get getItemCountList =>  _listFavorit.length.toString();

  
}
