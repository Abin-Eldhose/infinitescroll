import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/news_provider.dart';
import '../utilities/date_formatter.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Provider.of<NewsProvider>(context, listen: false).fetchNews();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsProvider>(context, listen: false).fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<NewsProvider>(
          builder: (context, provider, child) {
            if (provider.errorMessage != null) {
              return Center(child: Text('Error: ${provider.errorMessage}'));
            }

            return RefreshIndicator(
              onRefresh: () async {
                await provider.refreshNews();
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount:
                    provider.newsList.length + (provider.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < provider.newsList.length) {
                    final news = provider.newsList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Container(
                              height: h * 0.3,
                              color: Colors.grey,
                              child: news.imageDefault != null
                                  ? Image.network(
                                      news.imageDefault!,
                                      fit: BoxFit.cover,
                                    )
                                  : const Placeholder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 20, bottom: 10),
                            child: Text(
                              news.title ?? 'No Title',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: w * 0.037,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 20),
                            child: Text(
                              formatDate(news.createdAt),
                              style: TextStyle(
                                  fontSize: w * 0.025,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
