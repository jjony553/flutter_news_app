import 'package:flutter/material.dart';
import 'package:flutter_news_app/components/title_tile.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_news_app/screens/detail_screen.dart';
import 'package:get/get.dart';
import '../components/news_tile.dart';
import '../viewmodels/news_view_model.dart';

class NewsScreen extends GetWidget<NewsViewModel> {
  @override
  final controller = Get.put(NewsViewModel());

  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TitleTile(
              titleText: 'Breacking \nNews',
            ),
            _breakingNewsItem(),
          ],
        ),
      ),
    )));
  }

  FutureBuilder<dynamic> _breakingNewsItem() {
    return FutureBuilder(
        future: controller.getData(),
        builder: (context, AsyncSnapshot snapshot) {
          NewsModel? data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data!.articles!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(DetailSceen(articles: data.articles![index]));
                  },
                  child: NewsTile(
                    articles: data.articles![index],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
