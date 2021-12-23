import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cats_breeds/api/cats_api.dart';
import 'package:flutter_cats_breeds/models/cats.dart';
import 'cat_info.dart';

class CatBreedsPage extends StatefulWidget {
  CatBreedsPage({ Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CatBreedPageState createState() => _CatBreedPageState();
}

class _CatBreedPageState extends State<CatBreedsPage> {

  BreedList breedList = BreedList();

  @override
  void initState() {
    super.initState();
    getCatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(

          itemCount: (breedList == null ||
              breedList.breeds == null ||
              breedList.breeds.toString().length == 0)
              ? 0
              :breedList.breeds.toString().length,

          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CatInfo(
                    catId: breedList.breeds![index].id,
                    catBreed: breedList.breeds![index].name
                  );
                }));
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ListTile(
                    title: Text(breedList.breeds![index].name!),
                    subtitle: Text(breedList.breeds![index].description!),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void getCatData() async{
   var result = await CatAPI().getCatBreeds();
   print(result);

   var catMap = json.decode(result);
   setState(() {
     breedList = BreedList.fromJson(catMap);
   });

  }
}
