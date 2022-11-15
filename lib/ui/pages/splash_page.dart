import 'dart:async';
// import 'package:donor_darah/ui/pages/loginpage.dart';
import 'package:donor_darah/main.dart';
// import 'package:donor_darah/ui/pages/login_page_coba.dart';
import 'package:donor_darah/ui/pages/main_page.dart';
import 'package:donor_darah/ui/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => initLogin == 0 || initLogin == null
                  ? WelcomePage()
                  : MainPage(
                      initialPage: 0,
                    )));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/blood-drop.png'),
                ),
              ),
            ),
            Container(
              child: Text(
                'Blood Donors',
                style: GoogleFonts.irishGrover(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w800),
              ),
            )
          ],
        ),
      ),
    );
  }
}
