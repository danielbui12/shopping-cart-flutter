import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final _index;
  Category(this._index);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
      "categoryName": "Beauty & Health",
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
    return Stack(
      children: [
        InkWell(
          onTap: () =>  Navigator.of(context).pushNamed("/categoryfeed", arguments: "${categories[widget._index]["categoryName"]}"),
          child: Container(
            width: 150.0,
            height: 150.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        AssetImage(categories[widget._index]["categoryImgPath"]))),
          ),
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
                categories[widget._index]["categoryName"],
                style: TextStyle(
                    color: Theme.of(context).textSelectionColor,
                    fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}
