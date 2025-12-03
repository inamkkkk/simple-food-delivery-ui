import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/models/menu_item_model.dart';

class CartModel extends ChangeNotifier {
  final List<MenuItem> _items = [];

  List<MenuItem> get items => _items;

  double get totalPrice => _items.fold(0, (total, current) => total + current.price);

  void addItem(MenuItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(MenuItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
