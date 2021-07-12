import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1138257321%2F0x0.jpg%3Ffit%3Dscale",
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Column(
              children: [
                Text("Welome",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Welcome to Shopping App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  SizedBox(width: 10.0),
                  Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))))),
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/login"),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Sign in",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17.0)),
                              SizedBox(width: 5.0),
                              Icon(Icons.person_outline, size: 18.0)
                            ],
                          ))),
                  SizedBox(width: 20.0),
                  Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.pink.shade400),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))))),
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/register"),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Sign up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17.0)),
                              SizedBox(width: 5.0),
                              Icon(Icons.person_add_outlined, size: 18.0)
                            ],
                          ))),
                  SizedBox(width: 10.0),
                ],
              ),
              SizedBox(height: 30.0),
            ],
          )
        ],
      ),
    );
  }
}
