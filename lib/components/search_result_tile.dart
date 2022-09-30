import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/detail_screen.dart';
import 'package:flutter_news_app/screens/home_screen.dart';
import 'package:get/get.dart';

import '../size.dart';

class SearchResultTile extends StatelessWidget {
  final String imageSource;
  final String title;
  final String subTitle;
  const SearchResultTile({
    Key? key,
    required this.imageSource,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailSceen()),
      child: Column(
        children: [
          SizedBox(
            height: getBodyHeight(context),
            child: Row(
              children: [
                SizedBox(
                  width: setImageWidth(context),
                  height: double.infinity,
                  child: Image.network(
                    imageSource,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            subTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Learn more",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                onPressed: () {
                                  Get.to(DetailSceen());
                                },
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.black54,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
