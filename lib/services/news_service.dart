import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsService {
  final String _baseUrl = 'https://news.kumudam.com/api/posts/';
  final int _limit = 20;

  Future<List<NewsModel>> fetchNews(int offset) async {
    final url = Uri.parse(
        '$_baseUrl?limit=$_limit&offset=$offset&order=id&orderType=desc');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (error) {
      throw Exception('Failed to load news: $error');
    }
  }
}
