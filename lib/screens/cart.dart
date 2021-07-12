import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:myapp/const/alert.dart';
import 'package:myapp/models/cart_attribute.dart';
import 'package:myapp/provider/cart_provider.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'package:myapp/screens/cart/cart_empty.dart';
import 'package:myapp/screens/cart/cart_full.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  Alert alert = Alert();

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context).darkTheme;
    final cartProvider = Provider.of<CartProvider>(context);
    final cart = cartProvider.cartItem.values.toList();
    return cart.isEmpty
        ? Scaffold(
            appBar: AppBar(),
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
                      onPressed: () {
                        alert.alert("Clear cart!", "Your cart will be cleared",
                            () => cartProvider.clearCart(), context);
                      },
                      icon: Icon(Icons.delete_outline),
                    ))
              ],
            ),
            body: Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ChangeNotifierProvider<CartAttribute>.value(
                          value: CartAttribute(
                              cart[index].id,
                              cart[index].title,
                              cart[index].quantity,
                              cart[index].price,
                              cart[index].imgUrl),
                          child: CartFull(
                              cartProvider.cartItem.keys.toList()[index]))),

              // cartProvider.cartItem.keys.toList()[index]
            ),
            bottomSheet: _checkoutSection(themeChange, cartProvider.totalAmout),
          );
  }

  _checkoutSection(bool themeChange, double total) {
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
              "\$ " + total.toStringAsFixed(3),
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
