import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/models/product_model.dart';
import 'package:myapp/provider/products.dart';
import 'package:myapp/screens/Feed/feed_product.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    List<Product> products = productProvider.products;
    final popular = ModalRoute.of(context)?.settings.arguments as String;
    if (popular == "popular") {
      products = productProvider.popularProducts;
    }
    return Scaffold(
        body: StaggeredGridView.countBuilder(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      crossAxisCount: 4,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) =>
          ChangeNotifierProvider.value(
              value: products[index], child: FeedProducts()),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 3 : 3.75),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
    ));
  }
}
