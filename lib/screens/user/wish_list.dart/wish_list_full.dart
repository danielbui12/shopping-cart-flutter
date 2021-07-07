import 'package:flutter/material.dart';
import 'package:myapp/const/alert.dart';
import 'package:myapp/models/favorite_attribute.dart';
import 'package:myapp/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class WishListFull extends StatefulWidget {
  final String productId;
  WishListFull(this.productId);

  @override
  _WishListFullState createState() => _WishListFullState();
}

class _WishListFullState extends State<WishListFull> {
  @override
  Widget build(BuildContext context) {
    final wishlistAttribute = Provider.of<FavoriteAttribute>(context);
    final wishlist = Provider.of<FavoriteProvider>(context);
    Alert alert = Alert();
    return Stack(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 30.0, top: 20.0, left: 10.0),
          child: Material(
            color: Theme.of(context).backgroundColor,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(wishlistAttribute.imgUrl),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(wishlistAttribute.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 13.0)),
                      ),
                      SizedBox(height: 10.0),
                      Text(wishlistAttribute.price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20.0,
          right: 30.0,
          child: Material(
            color: Colors.red,
            child: InkWell(
              onTap: () {
                alert.alert(
                    "Remove item!",
                    "Product will be removed from wishlist",
                    () => wishlist.removeItem(widget.productId),
                    context);
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
