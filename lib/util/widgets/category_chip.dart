import 'package:flutter/material.dart';
import 'package:newsapp_e184439/models/news_category.dart';
import 'package:newsapp_e184439/screens/category_news_page.dart';

class CategoryChip extends StatelessWidget {
  final NewsCategory category;

  const CategoryChip({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CategoryNewsPage(category: category);
              },
            ),
          );
        },
        label: Text(category.title),
        icon: category.icon);
  }
}
