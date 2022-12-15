import 'package:flutter/material.dart';
import 'package:newsapp_e184439/screens/home_page.dart';
import 'package:newsapp_e184439/util/common/constants.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: colorsPrimary),
      ),
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: const HomePage(),
    );
  }
}
