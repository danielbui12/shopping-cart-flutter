import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:myapp/const/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_card_swipper/widgets/flutter_page_indicator/flutter_page_indicator.dart';

import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropScaffold(
        headerHeight: MediaQuery.of(context).size.height * 0.25,
        appBar: BackdropAppBar(
          title: Text("Home"),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              ColorsConsts.starterColor,
              ColorsConsts.endColor
            ])),
          ),
          actions: <Widget>[
            Container(
              padding: const EdgeInsets.all(13.0),
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 13.0,
                  backgroundImage: NetworkImage(
                      "https://st4.depositphotos.com/4329009/19956/v/380/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg"),
                ),
              ),
            )
          ],
        ),
        backLayer: Center(
          child: Text("Home"),
        ),
        frontLayer: Swiper(
          index: 0,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  height: 190.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      images[index],
                    ),
                    fit: BoxFit.fill,
                  )),
                ),
              ],
            );
          },
          autoplay: true,
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

List<String> images = [
  "assets/images/carousel1.png",
  "assets/images/carousel2.jpeg",
  "assets/images/carousel3.jpg",
  "assets/images/carousel4.png"
];
