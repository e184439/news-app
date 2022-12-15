import 'package:flutter/material.dart';
import 'package:newsapp_e184439/common/styles.dart';
import 'package:newsapp_e184439/models/article.dart';

class ArticleThumbnail extends StatelessWidget {
  final Function onTap;
  final Article article;
  const ArticleThumbnail({
    Key? key,
    required this.onTap,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider image;
    if (article.urlToImage == null) {
      image = AssetImage('images/newsreader.png');
    } else {
      image = NetworkImage(article.urlToImage!);
    }

    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 16.0),
        height: 200.0,
        width: 260.0,
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
              width: 260.0,
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
    );
  }
}
