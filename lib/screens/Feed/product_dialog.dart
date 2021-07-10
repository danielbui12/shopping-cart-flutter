import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:myapp/provider/cart_provider.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'package:myapp/provider/favorite_provider.dart';
import 'package:myapp/provider/products.dart';
import 'package:provider/provider.dart';

class FeedDiaLog extends StatelessWidget {
  final String productId;
  FeedDiaLog(this.productId);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context, listen: false)
        .findById(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<FavoriteProvider>(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                constraints: BoxConstraints(
                    minHeight: 100,
                    maxHeight: MediaQuery.of(context).size.height * 0.5),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: Image.network(productData.imgUrl)),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: diaLogContent(context, 0, () {
                      wishlistProvider.addToFavorite(
                          productId,
                          double.parse(productData.price),
                          productData.title,
                          productData.imgUrl);
                      Navigator.of(context).canPop()
                          ? Navigator.of(context).pop()
                          : null;
                    }),
                  ),
                  Flexible(
                      child: diaLogContent(
                          context,
                          1,
                          () => Navigator.of(context)
                              .pushNamed("/productdetail", arguments: productId)
                              .then((value) => Navigator.of(context).canPop()
                                  ? Navigator.of(context).pop()
                                  : null))),
                  Flexible(
                      child: diaLogContent(context, 2, () {
                    cartProvider.addToCart(
                        productId,
                        double.parse(productData.price),
                        productData.title,
                        productData.imgUrl);
                    Navigator.of(context).canPop()
                        ? Navigator.of(context).pop()
                        : null;
                  }))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget diaLogContent(BuildContext context, int index, onPress) {
    final cartProvider = Provider.of<CartProvider>(context).cartItem;
    final wishlistProvider = Provider.of<FavoriteProvider>(context);
    final themeChange = Provider.of<DarkThemeProvider>(context).darkTheme;

    bool icons = wishlistProvider.favoriteItem.containsKey(productId);
    bool texts = cartProvider.containsKey(productId);

    List<IconData> _dialogIcons = [
      icons ? Icons.favorite : Icons.favorite_outline,
      Icons.remove_red_eye_outlined,
      Icons.shopping_cart
    ];

    List<String> _texts = [
      texts ? "In wishlist" : "Add to wishlist",
      "View product",
      texts ? "In cart" : "Add to cart"
    ];

    List<Color> colors = [
      icons ? Colors.red : Theme.of(context).textSelectionColor,
      Theme.of(context).textSelectionColor,
      Theme.of(context).textSelectionColor,
    ];

    return FittedBox(
      child: Material(
          child: InkWell(
        onTap: onPress,
        splashColor: Colors.grey,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: const Offset(0.0, 10.0))
                    ]),
                child: ClipOval(
                    child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: Icon(_dialogIcons[index], color: colors[index]),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text(
                    _texts[index],
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: themeChange
                            ? Theme.of(context).disabledColor
                            : ColorsConsts.subTitle),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
