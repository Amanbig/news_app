import 'package:flutter/material.dart';

import 'News.dart';

class SideNav extends StatelessWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(
                'News App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            title: Text('Business'),
            onTap: () {
              // Navigate to Business
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "business",)),
              );
            },
          ),
          ListTile(
            title: Text('Entertainment'),
            onTap: () {
              // Navigate to Entertainment
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "entertainment",)),
              );
            },
          ),
          ListTile(
            title: Text('Environment'),
            onTap: () {
              // Navigate to General
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "environment",)),
              );
            },
          ),
          ListTile(
            title: Text('Food'),
            onTap: () {
              // Navigate to Science
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "food",)),
              );
            },
          ),
          ListTile(
            title: Text('Lifestyle'),
            onTap: () {
              // Navigate to Science
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "lifestyle",)),
              );
            },
          ),
          ListTile(
            title: Text('Politics'),
            onTap: () {
              // Navigate to Science
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "politics",)),
              );
            },
          ),
          ListTile(
            title: Text('Health'),
            onTap: () {
              // Navigate to Health
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "health",)),
              );
            },
          ),
          ListTile(
            title: Text('Science'),
            onTap: () {
              // Navigate to Science
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "science",)),
              );
            },
          ),
          ListTile(
            title: Text('Crime'),
            onTap: () {
              // Navigate to Science
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "crime",)),
              );
            },
          ),
          ListTile(
            title: Text('Domestic'),
            onTap: () {
              // Navigate to Science
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "domestic",)),
              );
            },
          ),
          ListTile(
            title: Text('Education'),
            onTap: () {
              // Navigate to Science
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "education",)),
              );
            },
          ),
          ListTile(
            title: Text('Sports'),
            onTap: () {
              // Navigate to Sports
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "sports",)),
              );
            },
          ),
          ListTile(
            title: Text('Technology'),
            onTap: () {
              // Navigate to Technology
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => News(types: "technology",)),
              );
            },
          ),
        ],
      ),
    );
  }
}
