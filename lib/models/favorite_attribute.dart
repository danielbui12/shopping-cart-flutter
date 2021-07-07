import 'package:flutter/foundation.dart';

class FavoriteAttribute with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imgUrl;
  FavoriteAttribute(this.id, this.title, this.price, this.imgUrl);
}
