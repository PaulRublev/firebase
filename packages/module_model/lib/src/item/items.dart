import 'package:flutter/material.dart';

class Items with ChangeNotifier {
  final List<List<dynamic>> _shoppingList = [
    ['Одеяло', false],
    ['Кровать', false],
    ['Подушка', false],
  ];

  void addItem(List<dynamic> item) {
    _shoppingList.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _shoppingList.removeAt(index);
    notifyListeners();
  }

  void changeItemCondition(int index, bool value) {
    _shoppingList[index][1] = value;
    notifyListeners();
  }

  void sortItems() {
    _shoppingList.sort(((a, b) => a[0].compareTo(b[0])));
    notifyListeners();
  }

  List<List<dynamic>> getItemList() {
    return _shoppingList;
  }
}
