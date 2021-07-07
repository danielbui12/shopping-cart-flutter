import 'package:flutter/foundation.dart';
import 'package:myapp/models/cart_attribute.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttribute> _cartItem = {};

  Map<String, CartAttribute> get cartItem => _cartItem;

  double get totalAmout {
    var total = 0.0;
    _cartItem.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addToCart(String id, double price, String title, String imgUrl) {
    if (_cartItem.containsKey(id)) {
      _cartItem.update(
          id,
          (existingItem) => CartAttribute(
              existingItem.id,
              existingItem.title,
              existingItem.quantity + 1,
              existingItem.price,
              existingItem.imgUrl));
    } else {
      _cartItem.putIfAbsent(
          id,
          () => CartAttribute(
              DateTime.now().toString(), title, 1, price, imgUrl));
    }
    notifyListeners();
  }
}
