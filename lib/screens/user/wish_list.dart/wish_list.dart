import 'package:flutter/material.dart';
import 'package:myapp/screens/cart/cart_full.dart';
import 'package:myapp/screens/user/wish_list.dart/wish_list_full.dart';

import 'wish_list_empty.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  List wishlist = [];

  @override
  Widget build(BuildContext context) {
    return !wishlist.isEmpty
        ? Scaffold(
            body: WishListEmpty(),
          )
        : Scaffold(
            appBar: AppBar(title: Text("WishList()")),
            body: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, int i) => WishListFull()));
  }
}
