import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class AppSwip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.0,
      child: Swiper(
        index: 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                images[index],
              ),
              fit: BoxFit.fill,
            )),
          );
        },
        autoplay: true,
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
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
