import 'package:flutter/material.dart';
import 'package:newsapp_e184439/models/news_article.dart';
import 'package:newsapp_e184439/screens/single_news_article_page.dart';
import 'package:newsapp_e184439/util/common/constants.dart';

class ArticleCard extends StatelessWidget {
  final Function onTap;
  final NewsArticle article;
  const ArticleCard({
    Key? key,
    required this.onTap,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider image = const AssetImage('images/newsreader.png');
    if (article.urlToImage == null) {
      image = const AssetImage('images/newsreader.png');
    } else {
      try {
        image = NetworkImage(article.urlToImage!);
      } catch (e) {
        image = const AssetImage('images/newsreader.png');
      }
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SingleNewsArticlePage(article: article),
          ),
        );
      },
      child: Hero(
        tag: article.title!,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          height: 200.0,
          decoration: BoxDecoration(
            border: Border.all(color: colorsPrimary),
            color: Colors.black,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: image,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0.0,
                width: 378.0,
                height: 80.0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    article.title!,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
