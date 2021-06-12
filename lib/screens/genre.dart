import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({Key? key}) : super(key: key);

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffd9a4),
      appBar: AppBar(
        // toolbarHeight: 70,
        backgroundColor: Color(0xff626B63),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.bookmark,
              color: Color(0xffffffff),
              size: 30,
            ),
            SizedBox(width: 12),
            Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 1),
        child: Column(
          children: [
            SizedBox(
              height: Get.height - 103,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Container(
                      height: 100,
                      width: Get.width,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://wallpaperaccess.com/full/3075879.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Action',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: RadialGradient(
                          colors: <Color>[
                            Color(0x40ffed99),
                            Color(0x40ac66cc),
                          ],
                          tileMode: TileMode
                              .clamp, // repeats the gradient over the canvas
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> bgImgs = [];
