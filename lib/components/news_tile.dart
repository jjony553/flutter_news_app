import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/news_model.dart';
import '../screens/detail_screen.dart';

class NewsTile extends StatelessWidget {
  final Articles articles;
  const NewsTile({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _articleImage(),
        const SizedBox(
          height: 6,
        ),
        _articleTitle(),
        _articleDescription(),
      ],
    );
  }

  Row _articleDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 300,
          child: Text(
            articles.description.toString() == "null"
                ? "no description"
                : articles.description.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
            onPressed: () {
              Get.to(DetailSceen(
                articles: articles,
              ));
            },
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.black54,
            ))
      ],
    );
  }

  SizedBox _articleTitle() {
    return SizedBox(
      child: Text(
        articles.title.toString(),
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  AspectRatio _articleImage() {
    return AspectRatio(
      aspectRatio: 2 / 1,
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
