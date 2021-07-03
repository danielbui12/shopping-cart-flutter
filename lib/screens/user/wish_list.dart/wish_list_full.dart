import 'package:flutter/material.dart';

class WishListFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://bizweb.dktcdn.net/thumb/1024x1024/100/116/615/products/apple-watch-se-44-jpeg.jpg?v=1600437197453"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("TITLE",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.0)),
                      SizedBox(height: 10.0),
                      Text("PRICE",
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
              onTap: () {},
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
