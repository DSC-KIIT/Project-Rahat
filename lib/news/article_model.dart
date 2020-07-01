class ArticleModel {
  String title;
  String author;
  String description;
  String urlToImage;
  DateTime publshedAt;
  String content;
  String articleUrl;

  ArticleModel(
      {this.articleUrl,
      this.author,
      this.content,
      this.description,
      this.publshedAt,
      this.title,
      this.urlToImage});
}
