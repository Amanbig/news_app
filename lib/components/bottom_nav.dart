import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onSelect;

  const BottomNav({Key? key, required this.currentIndex, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue, // Color for the selected item
      unselectedItemColor: Colors.grey, // Color for the unselected items
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home), // Filled icon when selected
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.search), // Filled icon when selected
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          activeIcon: Icon(Icons.favorite), // Filled icon when selected
          label: 'Favourites',
        ),
      ],
      onTap: onSelect, // Use the provided callback to notify the parent
    );
  }
}
