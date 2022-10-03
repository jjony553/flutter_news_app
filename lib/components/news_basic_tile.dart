import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:get/get.dart';
import '../screens/detail_screen.dart';

class NewsBasicTile extends StatelessWidget {
  final Articles articles;
  const NewsBasicTile({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailSceen(articles: articles));
      },
      child: SizedBox(
        width: double.infinity,
        height: 110,
        child: Column(
          children: [
            const Divider(
              height: 1,
            ),
            ListTile(
                title: Text(
                  articles.title.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    articles.description.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.black54,
                )),
          ],
        ),
      ),
    );
  }
}
