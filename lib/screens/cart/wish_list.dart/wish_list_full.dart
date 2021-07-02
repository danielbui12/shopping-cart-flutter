import 'package:flutter/material.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'package:myapp/screens/cart/cart/cart_full.dart';
import 'package:myapp/screens/cart/wish_list.dart/wish_list_empty.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  List wishlist = [];
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context).darkTheme;
    return wishlist.isEmpty
        ? Scaffold(
            body: WishListEmpty(),
          )
        : Scaffold(
            body: Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return CartFull();
                  }),
            ),
          );
  }
}
