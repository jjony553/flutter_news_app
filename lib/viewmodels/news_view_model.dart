import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class NewsViewModel extends GetxController {
  getData() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=af5ad207e30549c1b29025376c4a86a6");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return NewsModel.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('can not get data', e.toString());
      }
    }
  }
}
