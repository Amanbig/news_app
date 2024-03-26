import 'package:flutter/material.dart';

import 'News.dart';
import 'Search.dart';
import 'bottom_nav.dart';
import 'favourites.dart';

class MainScreen extends StatefulWidget {
  String? cate;
  MainScreen({this.cate});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late final List<Widget> _screens; // Declare _screens here, but initialize it in initState.

  @override
  void initState() {
    super.initState();
    // Initialize _screens inside initState, where it's safe to access `this.widget`.
    _screens = [
      News(types: widget.cate), // Now it's safe to access `widget.cate`.
      Search(),
      FavoritesPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onSelect: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
