import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'package:myapp/screens/cart/cart_empty.dart';
import 'package:myapp/screens/cart/cart_full.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  List cart = [1];
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context).darkTheme;
    return cart.isEmpty
        ? Scaffold(
            body: CartEmpty(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("Cart Items Count :"),
              elevation: 10.0,
              actions: [
                Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_outline),
                    ))
              ],
            ),
            body: Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return CartFull();
                  }),
            ),
            bottomSheet: _checkoutSection(themeChange),
          );
  }

  _checkoutSection(bool themeChange) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: !themeChange ? Colors.black : Colors.white,
                  width: 0.5),
              bottom: BorderSide(
                  color: !themeChange ? Colors.black : Colors.white,
                  width: 0.5))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 32.0),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    gradient: LinearGradient(colors: [
                      ColorsConsts.gradiendLStart,
                      ColorsConsts.gradiendLEnd
                    ])),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Checkout",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              "Total:    ",
              style: TextStyle(
                  color: themeChange ? Colors.white : Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "\$130.000",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
