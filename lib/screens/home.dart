import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/screens/home/app_swip.dart';
import 'package:myapp/screens/home/brands_swip.dart';
import 'package:myapp/screens/home/category.dart';

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
        backLayer: Center(
          child: Text("Home"),
        ),
        frontLayer: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSwip(),
              SizedBox(height: 25.0),
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
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Popular brands",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("View all...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textSelectionColor)),
                    ),
                  )
                ],
              ),
              BrandsSwip(),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
