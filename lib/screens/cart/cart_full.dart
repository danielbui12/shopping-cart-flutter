import 'package:flutter/material.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Container(
      height: 150.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.0),
            topRight: Radius.circular(16.0)),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 140.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://bizweb.dktcdn.net/thumb/1024x1024/100/116/615/products/apple-watch-se-44-jpeg.jpg?v=1600437197453"))),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "Apple watch",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.0),
                        ),
                      ),
                      IconButton(
                        color: Theme.of(context).buttonColor,
                        hoverColor: null,
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Prices: "),
                      SizedBox(width: 5.0),
                      Text(
                        "\$1300",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Sub Total: "),
                      SizedBox(width: 5.0),
                      Text(
                        "\$1300.000",
                        style: TextStyle(
                            color: !themeChange
                                ? Theme.of(context).accentColor
                                : Colors.brown.shade900,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Text("Ship Free",
                            style: TextStyle(
                              color: !themeChange
                                  ? Theme.of(context).accentColor
                                  : Colors.brown.shade900,
                            )),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 32.0),
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            elevation: 10.0,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              margin: const EdgeInsets.all(8.0),
                              child: Text(
                                "1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text("+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
