import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/user.dart';
import 'package:movie_app/screens/movie_list.dart';
import 'package:movie_app/screens/wishlist.dart';
import 'package:movie_app/services/database.dart';
import 'package:provider/provider.dart';

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
      drawerEdgeDragWidth: Get.width / 2,
      drawer: Container(
        width: Get.width * .67,
        child: Drawer(
          child: Consumer<UserModel>(
            builder: (context, user, child) {
              return StreamBuilder<UserData>(
                  stream: DatabaseService(uid: user.uid).userData,
                  builder: (context, snapshot) {
                    final userData = snapshot.data;

                    return ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        UserAccountsDrawerHeader(
                          accountName: Text(userData!.name),
                          accountEmail: Text(userData.email),
                          currentAccountPicture: Image.network(userData.pic),
                        ),
                        ListTile(
                          title: Text('WishList'),
                          leading: Icon(Icons.bookmark,)
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff666B63),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => Get.to(() => WishlistScreen()),
              child: Icon(
                Icons.bookmark,
                color: Color(0xffffffff),
                size: 30,
              ),
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
                itemCount: genres.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.to(() => MovieListScreen(), arguments: {
                      'genre': genres[index],
                      'bg': bgImgs[index],
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: Get.width,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              bgImgs[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            genres[index],
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
                              col1[index],
                              col2[index],
                            ],
                            tileMode: TileMode.clamp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> bgImgs = [
  'https://cafecomnerd.com.br/wp-content/uploads/2020/08/lionsgate-anuncia-john-wick-5-e-filmados-junto-com-4.jpg',
  'https://cdn130.picsart.com/315328524453201.png',
  'https://i.redd.it/scelthzpbny21.jpg',
  'https://data.whicdn.com/images/331819954/original.jpg',
  'https://cdn9.dissolve.com/p/D2115_221_773/D2115_221_773_1200.jpg',
  'https://www.dodho.com/wp-content/uploads/2017/09/P1110024-Copy.jpg',
  'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/flexslider_full/public/slideshow_image/1-entry-p80.jpg?itok=Ut2jCoTB',
];
List<String> genres = [
  'Action',
  'Romance',
  'Comedy',
  'Kids',
  'Family',
  'Horror',
  'Race'
];

List<Color> col1 = [
  Color(0x40ffed99),
  Color(0x40ffed99),
  Color(0x40ffed99),
  Color(0x40ffed99),
  Color(0x40ffed99),
  Color(0x40ffed99),
  Color(0x40ffed99),
];

List<Color> col2 = [
  Color(0x40ffdd11),
  Color(0x40ffed99),
  Color(0x40ffed99),
  Color(0x40ffed99),
  Color(0x40ffed99),
  Color(0x40ffed99),
  Color(0x40ffed99),
];
