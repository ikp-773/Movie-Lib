import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieListScreen extends StatefulWidget {
  MovieListScreen({Key? key}) : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late String? genre;
  late String? bg;

  Map<String, String> data = {};
  @override
  Widget build(BuildContext context) {
    print("________________+++++");
    print(Get.arguments.toString());
    data = Get.arguments;
    print(data);
    print("________________");
    genre = data['genre'];
    bg = data['bg'];
    return Scaffold(
      backgroundColor: Color(0xffffd9a4),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.only(bottom: 20),
              height: 150,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(bg.toString()),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.dstATop),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    genre.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Dive Into the world of $genre',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height - 302,
              child: GridView.builder(
                  itemCount: bgImgs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.63,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 30,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => MovieListScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              bgImgs[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> bgImgs = [
  'https://images.news18.com/ibnlive/uploads/2016/04/12931171_1079163228794337_8732305975871635522_n.jpg',
  'http://im.rediff.com/movies/2012/feb/13slde1.jpg',
  'https://static.wikia.nocookie.net/dccu/images/f/fd/ZSJL_poster_-_League_together.png/revision/latest?cb=20210302174150',
  'http://hippy.in/wp-content/uploads/custom-made-hollywood-movie-posters-1.jpg',
  'https://blog.karachicorner.com/wp-content/uploads/2013/04/The+Incredible+Burt+Wonderstone+movie+posters.jpg',
  'https://i.insider.com/5ca3d2b892c8866e8b4618d9?width=750&format=jpeg&auto=webp',
  'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY1200_CR89,0,630,1200_AL_.jpg',
  'https://m.media-amazon.com/images/M/MV5BMTY4NzcwODg3Nl5BMl5BanBnXkFtZTcwNTEwOTMyMw@@._V1_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51i9sHBwn7L._AC_.jpg',
  'https://m.media-amazon.com/images/M/MV5BY2ZlNWIxODMtN2YwZi00ZjNmLWIyN2UtZTFkYmZkNDQyNTAyXkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_.jpg',
  'https://m.media-amazon.com/images/M/MV5BMTk3OTM5Njg5M15BMl5BanBnXkFtZTYwMzA0ODI3._V1_.jpg',
  'https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/71fRD3YvnYL.jpg',
  'http://cdn.shopify.com/s/files/1/0151/0741/products/RG66_Copy_1024x1024.jpg?v=1578633324',
  'https://m.media-amazon.com/images/M/MV5BMjA2MTEzMzkzM15BMl5BanBnXkFtZTgwMjM2MTM5MDI@._V1_.jpg',
];
