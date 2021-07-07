import 'package:flutter/foundation.dart';
import 'package:myapp/models/favorite_attribute.dart';

class FavoriteProvider with ChangeNotifier {
  Map<String, FavoriteAttribute> _favoriteItem = {};

  Map<String, FavoriteAttribute> get favoriteItem => {..._favoriteItem};

  void addToFavorite(String id, double price, String title, String imgUrl) {
    if (_favoriteItem.containsKey(id)) {
      removeItem(id);
    } else {
      _favoriteItem.putIfAbsent(
          id,
          () => FavoriteAttribute(
              DateTime.now().toString(), title, price, imgUrl));
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _favoriteItem.remove(productId);
    notifyListeners();
  }

  void clearFavorite() {
    _favoriteItem.clear();
    notifyListeners();
  }
}
