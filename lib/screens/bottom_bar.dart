import 'package:flutter/material.dart';
import 'package:myapp/screens/cart.dart';
import 'package:myapp/screens/feeds.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/search.dart';
import 'package:myapp/screens/user.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedPageIndex = 4;
  List<Map<String, Widget>> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      {"page": Home()},
      {"page": Feed()},
      {"page": Search()},
      {"page": Cart()},
      {"page": UserInfo()}
    ];
  }

  _selecPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: "Feed"),
          BottomNavigationBarItem(
              activeIcon: null, icon: Icon(null), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User")
        ],
        backgroundColor: Colors.white54,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _selecPage,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10.0,
          backgroundColor: Colors.amber[700],
          hoverColor: Colors.amber,
          splashColor: Colors.black87,
          tooltip: 'Search',
          elevation: 10.0,
          child: Icon(Icons.search),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
