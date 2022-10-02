import 'package:flutter/material.dart';
import 'package:flutter_news_app/size.dart';

class NewsHorizontalTile extends StatelessWidget {
  const NewsHorizontalTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: setImageWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getBodyHeight(context) * 0.35,
            child: Image.network(
              'https://img.sbs.co.kr/newsnet/etv/upload/2021/12/30/30000733714_16v9.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'title',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
