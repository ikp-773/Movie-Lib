import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/user.dart';
import 'package:movie_app/screens/genre.dart';
import 'package:movie_app/services/auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthServices _auth = AuthServices();
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              // onTap: () async {
              //   try {
              //     UserModel result = await _auth.signInUsingGoogle();
              //     // ignore: unnecessary_null_comparison
              //     if (result == null) {
              //       setState(() {
              //         error = 'Could not Sign In with Google';
              //       });
              //     } else {
              //       Get.to(() => GenreScreen());
              //     }
              //   } catch (e) {}
              // },
              onTap: () {
                Get.to(() => GenreScreen());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 23),
                decoration: BoxDecoration(
                  color: Color(0xff626B63),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 50,
                width: 600,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13),
                      child: Image.asset(
                        'assets/google.png',
                        height: 15.4,
                      ),
                    ),
                    Container(
                      width: .5,
                      height: 60,
                      margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                      child: Text(
                        'Continue with Google',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              error,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffffd9a4),
    );
  }
}
