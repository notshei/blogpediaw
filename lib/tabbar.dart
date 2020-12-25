import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabbarState();
  }
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlogPedia'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
        ],
      ),
    );
  }
}
