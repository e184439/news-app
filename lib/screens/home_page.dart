import 'package:flutter/material.dart';
import 'package:newsapp_e184439/models/article.dart';
import 'package:newsapp_e184439/util/common/constants.dart';
import 'package:newsapp_e184439/util/news_service.dart';
import 'package:newsapp_e184439/util/widgets/article_tile.dart';

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
        title: const Text('The News App',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              var headlines = await getHeadlines();
              print(headlines);
            },
            icon: const Icon(Icons.sort, color: Colors.teal),
            tooltip: 'Sort',
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
                        return ArticleTile(
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
                        return ArticleTile(
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
                        return ArticleTile(
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
                        return ArticleTile(
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
