import 'package:flutter/material.dart';
import 'package:newsapp_e184439/models/news_article.dart';
import 'package:newsapp_e184439/models/news_category.dart';
import 'package:newsapp_e184439/util/common/constants.dart';
import 'package:newsapp_e184439/util/news_service.dart';
import 'package:newsapp_e184439/util/widgets/article_tile.dart';
import 'package:newsapp_e184439/util/widgets/category_chip.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.teal,
        title: const Text(
          'The News App',
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Categories', style: textStyleTitle),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 48.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryChip(
                      category: NewsCategory(
                        'Business',
                        'business',
                        const Icon(Icons.monetization_on_rounded),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    CategoryChip(
                      category: NewsCategory(
                        'Entertainment',
                        'entertainment',
                        const Icon(Icons.music_note),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    CategoryChip(
                      category: NewsCategory(
                        'Sports',
                        'sports',
                        const Icon(Icons.sports_football),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    CategoryChip(
                      category: NewsCategory(
                        'Science',
                        'science',
                        const Icon(Icons.rocket),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    CategoryChip(
                      category: NewsCategory(
                        'Technology',
                        'technology',
                        const Icon(Icons.computer),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Heading(
                title: 'Top Headlines',
                icon: Icons.view_headline,
                action: () {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              NewsThumbnailSliderHorizontal(
                future: getHeadlines(),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Heading(
                title: 'Latest in Sports',
                icon: Icons.sports_football,
                action: () {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              NewsThumbnailSliderHorizontal(
                future: search('sports'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Heading(
                title: 'Latest in Business',
                icon: Icons.monetization_on_rounded,
                action: () {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              NewsThumbnailSliderHorizontal(
                future: search('business'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Heading(
                title: 'Latest in Tech',
                icon: Icons.laptop,
                action: () {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              NewsThumbnailSliderHorizontal(
                future: search('technology'),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsThumbnailSliderHorizontal extends StatelessWidget {
  final Future future;
  const NewsThumbnailSliderHorizontal({
    Key? key,
    required this.future,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ArticleTile(
                onTap: (NewsArticle article) {
                  print(article.title);
                },
                article: snapshot.data![index],
              );
            },
          );
        },
        future: future,
        initialData: [],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function action;
  const Heading({
    Key? key,
    required this.title,
    required this.icon,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textStyleTitle),
        IconButton(
          onPressed: action(),
          icon: Icon(icon, color: Colors.teal),
        ),
      ],
    );
  }
}
