import 'package:flutter/material.dart';
import 'package:myapp/provider/cart_provider.dart';
import 'package:myapp/provider/favorite_provider.dart';
import 'package:myapp/provider/products.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  _Alert(BuildContext context) {
    final snackbar = SnackBar(
        duration: Duration(milliseconds: 200),
        content: Text("Added to cart!",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600)),
        backgroundColor: Colors.green);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductsProvider>(context).popularProducts;
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<FavoriteProvider>(context);
    return Container(
      height: 261.0,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed("/productdetail", arguments: productList[i].id),
                child: Container(
                  height: 260,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: 170,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(productList[i].imgUrl),
                                      fit: BoxFit.fill))),
                          Positioned(
                              top: 5.0,
                              right: 5.0,
                              child: Icon(
                                Icons.star_outlined,
                                color: wishlistProvider.favoriteItem
                                        .containsKey(productList[i].id)
                                    ? Colors.yellow
                                    : Colors.grey,
                              )),
                          Positioned(
                              right: 5,
                              bottom: 10,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                color: Theme.of(context).backgroundColor,
                                child: Text("US \$ ${productList[i].price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    )),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(productList[i].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                productList[i].description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  cartProvider.addToCart(
                                      productList[i].id,
                                      double.parse(productList[i].price),
                                      productList[i].title,
                                      productList[i].imgUrl);
                                  _Alert(context);
                                },
                                child: Icon(Icons.add_shopping_cart_rounded))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
