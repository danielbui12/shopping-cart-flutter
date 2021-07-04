import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/models/product_model.dart';
import 'package:myapp/screens/Feed/feed_product.dart';

class Feed extends StatelessWidget {
  final List<Product> product = Product.getMovie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.countBuilder(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      crossAxisCount: 4,
      itemCount: product.length,
      itemBuilder: (BuildContext context, int index) => FeedProducts(
        product[index].id,
        product[index].description,
        product[index].price,
        product[index].imgUrl,
        product[index].quantity,
        product[index].isFavorite,
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 3 : 3.75),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
    ));
  }
}
