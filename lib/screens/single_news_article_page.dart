import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp_e184439/models/news_article.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleNewsArticlePage extends StatelessWidget {
  final NewsArticle article;
  const SingleNewsArticlePage({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: article.title!,
                child: Image.network(article.urlToImage!),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                article.title!,
                style: const TextStyle(fontSize: 24.0, color: Colors.teal),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'Published At: ${DateFormat.yMd().format(
                  DateTime.parse(article.publishedAt!),
                )}',
                style: const TextStyle(fontSize: 16.0, color: Colors.black54),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                article.description!,
                style: const TextStyle(fontSize: 16.0, color: Colors.black54),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 48.0,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  onPressed: () {
                    launchUrl(
                      Uri.parse(article.url!),
                    );
                  },
                  icon: const Icon(Icons.web),
                  label: const Text('Read more'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
