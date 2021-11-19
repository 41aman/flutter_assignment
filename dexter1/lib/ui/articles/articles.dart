import 'package:dexter1/models/article.dart';
import 'package:dexter1/ui/articles/article_card.dart';
import 'package:flutter/material.dart';

List<Article> articleList = [
  Article(
    title: 'How to Seem Like You Always Have Your Shot Together',
    minsToRead: 4,
    author: 'Jonhy Vino',
    image: 'assets/article_card1.jpg',
  ),
  Article(
    title: 'Does Dry is January Actually Improve Your Health?',
    minsToRead: 4,
    author: 'Jonhy Vino',
    image: 'assets/article_card.jpg',
  ),
  Article(
    title: 'You do hire a designer to make something. You do hire them.',
    minsToRead: 4,
    author: 'Jonhy Vino',
    image: 'assets/onboarding_image_3.png',
  ),
  Article(
    title: 'How to Flutter',
    minsToRead: 7,
    author: 'Jane Doe',
    image: 'assets/onboarding_image_2.png',
  ),
];

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 70,
          title: Text(
            'Categories',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.workspaces_filled,
            color: Colors.black,
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.pinkAccent,
            labelColor: Colors.pinkAccent,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                child: Text('For You'),
              ),
              Tab(
                child: Text('Design'),
              ),
              Tab(
                child: Text('Beauty'),
              ),
              Tab(
                child: Text('Design'),
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 8),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ArticleCard(article: articleList[index]);
                  },
                  itemCount: articleList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
