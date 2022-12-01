// import 'package:flutter/material.dart';

// class Items with ChangeNotifier {
//   final List<List<dynamic>> _shoppingList = [
//     ['Одеяло', false],
//     ['Кровать', false],
//     ['Подушка', false],
//   ];

//   void addItem(List<dynamic> item) {
//     _shoppingList.add(item);
//     notifyListeners();
//   }

//   void removeItem(String name) {
//     var element = _shoppingList
//         .firstWhere((element) => element[0] == name && element[1] == true);
//     _shoppingList.remove(element);
//     notifyListeners();
//   }

//   // void changeItemCondition(int index, bool value) {
//   //   _shoppingList[index][1] = value;
//   //   notifyListeners();
//   // }

//   void sortItems() {
//     _shoppingList.sort((a, b) => a[0].compareTo(b[0]));
//     notifyListeners();
//   }

//   void notify() {
//     notifyListeners();
//   }

//   List<List<dynamic>> getItemList() {
//     return _shoppingList;
//   }
// }
