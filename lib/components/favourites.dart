import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Box<Map<dynamic, dynamic>> _favoritesBox;
  bool _isBoxOpened = false;

  @override
  void initState() {
    super.initState();
    _openFavoritesBox();
  }

  void _openFavoritesBox() async {
    _favoritesBox = await Hive.openBox<Map<dynamic, dynamic>>('favorites');
    setState(() {
      _isBoxOpened = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: _isBoxOpened ? _buildFavoritesList() : _buildLoadingIndicator(),
    );
  }

  Widget _buildFavoritesList() {
    if (_favoritesBox.isEmpty) {
      return Center(
        child: Text('No favorites yet'),
      );
    }

    return ListView.builder(
      itemCount: _favoritesBox.length,
      itemBuilder: (context, index) {
        final newsItem = _favoritesBox.getAt(index)!;

        return ListTile(
          title: Text(newsItem['title'] ?? 'No title'),
          subtitle: Text(newsItem['description'] ?? 'No description'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _favoritesBox.deleteAt(index);
              setState(() {});
            },
          ),
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
