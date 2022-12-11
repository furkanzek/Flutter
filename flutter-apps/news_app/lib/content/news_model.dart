import 'package:flutter/material.dart';
import 'package:news_app/data/news_service.dart';
import 'package:news_app/models/articles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsModel extends StatefulWidget {
  const NewsModel({Key? key}) : super(key: key);

  @override
  State<NewsModel> createState() => _NewsModelState();
}

class _NewsModelState extends State<NewsModel> {
  List<Articles> articles = [];

  @override
  void initState() {
    NewsSevice.getNews().then((value) {
      setState(() {
        articles = value!;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 156, 230, 212),
                        Color.fromARGB(255, 65, 152, 130),
                        Color.fromARGB(255, 135, 213, 193)
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20), // Image border
                          // Image radius
                          child: Image.network(
                            articles[index].urlToImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          articles[index].title!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(articles[index].author!),
                        leading: Icon(Icons.open_in_new),
                        onTap: () async {
                          // ignore: deprecated_member_use
                          await launchUrlString(articles[index].url.toString());
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15, right: 10, left: 10, bottom: 20),
                        child: Text(articles[index].description!),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
