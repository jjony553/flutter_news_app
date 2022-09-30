import 'package:flutter/material.dart';

import '../components/news_tile.dart';
import '../components/title.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const title(
                  titleText: 'Breacking \nNews',
                ),
                NewsTile(
                  imageSource: 'https://images.wsj.net/im-581988/M',
                  title:
                      'Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                  subtitle:
                      ' The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',
                ),
                NewsTile(
                  imageSource: 'https://images.wsj.net/im-581988/M',
                  title:
                      'Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                  subtitle:
                      ' The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',
                ),
                NewsTile(
                  imageSource: 'https://images.wsj.net/im-581988/M',
                  title:
                      'Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                  subtitle:
                      ' The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
