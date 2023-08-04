import 'package:comic_book/home/view/home_page_comic.dart';
import 'package:flutter/material.dart';

void main() async{
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Comic_Book",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const Home(),

      debugShowCheckedModeBanner: false,
    );
  }
}
