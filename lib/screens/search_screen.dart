import 'package:flutter/material.dart';
import 'package:flutter_news_app/components/title_tile.dart';
import 'package:get/get.dart';

import '../components/search_result_tile.dart';
import '../models/news_model.dart';
import '../viewmodels/news_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = Get.put(NewsViewModel());
  final _textController = TextEditingController();
  String searchText = "";

  @override
  void initState() {
    _textController.addListener(_searchText);
    super.initState();
  }

  void _searchText() {
    setState(() {
      searchText = _textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:
            _textController.text.isEmpty ? Container() : _searchResult(context),
      )),
    );
  }

  Widget _searchResult(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TitleTile(titleText: 'Search \nResult'),
            FutureBuilder(
                future: controller.getSearchData(searchText),
                builder: (context, AsyncSnapshot snapshot) {
                  NewsModel? data = snapshot.data;
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data!.articles!.length,
                      itemBuilder: (context, index) {
                        return SearchResultTile(
                          articles: data.articles![index],
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Form(
        child: TextFormField(
          controller: _textController,
          autofocus: true,
          cursorColor: Colors.black54,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      elevation: 0,
    );
  }
}
