import 'package:flutter/material.dart';

class TitleTile extends StatelessWidget {
  final String titleText;
  const TitleTile({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Divider(
            height: 5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
