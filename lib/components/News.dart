import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/components/NewsItem.dart';
import 'package:http/http.dart' as http;

import 'Drawer.dart';

class News extends StatefulWidget {
  String? types;

  News({this.types='domestic'});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<dynamic> curr_news = [];
  bool loading=false;

  @override
  void initState() {
    super.initState();
    fetchData(); // Call fetchData when the page is loaded
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: loading?Center(child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        )):Column(
          children: List.generate(curr_news.length, (index) {
            // Access individual article
            var article = curr_news[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: NewsItem(
                title: article['title'] ?? 'No title',
                author: article['creator'] != null ? article['creator'][0] : '',
                dateAt: article['pubDate'] != null ? article['pubDate'] : '',
                description: article['description'] ?? 'No description available',
                imageUrl: article['image_url'] ?? 'https://www.pixelstalk.net/wp-content/uploads/2016/07/Free-Amazing-Background-Images-For-Desktop-620x349.jpg',
                newsUrl: article['link'] ?? 'https://example.com',
              ), // Ensure NewsItem is correctly implemented
            );
          }),
        ),
      ),
    );
  }
  void fetchData() async {
    setState(() {
      loading= true;
    });
    var url = 'https://newsdata.io/api/1/news?apikey=pub_404830c2e5114ad94988b445a661038b7b9ee&category=${this.widget.types}&country=in';
    var uri = Uri.parse(url);
    try {
      final res = await http.get(uri,headers: {'Content-Type': 'application/json; charset=utf-8'});
      final jsonData = json.decode(utf8.decode(res.bodyBytes)); // Renamed variable to avoid conflict
      setState(() {
        curr_news = jsonData['results'];
        loading = false;
      });
    } catch (e) {
      // Handle the error here
      print('Error fetching news data: $e');
      // Optionally, you can show an error message to the user
      // You can set curr_news to an empty list or null to indicate that data fetching failed
      setState(() {
        curr_news = []; // Or set curr_news to null
        loading=false;
      });
    }
  }

}
