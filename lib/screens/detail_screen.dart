import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/news_model.dart';

class DetailSceen extends StatelessWidget {
  final Articles articles;
  const DetailSceen({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                articles.title.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Text(
                articles.author.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                articles.publishedAt.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              AspectRatio(
                aspectRatio: 2 / 1,
                child: articles.urlToImage.toString() == "null"
                    ? Image.asset("assets/images/logo.png")
                    : CachedNetworkImage(
                        imageUrl: articles.urlToImage.toString(),
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                articles.content.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              )
            ],
          ),
        ),
      )),
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black54,
      elevation: 0,
    );
  }
}
