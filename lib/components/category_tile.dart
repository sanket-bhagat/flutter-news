import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_news/screens/category_news.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  CategoryTile({
    required this.categoryName,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              category: categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: 120.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120.0,
              height: 60.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
