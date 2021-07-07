import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:myapp/models/product_model.dart';
import 'package:myapp/provider/cart_provider.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'package:myapp/provider/products.dart';
import 'package:myapp/screens/Feed/feed_product.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  _Alert(BuildContext context) {
    final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
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
    final themeChange = Provider.of<DarkThemeProvider>(context).darkTheme;
    final productList = Provider.of<ProductsProvider>(context).products;
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final productAttribute =
        Provider.of<ProductsProvider>(context).findById(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: InkWell(
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.pink,
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/wishlist"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: InkWell(
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.green,
                    ),
                    onTap: () => Navigator.of(context).pushNamed("/cart")),
              )
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      foregroundDecoration:
                          BoxDecoration(color: Colors.black12),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Image.network(productAttribute.imgUrl),
                    ),
                    Positioned(
                      bottom: 6,
                      right: 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 14.0),
                            child: InkWell(
                              child: Icon(
                                Icons.add_shopping_cart_rounded,
                                color: Colors.green,
                              ),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 14.0),
                            child: InkWell(
                              child: Icon(
                                Icons.share,
                                color: Colors.blue,
                              ),
                              onTap: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          productAttribute.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26.0),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "US \$ ${productAttribute.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: themeChange
                                  ? Theme.of(context).disabledColor
                                  : ColorsConsts.subTitle),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13.0),
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(productAttribute.description,
                            style: TextStyle(
                                fontSize: 21.0, color: Colors.grey.shade600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13.0),
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                      _detail("Brand", productAttribute.brand),
                      _detail(
                          "Quantities", "${productAttribute.quantity} left"),
                      _detail("Category", productAttribute.productCategoryName),
                      _detail("Popularity",
                          productAttribute.isPopular ? "Popular" : "No"),
                      SizedBox(height: 20.0),
                      Container(
                        color: Theme.of(context).backgroundColor,
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text("No reviews yet",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text("Be the first review",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: !themeChange
                                        ? ColorsConsts.subTitle
                                        : Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 305,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productList.length,
                              itemBuilder: (BuildContext context, int i) =>
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ChangeNotifierProvider.value(
                                          value: productList[i],
                                          child: FeedProducts()))))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.green.shade400,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                        child: Text(
                          "ADD TO CART",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0),
                        ),
                        onPressed: () {
                          cartProvider.addToCart(
                              productId,
                              double.parse(productAttribute.price),
                              productAttribute.title,
                              productAttribute.imgUrl);
                          _Alert(context);
                          print(cartProvider.cartItem.length);
                          // print(
                          //     "id: $productId,price: ${double.parse(productAttribute.price)},title:  ${productAttribute.title} ${productAttribute.imgUrl}");
                        },
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.white,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                        child: Text(
                          "BUY NOW",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                        onPressed: () {},
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.red.shade400,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                        child: Icon(Icons.favorite_outline_rounded,
                            color: Colors.white),
                        onPressed: () {},
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  _detail(String content, String detail) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
      child: Row(
        children: [
          Text(
            "${content}:  ",
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          Text(
            detail,
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
