import 'package:flutter/material.dart';
import 'package:flutter_news/screens/article_view.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(url: url),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(imageUrl),
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              desc,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
