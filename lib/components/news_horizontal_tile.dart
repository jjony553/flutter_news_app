import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_news_app/size.dart';
import 'package:get/get.dart';
import '../screens/detail_screen.dart';

class NewsHorizontalTile extends StatelessWidget {
  final int index;
  final Articles articles;
  const NewsHorizontalTile({
    super.key,
    required this.index,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailSceen(articles: articles));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: SizedBox(
          width: setImageWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  _articleImage(context),
                  _articleRank(),
                ],
              ),
              Text(
                articles.title.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }

  Positioned _articleRank() {
    return Positioned(
      top: 5,
      left: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: 35,
        color: Colors.black54,
        child: Text(
          index.toString(),
          style: const TextStyle(
            height: 1,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  SizedBox _articleImage(BuildContext context) {
    return SizedBox(
      height: getBodyHeight(context) * 0.35,
      child: articles.urlToImage.toString() == "null"
          ? Image.asset("assets/images/logo.png")
          : CachedNetworkImage(
              imageUrl: articles.urlToImage.toString(),
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
    );
  }
}
