import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/detail_screen.dart';

class NewsTile extends StatelessWidget {
  final String imageSource;
  final String title;
  final String subtitle;
  const NewsTile({
    Key? key,
    required this.imageSource,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 2 / 1,
          child: imageSource == "null"
              ? Image.asset("assets/images/logo.png")
              : Image.network(
                  imageSource,
                  fit: BoxFit.cover,
                ),
        ),
        SizedBox(
          height: 6,
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 300,
              child: Text(
                subtitle == "null" ? "no description" : subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
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
    );
  }
}
