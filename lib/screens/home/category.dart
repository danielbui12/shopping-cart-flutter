import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final _index;
  Category(this._index);

  List categories = [
    {
      "categoryName": "Phones",
      "categoryImgPath": "assets/images/CatPhones.png"
    },
    {
      "categoryName": "Clothes",
      "categoryImgPath": "assets/images/CatClothes.jpg"
    },
    {
      "categoryName": "Furniture",
      "categoryImgPath": "assets/images/CatFurniture.jpg"
    },
    {
      "categoryName": "Beauty",
      "categoryImgPath": "assets/images/CatBeauty.jpg"
    },
    {
      "categoryName": "Laptops",
      "categoryImgPath": "assets/images/CatLaptops.png"
    },
    {"categoryName": "Shoes", "categoryImgPath": "assets/images/CatShoes.jpg"},
    {
      "categoryName": "Watch",
      "categoryImgPath": "assets/images/CatWatches.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: [
            Container(
              width: 150.0,
              height: 150.0,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage(categories[_index]["categoryImgPath"]))),
            ),
            Positioned(
                bottom: 0,
                left: 10,
                right: 10,
                child: Container(
                  color: Theme.of(context).backgroundColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    categories[_index]["categoryName"],
                    style: TextStyle(
                        color: Theme.of(context).textSelectionColor,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
