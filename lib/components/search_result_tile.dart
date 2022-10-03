import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/detail_screen.dart';
import 'package:get/get.dart';
import '../models/news_model.dart';
import '../size.dart';

class SearchResultTile extends StatelessWidget {
  final Articles articles;

  const SearchResultTile({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getBodyHeight(context) * 0.25,
          child: Row(
            children: [
              _articleImage(context),
              _articleContents(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }

  Widget _articleContents() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                articles.title.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              child: Text(
                articles.description.toString() == "null"
                    ? "no description"
                    : articles.description.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Learn more",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Get.to(DetailSceen(articles: articles));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black54,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _articleImage(BuildContext context) {
    return SizedBox(
      width: setImageWidth(context),
      height: double.infinity,
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
