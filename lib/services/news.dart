import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:newsapp_e184439/models/article.dart';

import '../common/constants.dart';
import '../common/routes.dart';

Future<List<Article>> getHeadlines() async {
  var headers = {
    "Authorization": newsApiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    routeHeadlines,
    {'language': 'en'},
  );

  var response = await http.get(url, headers: headers);

  List<Article> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    (decoded['articles'] as List).forEach((articleJson) {
      articles.add(Article.fromJson(articleJson));
    });
  }

  return articles;
}

Future<List<Article>> search(String searchText) async {
  var headers = {
    "Authorization": newsApiKey,
  };
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);

  var url = Uri.https(
    newsApiUrl,
    routeEverything,
    {
      'language': 'en',
      'q': searchText,
      'sortBy': 'popularity',
      'from': formattedDate
    },
  );

  var response = await http.get(url, headers: headers);
  print(response.statusCode);
  print(response.body);
  List<Article> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    (decoded['articles'] as List).forEach((articleJson) {
      articles.add(Article.fromJson(articleJson));
    });
  }

  return articles;
}

Future<List<Article>> byCategory(String category) async {
  var headers = {
    "Authorization": newsApiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    routeEverything,
    {'language': 'en', 'category': category, 'sortBy': 'popularity'},
  );

  var response = await http.get(url, headers: headers);

  List<Article> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    (decoded['articles'] as List).forEach((articleJson) {
      articles.add(Article.fromJson(articleJson));
    });
  }

  return articles;
}

Future<List<Article>> byCountry(String countryCode) async {
  var headers = {
    "Authorization": newsApiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    routeEverything,
    {'language': 'en', 'country': countryCode, 'sortBy': 'popularity'},
  );

  var response = await http.get(url, headers: headers);

  List<Article> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    (decoded['articles'] as List).forEach((articleJson) {
      articles.add(Article.fromJson(articleJson));
    });
  }

  return articles;
}

Future<List<Article>> latest() async {
  var headers = {
    "Authorization": newsApiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    routeEverything,
    {'language': 'en', 'sortBy': 'popularity'},
  );

  var response = await http.get(url, headers: headers);

  List<Article> articles = [];
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);

    (jsonData['articles'] as List).forEach((articleJson) {
      articles.add(Article.fromJson(articleJson));
    });
  }

  return articles;
}
