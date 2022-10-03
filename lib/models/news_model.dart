class Articles {
  String? title;
  String? description;
  String? urlToImage;
  String? author;
  String? url;
  String? publishedAt;
  String? content;

  Articles(
      {this.title,
      this.description,
      this.urlToImage,
      this.author,
      this.url,
      this.publishedAt,
      this.content});

  Articles.fromjson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    author = json['author'];
    url = json['url'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}

class NewsModel {
  List<Articles>? articles;

  NewsModel({this.articles});
  NewsModel.fromjson(Map<String, dynamic> json) {
    articles =
        (json["articles"] as List).map((e) => Articles.fromjson(e)).toList();
  }
}
