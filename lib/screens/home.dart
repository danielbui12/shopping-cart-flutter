import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/screens/home/app_swip.dart';
import 'package:myapp/screens/home/backlayer.dart';
import 'package:myapp/screens/home/brands_swip.dart';
import 'package:myapp/screens/home/category.dart';
import 'package:myapp/screens/home/popular_product.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropScaffold(
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
        backLayer: BackLayer(),
        frontLayer: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSwip(),
              SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 19.0, horizontal: 16.0),
                child: Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Container(
                height: 205.0,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int i) => Category(i)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 19.0, bottom: 19),
                    child: Text(
                      "Popular brands",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/brandItem", arguments: {7}),
                      child: Text("View all...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textSelectionColor)),
                    ),
                  )
                ],
              ),
              // _horizontalTitle("Popular brands", () {}),
              BrandsSwip(),
              SizedBox(height: 36.0),
              _horizontalTitle("Popular products", () {}),
              Container(
                height: 258.0,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PopularProducts())),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _horizontalTitle(String title, onPress) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 19.0, bottom: 19),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: onPress,
            child: Text("View all...",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textSelectionColor)),
          ),
        )
      ],
    );
  }
}
