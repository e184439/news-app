import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:newsapp_e184439/models/news_article.dart';
import 'package:newsapp_e184439/util/common/constants.dart';

Future<List<NewsArticle>> getHeadlines() async {
  var headers = {
    "Authorization": newsApiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    routeHeadlines,
    {'language': 'en'},
  );

  var response = await http.get(url, headers: headers);

  List<NewsArticle> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    (decoded['articles'] as List).forEach((articleJson) {
      articles.add(NewsArticle.fromJson(articleJson));
    });
  }

  return articles;
}

Future<List<NewsArticle>> search(String searchText) async {
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

  List<NewsArticle> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    (decoded['articles'] as List).forEach((articleJson) {
      articles.add(NewsArticle.fromJson(articleJson));
    });
  }

  return articles;
}

Future<List<NewsArticle>> byCategory(String category) async {
  var headers = {
    "Authorization": newsApiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    routeHeadlines,
    {'language': 'en', 'category': category, 'sortBy': 'popularity'},
  );

  var response = await http.get(url, headers: headers);

  List<NewsArticle> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    (decoded['articles'] as List).forEach((articleJson) {
      articles.add(NewsArticle.fromJson(articleJson));
    });
  } else {
    print(response.statusCode);
    print(response.body);
  }

  return articles;
}

Future<List<NewsArticle>> byCountry(String countryCode) async {
  var headers = {
    "Authorization": newsApiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    routeEverything,
    {'language': 'en', 'country': countryCode, 'sortBy': 'popularity'},
  );

  var response = await http.get(url, headers: headers);

  List<NewsArticle> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    (decoded['articles'] as List).forEach((articleJson) {
      articles.add(NewsArticle.fromJson(articleJson));
    });
  }

  return articles;
}

Future<List<NewsArticle>> latest() async {
  var response = await sendGetRequest(
      routeEverything, {'language': 'en', 'sortBy': 'popularity'});

  List<NewsArticle> articles = [];
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);

    (jsonData['articles'] as List).forEach((articleJson) {
      articles.add(NewsArticle.fromJson(articleJson));
    });
  }

  return articles;
}

Future<http.Response> sendGetRequest(route, params) async {
  var headers = {
    "Authorization": newsApiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    route,
    params,
  );

  var response = await http.get(url, headers: headers);
  return response;
}
