import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailSceen extends StatelessWidget {
  const DetailSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'title',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Text(
                'subtitle',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Image.network(
                  'https://previews.123rf.com/images/siwasasil/siwasasil1601/siwasasil160100034/52866800-%EC%9D%BC%EB%B3%B8%EC%9D%98-%EC%A7%80%EB%B6%95-%EC%A7%91-%EB%A7%A8-%EC%9C%84%EC%97%90-%ED%95%98%EC%96%80-%EB%88%88.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              )
            ],
          ),
        ),
      )),
    );
  }
}
