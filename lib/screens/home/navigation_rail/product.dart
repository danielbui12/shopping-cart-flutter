import 'package:flutter/material.dart';
import 'package:myapp/models/product_model.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productAttribute = Provider.of<Product>(context);
    return InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed("/productdetail", arguments: productAttribute.id),
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 5.0),
          padding: const EdgeInsets.only(top: 18.0, bottom: 5.0, right: 20.0),
          constraints: BoxConstraints(
              minHeight: 150.0, minWidth: double.infinity, maxHeight: 180.0),
          child: Row(
            children: [
              Container(
                  width: 160,
                  height: 200,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0)
                          ],
                          color: Theme.of(context).backgroundColor,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(productAttribute.imgUrl))))),
              FittedBox(
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: 140.0,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ ${productAttribute.price}",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 16.0),
                      Text(productAttribute.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0)),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
