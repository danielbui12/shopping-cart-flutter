import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
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
      height: 145.0,
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
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      IconButton(
                        color: Theme.of(context).buttonColor,
                        icon: Icon(Icons.delete_outline),
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
                  SizedBox(height: 8.0),
                  _TextWrapper(
                      "Sub Total: ",
                      "\$1300.000",
                      !themeChange
                          ? Theme.of(context).accentColor
                          : Colors.blueGrey.shade400),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Text("Ship Free",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: !themeChange
                                  ? Theme.of(context).accentColor
                                  : Colors.blueGrey.shade400,
                            )),
                      ),
                      Row(
                        children: <Widget>[
                          _AcitonButton("-", 32.0, Colors.red),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              ColorsConsts.gradiendLStart,
                              ColorsConsts.gradiendLEnd
                            ])),
                            width: MediaQuery.of(context).size.width * 0.12,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "1",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          _AcitonButton("+", 24.0, Colors.green)
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

  Widget _TextWrapper(String text1, String text2, color) {
    return Row(
      children: <Widget>[
        Text(text1),
        SizedBox(width: 5.0),
        Text(
          text2,
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: color),
        )
      ],
    );
  }

  Widget _AcitonButton(String text, double fontSize, Color color) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
            color: color, fontWeight: FontWeight.bold, fontSize: fontSize),
      ),
    );
  }
}
