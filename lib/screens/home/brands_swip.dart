import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class BrandsSwip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 250.0,
      child: Swiper(
        index: 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                brandsImg[index],
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        autoplay: true,
        itemCount: brandsImg.length,
        scrollDirection: Axis.horizontal,
        onTap: (index) => Navigator.of(context).pushNamed("/brandItem", arguments: {index}),
      ),
    );
  }
}

List<String> brandsImg = [
  "assets/images/addidas.jpg",
  "assets/images/apple.jpg",
  "assets/images/Dell.jpg",
  "assets/images/h&m.jpg",
  "assets/images/Huawei.jpg",
  "assets/images/nike.jpg",
  "assets/images/samsung.jpg"
];
