import 'package:flutter/material.dart';

class FeedProducts extends StatefulWidget {
  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed("/productdetail"),
      child: Container(
        width: 200.0,
        height: 305.0,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                      minHeight: 100,
                      maxHeight: MediaQuery.of(context).size.height * 0.3),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://cdn.tgdd.vn/Products/Images/7077/229044/apple-watch-s6-40mm-vien-nhom-day-cao-su-01-600x600.jpg"),
                            fit: BoxFit.fill)),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    width: 50,
                    height: 25,
                    child: Center(
                      child: Text(
                        "NEW",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 6.0),
              margin: const EdgeInsets.only(left: 6.0, right: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8.0),
                  Text(
                    "Apple Watch",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text("\$ 177.79",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 19.0, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Quantity: 12 left",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                            )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
