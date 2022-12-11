import 'package:flutter/material.dart';
import 'package:psikozmos/connectivity_provider.dart';
import 'package:psikozmos/homePage.dart';
import 'package:psikozmos/no_int.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: NoInternet(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BSG HABER',
        home: Main(title: 'BSG HABER'),
      ),
    );
  }
}
