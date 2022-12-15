import 'package:flutter/material.dart';
import 'package:newsapp_e184439/pages/home_page.dart';

import 'common/styles.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: colorsPrimary),
      ),
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: HomePage(),
      routes: {},
    );
  }
}
