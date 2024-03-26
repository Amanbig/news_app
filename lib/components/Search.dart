import 'package:flutter/material.dart';
import 'package:news_app/components/NewsItem.dart'; // Make sure this path is correct
import 'package:news_app/components/bottom_nav.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/components/loading.dart'; // Make sure this path is correct

class Search extends StatefulWidget {
  final String? types;

  Search({this.types});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<dynamic> curr_news = [];
  final TextEditingController text = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: text,
                        onSubmitted: (value) {
                          fetchData(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              loading?Center(child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              )): Column(
                children: List.generate(curr_news.length, (index) {
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
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      // Ensure BottomNav is properly implemented
    );
  }

  void fetchData(String value) async {
    setState(() {
      loading = true;
    });
    var url =
        'https://newsdata.io/api/1/news?apikey=pub_404830c2e5114ad94988b445a661038b7b9ee&q=$value&country=in';
    var uri = Uri.parse(url);
    try {
      final res = await http.get(uri,headers: {'Content-Type': 'application/json; charset=utf-8'});
      final jsonData = json.decode(utf8.decode(res.bodyBytes)); // Renamed variable to avoid conflict
      setState(() {
        curr_news = jsonData['results'];
        loading = false;
      });
    } catch (e) {
      print('Error fetching news data: $e');
      setState(() {
        curr_news = [];
        loading = false;
      });
    }
  }
}
