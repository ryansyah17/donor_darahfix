import 'package:donor_darah/ui/pages/homepage.dart';
import 'package:donor_darah/ui/pages/information_page.dart';
import 'package:donor_darah/ui/pages/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:supercharged/supercharged.dart';

class MainPage extends StatefulWidget {
  final int? initialPage;

  MainPage({this.initialPage});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    _index = widget.initialPage!;
    pageController = PageController(initialPage: widget.initialPage!);
  }

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.person, size: 30, color: Colors.white),
      Icon(Icons.info, size: 30, color: Colors.white),
      Icon(Icons.article, size: 30, color: Colors.white),
    ];
    final pages = <Widget>[
      HomePage(),
      InformationPage(),
      SchedulePage(),
    ];
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.red,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: '630000'.toColor(),
          height: 70,
          index: _index,
          items: items,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          }),
      body: pages[_index],
    );
  }
}
