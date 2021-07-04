import 'package:flutter/material.dart';
import 'package:myapp/provider/products.dart';
import 'package:provider/provider.dart';

import 'product.dart';

class BrandProducts extends StatefulWidget {
  @override
  _BrandProductsState createState() => _BrandProductsState();
}

class _BrandProductsState extends State<BrandProducts> {
  int _selectedIndex = 0;
  late String _brand;
  late String routeArgs;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    routeArgs = ModalRoute.of(context)!.settings.arguments.toString();
    print(routeArgs.toString());
    _selectedIndex = int.parse(routeArgs.substring(1, 2));
    _setBrand(_selectedIndex);
  }

  void _setBrand(int index) {
    String _currentBrand = "";
    switch (_selectedIndex) {
      case 0:
        _currentBrand = "Adidas";
        break;
      case 1:
        _currentBrand = "Apple";
        break;
      case 2:
        _currentBrand = "Dell";
        break;
      case 3:
        _currentBrand = "H&M";
        break;
      case 4:
        _currentBrand = "Huawei";
        break;
      case 5:
        _currentBrand = "Nike";
        break;
      case 6:
        _currentBrand = "SamSung";
        break;
      default:
        _currentBrand = "All";
        break;
    }
    return setState(() {
      _brand = _currentBrand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LayoutBuilder(
              builder: (context, constraint) => SingleChildScrollView(
                    child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: NavigationRail(
                            minWidth: 56.0,
                            groupAlignment: 1,
                            selectedIndex: _selectedIndex,
                            onDestinationSelected: (int index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                              _setBrand(_selectedIndex);
                            },
                            labelType: NavigationRailLabelType.all,
                            leading: Column(
                              children: [
                                SizedBox(height: 20.0),
                                Center(
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back_ios_new),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    iconSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                Center(
                                  child: CircleAvatar(
                                    radius: 16.0,
                                    backgroundImage: NetworkImage(
                                        "https://st4.depositphotos.com/4329009/19956/v/380/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg"),
                                  ),
                                ),
                                SizedBox(height: 80.0),
                              ],
                            ),
                            selectedLabelTextStyle: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              letterSpacing: 1.0,
                            ),
                            unselectedLabelTextStyle: TextStyle(
                              fontSize: 16.0,
                              letterSpacing: 0.8,
                            ),
                            destinations: [
                              buildNavigationRailDes("Adidas"),
                              buildNavigationRailDes("Apple"),
                              buildNavigationRailDes("Dell"),
                              buildNavigationRailDes("H&M"),
                              buildNavigationRailDes("Huawei"),
                              buildNavigationRailDes("Nike"),
                              buildNavigationRailDes("SamSung"),
                              buildNavigationRailDes("All"),
                            ],
                          ),
                        )),
                  )),
          ContentProduct(_brand, context)
        ],
      ),
    );
  }
}

NavigationRailDestination buildNavigationRailDes(String brandName) {
  return NavigationRailDestination(
      icon: SizedBox.shrink(),
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RotatedBox(quarterTurns: -3, child: Text(brandName)),
      ));
}

class ContentProduct extends StatelessWidget {
  final String brand;
  ContentProduct(this.brand, BuildContext context);

  @override
  Widget build(BuildContext context) {
    final _brandProductList =
        Provider.of<ProductsProvider>(context).findCategoryByBrand(brand);
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 8.0, 0, 0),
            child: MediaQuery.removePadding(
                context: context,
                removeRight: true,
                child: ListView.builder(
                    itemCount: _brandProductList.length,
                    itemBuilder: (BuildContext context, int i) =>
                        ChangeNotifierProvider.value(
                            value: _brandProductList[i],
                            child: ListProduct())))));
  }
}
