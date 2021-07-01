import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 5.0),
          padding: const EdgeInsets.only(top: 18.0, bottom: 5.0, right: 20.0),
          constraints: BoxConstraints(
              minHeight: 150.0, minWidth: double.infinity, maxHeight: 180.0),
          child: Row(
            children: [
              Container(
                width: 160,
                height: 200,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0)
                          ],
                          color: Theme.of(context).backgroundColor,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://bizweb.dktcdn.net/thumb/1024x1024/100/116/615/products/apple-watch-se-44-jpeg.jpg?v=1600437197453"))))),
              FittedBox(
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0)
                  ], borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: 140.0,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PRICE",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "NAME",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0)
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
