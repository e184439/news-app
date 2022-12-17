import 'package:flutter/material.dart';
import 'package:newsapp_e184439/models/news_article.dart';
import 'package:newsapp_e184439/models/news_category.dart';
import 'package:newsapp_e184439/util/news_service.dart';
import 'package:newsapp_e184439/util/widgets/article_card.dart';

class CategoryNewsPage extends StatefulWidget {
  final NewsCategory category;
  const CategoryNewsPage({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryNewsPage> createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            widget.category.icon,
            const SizedBox(
              width: 8.0,
            ),
            Text('${widget.category.title} News'),
          ],
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Expanded(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ArticleCard(
                onTap: (NewsArticle article) {
                  print(article.title);
                },
                article: snapshot.data![index],
              );
            },
          );
        },
        future: byCategory(widget.category.value),
        initialData: [],
      ),
    );
  }
}
