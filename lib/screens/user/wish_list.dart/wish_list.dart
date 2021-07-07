import 'package:flutter/material.dart';
import 'package:myapp/const/alert.dart';
import 'package:myapp/provider/favorite_provider.dart';
import 'package:myapp/screens/user/wish_list.dart/wish_list_full.dart';
import 'package:provider/provider.dart';

import 'wish_list_empty.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<FavoriteProvider>(context);
    final wishlist = wishlistProvider.favoriteItem;
    Alert alert = Alert();
    return wishlist.isEmpty
        ? Scaffold(
            appBar: AppBar(title: Text("WishList(0)"), elevation: 10.0),
            body: WishListEmpty(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("WishList(${wishlist.length})"),
              elevation: 10.0,
              actions: [
                Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                      onPressed: () {
                        alert.alert(
                            "Clear wishlist!",
                            "Your wishlist will be cleared",
                            () => wishlistProvider.clearFavorite(),
                            context);
                      },
                      icon: Icon(Icons.delete_outline),
                    ))
              ],
            ),
            body: ListView.builder(
                itemCount: wishlist.length,
                itemBuilder: (BuildContext context, int i) =>
                    ChangeNotifierProvider.value(
                        value: wishlist.values.toList()[i],
                        child: WishListFull(
                            wishlistProvider.favoriteItem.keys.toList()[i]))));
  }
}
