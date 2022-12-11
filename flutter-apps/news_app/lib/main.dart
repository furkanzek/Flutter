import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/news_service.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/content/edu_model.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/content/news_model.dart';
import 'package:news_app/content/social_model.dart';
import 'package:news_app/screens/notifications_page.dart';
import 'package:news_app/screens/profile_page.dart';
import 'package:news_app/screens/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MainPage(title: 'Haberler'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required String title}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int now = 1;
  final models = [
    EduModel(),
    NewsModel(),
    SocialModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  floating: true,
                  centerTitle: true,
                  title: Text(
                    "QUEMA",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shrikhand',
                    ),
                  ),
                  toolbarHeight: 45.0,
                  elevation: 0.0,
                  backgroundColor: Color.fromRGBO(209, 220, 226, 1),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ));
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationsPage(),
                              ));
                        },
                        icon: Icon(
                          Icons.notifications_active_sharp,
                          color: Colors.black,
                        )),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsPage(),
                            ));
                      },
                      icon: Icon(
                        Icons.settings_rounded,
                        color: Colors.black,
                      ),
                    )
                  ],
                )
              ],
          body: models[now]),
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromRGBO(209, 220, 226, 1),
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInCubic,
        animationDuration: Duration(milliseconds: 250),
        color: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Colors.transparent,
        height: 50.0,
        items: [
          Icon(
            Icons.document_scanner,
            size: 27,
            color: Colors.white,
          ),
          Icon(
            Icons.newspaper,
            size: 27,
            color: Colors.white,
          ),
          Icon(
            Icons.account_tree,
            size: 27,
            color: Colors.white,
          ),
        ],
        index: now,
        onTap: (index) {
          setState(() {
            now = index;
          });
        },
      ),
    );
  }
}
