import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:get/get.dart';

import '../components/news_tile.dart';
import '../components/title.dart';
import '../viewmodels/news_view_model.dart';

class NewsScreen extends GetWidget<NewsViewModel> {
  final controller = Get.put(NewsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const title(
              titleText: 'Breacking \nNews',
            ),
            FutureBuilder(
                future: controller.getData(),
                builder: (context, AsyncSnapshot snapshot) {
                  NewsModel? data = snapshot.data;
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data!.articles!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            NewsTile(
                              imageSource:
                                  data.articles![index].urlToImage.toString(),
                              title: data.articles![index].title.toString(),
                              subtitle:
                                  data.articles![index].description.toString(),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    )));
  }
}
