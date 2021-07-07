import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:myapp/const/alert.dart';
import 'package:myapp/models/cart_attribute.dart';
import 'package:myapp/provider/cart_provider.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  final String productId;

  const CartFull(this.productId);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    Alert alert = Alert();
    final themeChange = Provider.of<DarkThemeProvider>(context).darkTheme;
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = Provider.of<CartAttribute>(context);
    double subTotal = cartItems.price * cartItems.quantity;
    // String price =subTotal.toStringAsFixed(2);
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed("/productdetail", arguments: widget.productId),
      child: Container(
        height: 170.0,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16.0),
              topRight: Radius.circular(16.0)),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 140.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(cartItems.imgUrl))),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            cartItems.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                        IconButton(
                          color: Theme.of(context).buttonColor,
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {
                            alert.alert(
                                "Remove item!",
                                "Product will be removed from the cart!",
                                () => cartProvider.removeItem(widget.productId),
                                context);
                          },
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Prices: "),
                        SizedBox(width: 5.0),
                        Text(
                          "\$ ${cartItems.price}",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 8.0),
                    _TextWrapper(
                        "Sub Total: ",
                        "\$ " + subTotal.toStringAsFixed(2),
                        !themeChange
                            ? Theme.of(context).accentColor
                            : Colors.blueGrey.shade400),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Text("Ship Free",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: !themeChange
                                    ? Theme.of(context).accentColor
                                    : Colors.blueGrey.shade400,
                              )),
                        ),
                        Row(
                          children: <Widget>[
                            _AcitonButton(
                                "-",
                                36.0,
                                cartItems.quantity > 1
                                    ? Colors.red
                                    : Colors.grey,
                                cartItems.quantity > 1
                                    ? () => cartProvider.reductQuantityItems(
                                        widget.productId,
                                        cartItems.price,
                                        cartItems.title,
                                        cartItems.imgUrl)
                                    : null),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                ColorsConsts.gradiendLStart,
                                ColorsConsts.gradiendLEnd
                              ])),
                              width: MediaQuery.of(context).size.width * 0.12,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "${cartItems.quantity}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                            _AcitonButton(
                                "+",
                                28.0,
                                Colors.green,
                                () => cartProvider.addToCart(
                                    widget.productId,
                                    cartItems.price,
                                    cartItems.title,
                                    cartItems.imgUrl))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _TextWrapper(String text1, String text2, color) {
    return Row(
      children: <Widget>[
        Text(text1),
        SizedBox(width: 5.0),
        Text(
          text2,
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: color),
        )
      ],
    );
  }

  Widget _AcitonButton(String text, double fontSize, Color color, onPress) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: InkWell(
        onTap: onPress,
        child: Text(
          text,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
      ),
    );
  }
}
