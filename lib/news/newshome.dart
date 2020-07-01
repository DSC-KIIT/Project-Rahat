import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rahat/news/article_model.dart';
import 'package:rahat/news/article_view.dart';
import 'package:rahat/news/category_model.dart';
import 'package:rahat/news/category_news.dart';
import 'package:rahat/news/data.dart';
import 'package:rahat/news/news_page.dart';

class NEWS extends StatefulWidget {
  @override
  _NEWSState createState() => _NEWSState();
}

class _NEWSState extends State<NEWS> {
  Image appLogo = new Image(
      image: new ExactAssetImage("assets/images/rahatori.png"),
      height: 100.0,
      width: 100.0,
      alignment: FractionalOffset.center);
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: appLogo,
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: 70.0,
                        child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageurl: categories[index].imageUrl,
                              categoryname: categories[index].categoryname,
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        child: ListView.builder(
                          itemCount: articles.length,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              description: articles[index].description,
                              url: articles[index].articleUrl,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageurl, categoryname;
  CategoryTile({this.imageurl, this.categoryname});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(
          category: categoryname.toLowerCase(),
        )));
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 16.0,
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                imageUrl: imageurl,
                width: 120.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryname,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String title, imageUrl, description, url;
  BlogTile(
      {@required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Article(posturl: url),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 8.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
