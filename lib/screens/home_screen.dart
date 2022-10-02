import 'package:flutter/material.dart';
import 'package:flutter_news_app/components/news_type_tile.dart';

import '../components/news_horizontal_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List newsType = [
    ['Politics', true],
    ['Tech', false],
    ['Sports', false],
    ['Investigations', false],
    ['World', false],
  ];
  void newsTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < newsType.length; i++) {
        if (i == index) {
          newsType[i][1] = true;
        } else {
          newsType[i][1] = false;
        }
      }
      print('zmfflr');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            'assets/images/logo.png',
          ),
          title: Text(
            'Beyond News',
            style: TextStyle(color: Colors.black87),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(
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
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  NewsHorizontalTile(),
                ],
              ),
            ),
          ],
        ));
  }
}
