import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:myapp/provider/cart_provider.dart';
import 'package:myapp/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class SearchByHeader extends SliverPersistentHeaderDelegate {
  final double flexibleSpace;
  final double backgroundHeight;
  final double stackPaddingTop;
  final double titlePaddingTop;
  final Widget title;
  final subtitle;
  final leading;
  final action;
  final Widget stackChild;

  SearchByHeader(
      {this.flexibleSpace = 350,
      this.backgroundHeight = 300,
      required this.stackPaddingTop,
      this.titlePaddingTop = 35,
      required this.title,
      this.subtitle,
      this.leading,
      this.action,
      required this.stackChild});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapContent) {
    var percent = shrinkOffset / (maxExtent - minExtent);
    double calculator = 1 - percent < 0 ? 0 : (1 - percent);
    return SizedBox(
      height: maxExtent,
      child: Stack(
        children: [
          Container(
            height: minExtent + ((backgroundHeight - minExtent) * calculator),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [ColorsConsts.starterColor, ColorsConsts.endColor],
                    begin: const FractionalOffset(0.0, 1.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp)),
          ),
          Positioned(
              top: 30.0,
              right: 10.0,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Consumer<FavoriteProvider>(
                    builder: (_, wishlist, child) => Badge(
                          badgeColor: ColorsConsts.favBadgeColor,
                          position: BadgePosition(top: 5, end: 7),
                          badgeContent: Text(
                            wishlist.favoriteItem.length.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.favorite,
                                color: ColorsConsts.favColor),
                            onPressed: () =>
                                Navigator.of(context).pushNamed("/wishlist"),
                          ),
                        )),
                Consumer<CartProvider>(
                    builder: (_, cart, child) => Badge(
                        badgeColor: ColorsConsts.favBadgeColor,
                        position: BadgePosition(top: 5, end: 7),
                        badgeContent: Text(
                          cart.cartItem.length.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.shopping_cart,
                              color: ColorsConsts.cartBadgeColor),
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/cart"),
                        )))
              ])),
          Positioned(
              top: 32,
              left: 10,
              child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                  child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed("/user"),
                      child: Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg"),
                                fit: BoxFit.cover)),
                      )))),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.35,
              top: titlePaddingTop * calculator + 27,
              bottom: 0,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        leading ?? SizedBox(),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.scale(
                                alignment: Alignment.centerLeft,
                                scale: 1 + (calculator * 0.5),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: title,
                                ),
                              ),
                              if (calculator > 0.5) ...[
                                SizedBox(height: 10),
                                Opacity(
                                  opacity: calculator,
                                  child: subtitle ?? SizedBox(),
                                )
                              ]
                            ])
                      ]))),
          Positioned(
            top: minExtent + ((stackPaddingTop - minExtent) * calculator),
            child: Opacity(
              opacity: calculator,
              child: Container(
                  width: MediaQuery.of(context).size.width, child: stackChild),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => throw UnimplementedError();

  @override
  // TODO: implement minExtent
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }
}
