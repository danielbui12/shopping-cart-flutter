import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'dart:ui';

import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    var color = !themeChange.darkTheme ? Colors.black : Colors.white;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            margin: const EdgeInsets.only(top: 60.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/emptycart.png")),
            ),
          ),
          Text("Your Cart Is Empty ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 36.0, color: color, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Looks like you didn't\n add anything to your cart yet!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w500,
                color: themeChange.darkTheme
                    ? Theme.of(context).disabledColor
                    : ColorsConsts.subTitle),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.06,
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.redAccent,
              child: Text(
                "SHOP NOW",
                style: TextStyle(
                    fontSize: 34.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
