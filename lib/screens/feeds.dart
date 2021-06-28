import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/screens/Feed/feed_product.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.countBuilder(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      crossAxisCount: 4,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) => FeedProducts(),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 3 : 3.75),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
    ));
  }
}
