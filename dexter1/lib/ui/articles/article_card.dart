import 'package:dexter1/models/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          border: BorderDirectional(
            top: BorderSide(
              color: Colors.pink.shade50,
              width: 20,
              style: BorderStyle.solid,
            ),
            start: BorderSide(
              color: Colors.pink.shade50,
              width: 20,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          leading: SizedBox(
            width: 50,
            child: Center(
              child: Image.asset(
                article.image,
              ),
            ),
          ),
          title: Text(
            article.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Wrap(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    article.author,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(article.minsToRead.toString() + ' min read'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    //   ),
    // );
  }
}
