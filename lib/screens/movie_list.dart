import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieListScreen extends StatefulWidget {
  MovieListScreen({Key? key}) : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffd9a4),
      body: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new GridTile(
                footer: new Text('name'),
                child: Text(
                    'image'), //just for testing, will fill with image later
              ),
            );
          }),
    );
  }
}
