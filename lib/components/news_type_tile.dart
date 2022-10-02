import 'package:flutter/material.dart';

class NewsTypeTile extends StatelessWidget {
  final String newsType;
  final bool isSelected;
  final VoidCallback onTap;

  const NewsTypeTile(
      {super.key,
      required this.newsType,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: isSelected ? Colors.black87 : Colors.grey,
              )),
          child: Text(
            newsType,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.black87 : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
