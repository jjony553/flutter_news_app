import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class NewsViewModel extends GetxController {
  final String baseUrl = "https://newsapi.org/v2/";
  final String apiKey = "af5ad207e30549c1b29025376c4a86a6";
  getData() async {
    final url = Uri.parse("${baseUrl}top-headlines?country=us&apiKey=$apiKey");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return NewsModel.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('can not get data', e.toString());
      }
    }
  }

  getCategoryData(String category) async {
    final url = Uri.parse(
        "${baseUrl}top-headlines?country=us&category=$category&apiKey=$apiKey");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return NewsModel.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('can not get data', e.toString());
      }
    }
  }

  getSearchData(String searchText) async {
    final url = Uri.parse("${baseUrl}everything?q=$searchText&apiKey=$apiKey");
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
