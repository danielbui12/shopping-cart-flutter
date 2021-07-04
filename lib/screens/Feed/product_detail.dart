import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context).darkTheme;

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
                      child: Image.network(
                          "https://cdn.tgdd.vn/Products/Images/7077/229044/apple-watch-s6-40mm-vien-nhom-day-cao-su-01-600x600.jpg"),
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
                          "Title",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26.0),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "PRICE",
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
                        child: Text("Describtion",
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
                      _detail("Brand", "BrandName"),
                      _detail("Quantities", "12 left"),
                      _detail("Category", "CatName"),
                      _detail("Popularity", "Popular"),
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
                        width: 195,
                        height: 305,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 7,
                            itemBuilder: (BuildContext context, int i) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                ////////////////////////////////////////////////////////////////////////
                                child: null)),
                        ///////////////////////////////////////////////////////////////////
                      ),
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
                        onPressed: () {},
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
