import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class MovieScreen extends StatefulWidget {
  MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late String? bg;

  Map<String, String> data = {};
  @override
  Widget build(BuildContext context) {
    print(Get.arguments.toString());
    data = Get.arguments;
    print(data);
    bg = data['bg'];
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffffd9a4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            height: Get.height / 2.5,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: NetworkImage(bg.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 20),
                  child: Text(
                    'Matrix',
                    style: TextStyle(
                      color: Color(0xff626B63),
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: Text(
                    'Thomas Anderson, a computer programmer, is led to fight an underground war against powerful computers who have constructed his entire reality with a system called the Matrix.',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        onRatingUpdate: (rating) {},
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        ignoreGestures: true,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text("Added to Wishlist!"),
                            duration: Duration(seconds: 3),
                          );

                          // ignore: deprecated_member_use
                          _scaffoldKey.currentState!.showSnackBar(snackBar);
                        },
                        child: Icon(
                          Icons.bookmark_add,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(
                    'Cast',
                    style: TextStyle(
                      color: Color(0xff626B63),
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: Get.width - 20,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: castImg.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(bottom: 30, right: 8),
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(castImg[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<String> castImg = [
  "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTkqugX0WLc78TSUXjzYAQvwT7nqU8vJknuJGldrNv0FO7kD8vl",
  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTfB1MnNZFbA_0PbtJOZtLsaECmMiSgyHdmI9VkKQhEjLDoByvn",
  "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTbpjMiELi2ayfFJbiT4bASP81UGXgXirJ1aAAXPgnXoJ8lZoSp",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlF_NyDy_WEhFugnJ5xyapYDSTOsHk6JuANJ8Vo9qZRmu71-iB",
  "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR-sNQjQ7z8JLEHvWVeIOFNCGfJx2bYccvw0MAm5XeTCGkBShyR",
];
