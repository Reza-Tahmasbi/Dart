class JsonToDart {
  final String status;
  final int totalResults;
  final List<Articles> articles;

  JsonToDart({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory JsonToDart.fromJson(Map<String, dynamic> json) {
    return JsonToDart(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((article) => Articles.fromJson(article as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Articles {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}

class Source {
  final String? id; // Changed to String? to handle null
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?, // Can be null
      name: json['name'] as String,
    );
  }
}
