import 'package:flutter/material.dart';
import '../services/news_service.dart';
import '../models/news_model.dart';

class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();

  List<NewsModel> newsList = [];
  bool hasMore = true;
  bool isLoading = false;
  String? errorMessage;
  int _currentOffset = 0;

  Future<void> fetchNews() async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    notifyListeners();

    try {
      final news = await _newsService.fetchNews(_currentOffset);

      if (news.isEmpty) {
        hasMore = false;
      } else {
        newsList.addAll(news);
        _currentOffset += 20;
      }
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshNews() async {
    newsList = [];
    hasMore = true;
    _currentOffset = 0;
    await fetchNews();
  }
}
