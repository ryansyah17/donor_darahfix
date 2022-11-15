import 'dart:async';

import 'package:donor_darah/ui/pages/detailstokdarahpage.dart';
import 'package:flutter/material.dart';

class BerhasilPage extends StatefulWidget {
  const BerhasilPage({super.key});

  @override
  State<BerhasilPage> createState() => _BerhasilPageState();
}

class _BerhasilPageState extends State<BerhasilPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DetailStokDarahPage()));
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 10),
        // width: 80,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/check.png')),
        ),
      ),
    );
  }
}
