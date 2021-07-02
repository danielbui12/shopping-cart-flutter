import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';

class BackLayer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [ColorsConsts.starterColor, ColorsConsts.endColor],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.1),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
        ),
        _box(150.0, 250.0, -100.0, 140.0),
        _box(150.0, 200.0, -50.0, 60),
        _box(150.0, 100.0, 300.0, 80),
        _box(150.0, 100.0, 300.0, 170),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://st4.depositphotos.com/4329009/19956/v/380/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg"),
                          fit: BoxFit.fill)),
                ),
                SizedBox(height: 20.0),
                content(context, () => navigationTo(context, "/feed"), "Feeds", 0),
                content(
                    context, () => navigationTo(context, "/feed"), "Wishlist", 1),
                content(context, () => navigationTo(context, "/cart"), "Cart", 2),
                content(context, () => navigationTo(context, "/feed"),
                    "Upload new product(s)", 3)
              ],
            ),
          ),
        )
      ],
    );
  }

  void navigationTo(BuildContext context, String routename) {
    Navigator.of(context).pushNamed(routename);
  }

  List icon = [
    Icons.rss_feed_rounded,
    Icons.favorite,
    Icons.shopping_cart_rounded,
    Icons.upload_rounded
  ];

  Widget content(BuildContext context, fnt, String text, int i) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(text),
          ),
          Icon(icon[i])
        ],
      ),
      onTap: fnt,
    );
  }

  Widget _box(double width, double height, double top, double left) {
    return Positioned(
        top: top,
        left: left,
        child: Transform.rotate(
            angle: -0.5,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            )));
  }
}
