import 'package:flutter/material.dart';

class title extends StatelessWidget {
  final String titleText;
  const title({
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
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Divider(
            height: 5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
