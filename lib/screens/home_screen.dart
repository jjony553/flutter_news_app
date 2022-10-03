import 'package:flutter/material.dart';
import 'package:flutter_news_app/components/news_basic_tile.dart';
import 'package:flutter_news_app/components/news_type_tile.dart';
import 'package:get/get.dart';

import '../components/news_horizontal_tile.dart';
import '../models/news_model.dart';
import '../viewmodels/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(NewsViewModel());

  String nowCategory = 'Business';
  final List newsType = [
    ['Business', true],
    ['Entertainment', false],
    ['Sports', false],
    ['Technology', false],
    ['Science', false],
    ['General', false],
  ];
  void newsTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < newsType.length; i++) {
        if (i == index) {
          newsType[i][1] = true;
          nowCategory = newsType[i][0];
        } else {
          newsType[i][1] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _customAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _newsTypeList(),
              const SizedBox(
                height: 16,
              ),
              _categoryItemDisplayList(),
            ],
          ),
        ));
  }

  Widget _newsTypeList() {
    return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newsType.length,
          itemBuilder: (context, index) {
            return NewsTypeTile(
                newsType: newsType[index][0],
                isSelected: newsType[index][1],
                onTap: () {
                  newsTypeSelected(index);
                });
          },
        ));
  }

  FutureBuilder<dynamic> _categoryItemDisplayList() {
    return FutureBuilder(
        future: controller.getCategoryData(nowCategory),
        builder: (context, AsyncSnapshot snapshot) {
          NewsModel? data = snapshot.data;
          if (snapshot.hasData) {
            return Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  _newsHorizontalList(data),
                  _newsBasicList(data),
                ],
              ),
            ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _newsBasicList(NewsModel? data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data!.articles!.length - 3,
      itemBuilder: (context, index) {
        return NewsBasicTile(
          articles: data.articles![index + 3],
        );
      },
    );
  }

  Widget _newsHorizontalList(NewsModel? data) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return NewsHorizontalTile(
              index: index + 1,
              articles: data!.articles![index],
            );
          }),
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      leading: Image.asset(
        'assets/images/logo.png',
      ),
      title: const Text(
        'Beyond News',
        style: TextStyle(color: Colors.black87),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
