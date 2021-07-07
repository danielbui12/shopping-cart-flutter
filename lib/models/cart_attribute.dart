import 'package:flutter/foundation.dart';

class CartAttribute with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imgUrl;
  CartAttribute(this.id, this.title, this.quantity, this.price, this.imgUrl);
}
