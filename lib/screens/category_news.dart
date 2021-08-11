import 'package:flutter/material.dart';
import 'package:flutter_news/components/blog_tile.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/article_model.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({required this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  getNews() async {
    CategoryNewsClass news = CategoryNewsClass();
    await news.getNews(widget.category);
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(
                color: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(
              width: 55.0,
            ),
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
                        itemCount: articles.length,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final ArticleModel article = articles[index];
                          return BlogTile(
                            imageUrl: article.urlToImage,
                            title: article.title,
                            desc: article.description,
                            url: article.url,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
