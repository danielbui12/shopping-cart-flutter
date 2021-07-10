import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/models/product_model.dart';
import 'package:myapp/provider/cart_provider.dart';
import 'package:myapp/provider/favorite_provider.dart';
import 'package:myapp/provider/products.dart';
import 'package:myapp/screens/Feed/feed_product.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    List<Product> products = productProvider.products;
    final popular = ModalRoute.of(context)?.settings.arguments;
    final wishlistProvider =
        Provider.of<FavoriteProvider>(context).favoriteItem;
    final cartProvider = Provider.of<CartProvider>(context);
    if (popular == "popular") {
      products = productProvider.popularProducts;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
          backgroundColor: Theme.of(context).cardColor,
          elevation: 10.0,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Consumer<FavoriteProvider>(
                builder: (_, wishlist, child) => Badge(
                  animationType: BadgeAnimationType.slide,
                  toAnimate: true,
                  position: BadgePosition(top: 2, end: -5),
                  badgeContent: Text(
                    wishlistProvider.length.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                  child: InkWell(
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.pink,
                    ),
                    onTap: () => Navigator.of(context).pushNamed("/wishlist"),
                  ),
                ),
              ),
            ),
            Consumer<CartProvider>(
              builder: (_, cart, child) => Badge(
                  animationType: BadgeAnimationType.slide,
                  toAnimate: true,
                  position: BadgePosition(top: 2, end: 5),
                  badgeContent: Text(
                    cartProvider.cartItem.length.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: InkWell(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.green,
                        ),
                        onTap: () => Navigator.of(context).pushNamed("/cart")),
                  )),
            ),
          ],
        ),
        body: StaggeredGridView.countBuilder(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          crossAxisCount: 4,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) =>
              ChangeNotifierProvider.value(
                  value: products[index], child: FeedProducts()),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 3.25 : 3.75),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ));
  }
}
