import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final String price;
  final String imgUrl;
  final String productCategoryName;
  final String brand;
  final int quantity;
  final bool isFavorite;
  final bool isPopular;

  Product(
      this.id,
      this.title,
      this.description,
      this.price,
      this.imgUrl,
      this.productCategoryName,
      this.brand,
      this.quantity,
      this.isFavorite,
      this.isPopular);
}
