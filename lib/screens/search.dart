import 'package:flutter/material.dart';
import 'package:myapp/const/Colors.dart';
import 'package:myapp/models/product_model.dart';
import 'package:myapp/provider/products.dart';
import 'package:myapp/screens/Feed/feed_product.dart';
import 'package:myapp/screens/search/search.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchTextController = TextEditingController();
  final FocusNode _node = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchTextController = TextEditingController();
    _searchTextController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _node.dispose();
    _searchTextController.dispose();
  }

  List<Product> _searchList = [];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    final productData = productProvider.products;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: SearchByHeader(
                stackPaddingTop: 175,
                titlePaddingTop: 50,
                title: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Search",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24))
                  ]),
                ),
                stackChild: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 3)
                      ]),
                  child: TextField(
                    controller: _searchTextController,
                    minLines: 1,
                    focusNode: _node,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none)),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _searchTextController.clear();
                            _node.unfocus();
                          },
                          icon: Icon(Icons.close_outlined,
                              color: _searchTextController.text.isEmpty
                                  ? Colors.grey
                                  : Colors.red),
                        )),
                    onChanged: (value) {
                      _searchTextController.text.toLowerCase();
                      setState(() {
                        _searchList = productProvider.searchQuery(value);
                      });
                    },
                  ),
                ))),
        SliverToBoxAdapter(
          child: _searchTextController.text.isNotEmpty && _searchList.isEmpty
              ? Center(
                  child: Text("No product found",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))
              : GridView.count(
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 240 / 420,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: List.generate(
                      _searchTextController.text.isEmpty
                          ? productData.length
                          : _searchList.length,
                      (index) => ChangeNotifierProvider.value(
                            value: _searchTextController.text.isEmpty
                                ? productData[index]
                                : _searchList[index],
                            child: FeedProducts(),
                          )),
                ),
        )
      ],
    ));
  }
}
