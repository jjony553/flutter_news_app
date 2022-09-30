import 'package:flutter/material.dart';
import 'package:flutter_news_app/components/title.dart';

import '../components/search_result_tile.dart';
import '../size.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Form(
          child: TextField(),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              title(titleText: 'Search \nResult'),
              SearchResultTile(
                imageSource:
                    'https://previews.123rf.com/images/zerbor/zerbor1503/zerbor150300061/37603330-%EA%B2%BD%EC%A0%9C-%EB%89%B4%EC%8A%A4-%EC%A0%9C%EB%AA%A9%EC%9D%B4-%EC%8B%A4%EB%A6%B0-%EC%8B%A0%EB%AC%B8.jpg',
                title: "How to choose the right chair",
                subTitle: "How to choose the right chair",
              ),
              SearchResultTile(
                imageSource:
                    'https://previews.123rf.com/images/zerbor/zerbor1503/zerbor150300061/37603330-%EA%B2%BD%EC%A0%9C-%EB%89%B4%EC%8A%A4-%EC%A0%9C%EB%AA%A9%EC%9D%B4-%EC%8B%A4%EB%A6%B0-%EC%8B%A0%EB%AC%B8.jpg',
                title: "How to choose the right chair",
                subTitle: "How to choose the right chair",
              ),
              SearchResultTile(
                imageSource:
                    'https://previews.123rf.com/images/zerbor/zerbor1503/zerbor150300061/37603330-%EA%B2%BD%EC%A0%9C-%EB%89%B4%EC%8A%A4-%EC%A0%9C%EB%AA%A9%EC%9D%B4-%EC%8B%A4%EB%A6%B0-%EC%8B%A0%EB%AC%B8.jpg',
                title: "How to choose the right chair",
                subTitle: "How to choose the right chair",
              ),
            ],
          ),
        ),
      )),
    );
  }
}
