import 'package:flutter/material.dart';
import 'package:newsapp_e184439/models/article.dart';
import 'package:newsapp_e184439/services/news.dart';

import '../common/styles.dart';
import '../widgets/article_thumbnail.dart';

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
        title: const Text('The News App'),
        actions: [
          IconButton(
            onPressed: () async {
              var headlines = await getHeadlines();
              print(headlines);
            },
            icon: const Icon(Icons.language),
            tooltip: 'Change Language',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Search', style: textStyleTitle),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                ],
              ),
              const Divider(
                height: 16.0,
              ),
              const Text('Categories', style: textStyleTitle),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 32.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    OutlinedButton(
                        onPressed: () {}, child: const Text('Business')),
                    const SizedBox(
                      width: 8.0,
                    ),
                    OutlinedButton(
                        onPressed: () {}, child: const Text('Entertainment')),
                    const SizedBox(
                      width: 8.0,
                    ),
                    OutlinedButton(
                        onPressed: () {}, child: const Text('General')),
                    const SizedBox(
                      width: 8.0,
                    ),
                    OutlinedButton(
                        onPressed: () {}, child: const Text('Health')),
                    const SizedBox(
                      width: 8.0,
                    ),
                    OutlinedButton(
                        onPressed: () {}, child: const Text('Science')),
                    const SizedBox(
                      width: 8.0,
                    ),
                    OutlinedButton(
                        onPressed: () {}, child: const Text('Sports')),
                    const SizedBox(
                      width: 8.0,
                    ),
                    OutlinedButton(
                        onPressed: () {}, child: const Text('Technology')),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Divider(
                height: 16.0,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text('Top Headlines', style: textStyleTitle),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
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
                        return ArticleThumbnail(
                          onTap: (Article article) {
                            print(article.title);
                          },
                          article: snapshot.data![index],
                        );
                      },
                    );
                  },
                  future: getHeadlines(),
                  initialData: [],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Divider(
                height: 16.0,
              ),
              const Text('Latest in Sports', style: textStyleTitle),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 300,
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
                        return ArticleThumbnail(
                          onTap: (Article article) {
                            print(article.title);
                          },
                          article: snapshot.data![index],
                        );
                      },
                    );
                  },
                  future: search('sports'),
                  initialData: [],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text('Latest in Business', style: textStyleTitle),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 300,
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
                        return ArticleThumbnail(
                          onTap: (Article article) {
                            print(article.title);
                          },
                          article: snapshot.data![index],
                        );
                      },
                    );
                  },
                  future: search('business'),
                  initialData: [],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text('Latest in Tech News', style: textStyleTitle),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 300,
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
                        return ArticleThumbnail(
                          onTap: (Article article) {
                            print(article.title);
                          },
                          article: snapshot.data![index],
                        );
                      },
                    );
                  },
                  future: search('technology'),
                  initialData: [],
                ),
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
