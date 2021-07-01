import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
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
                          image: NetworkImage(
                              "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg"),
                          fit: BoxFit.fill))),
              Positioned(
                  top: 5.0,
                  right: 5.0,
                  child: Icon(
                    Icons.star_outlined,
                    color: Colors.yellow,
                  )),
              Positioned(
                  right: 5,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Theme.of(context).backgroundColor,
                    child: Text("PRICE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        )),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("TITLE", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  "Discriber",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(Icons.add_shopping_cart_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}
