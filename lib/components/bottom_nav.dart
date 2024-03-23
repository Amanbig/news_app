import 'package:flutter/material.dart';
import 'package:news_app/components/News.dart';
import 'package:news_app/components/Search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favourites',
        ),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });

        switch (index) {
          case 0:
          // Navigate to the home screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => News(types: "general",)),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Search()),
            );
            break;
          case 2:
          // Navigate to the favorites screen (you need to create this)
            break;
        }
      },
    );
  }
}
