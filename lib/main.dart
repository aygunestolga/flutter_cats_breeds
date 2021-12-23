import 'package:flutter/material.dart';
import 'package:flutter_cats_breeds/screeens/cat_breeds.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sweet Cats',
      theme: ThemeData.light(),
      home: Center(child: CatBreedsPage(title: "Cats Breed")),
    );
  }
}
