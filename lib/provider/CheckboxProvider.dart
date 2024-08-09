import 'package:flutter/cupertino.dart';

import '../model/CheckboxItem.dart';

class CheckboxProvider extends ChangeNotifier {
  final List<CheckboxItem> _items = [
    CheckboxItem(label: 'Item 1'),
    CheckboxItem(label: 'Item 2'),
    CheckboxItem(label: 'Item 3'),
  ];

  List<CheckboxItem> get items => _items;

  void toggleCheckbox(int index) {
    _items[index].isChecked = !_items[index].isChecked;
    notifyListeners();
  }

  void toggleAll(bool isChecked) {
    for (var item in _items) {
      item.isChecked = isChecked;
    }
    notifyListeners();
  }
  void toggleUnselectAll(bool isChecked) {
    for (var item in _items) {
      item.isChecked = isChecked;
    }
    notifyListeners();
  }
}