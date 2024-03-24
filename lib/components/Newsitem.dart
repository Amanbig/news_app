import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsItem extends StatefulWidget {
  String? title;
  String? author;
  String? dateAt;
  String? description;
  String imageUrl='https://www.pixelstalk.net/wp-content/uploads/2016/07/Free-Amazing-Background-Images-For-Desktop-620x349.jpg';
  String? newsUrl;
  NewsItem(
      {this.title,
      this.author,
      this.dateAt,
      this.description,
      this.imageUrl='https://www.pixelstalk.net/wp-content/uploads/2016/07/Free-Amazing-Background-Images-For-Desktop-620x349.jpg',
      this.newsUrl});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  var icon_va = Icons.favorite_outline;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity, // Adjust width as needed
              child: Image.network(widget.imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.title}',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.description == null ? " " : widget.description}',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${widget.dateAt}'),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if(icon_va == Icons.favorite_outline)
                        icon_va = Icons.favorite;
                    else
                      icon_va = Icons.favorite_outline;
                  });
                },
                icon: Icon(
                  icon_va,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
