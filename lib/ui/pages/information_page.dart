import 'package:donor_darah/ui/pages/ilmudarahpage.dart';
import 'package:donor_darah/ui/pages/informasistokpage.dart';
import 'package:donor_darah/ui/pages/manfaatdonorpage.dart';
import 'package:donor_darah/ui/pages/menjagakesehatanpage.dart';
import 'package:donor_darah/ui/pages/notifikasipage.dart';
import 'package:donor_darah/ui/pages/syaratpendonorpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  int selectedIndex = 0;
  // ignore: unused_field
  int _current = 0;
  // ignore: unused_field
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://th.bing.com/th/id/R.acabc3b651e90213337b344790d07797?rik=%2favaRfOqS%2bL0Ug&riu=http%3a%2f%2f1.bp.blogspot.com%2f-7ZMaEyRTsgM%2fUiPog4FgkqI%2fAAAAAAAAAGw%2ffTWL4Gp0a-Y%2fs1600%2fDonor%2bDarah%2b2.jpg&ehk=TmddE9sPoqGK1gQWJkBdNYlVyMQLZfbx%2bSWqkRL8SYo%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
      'https://i.pinimg.com/originals/54/87/b9/5487b9ba869f9cdd617095f64d22e2b3.jpg',
      'https://th.bing.com/th/id/OIP.F-HUZB7Sw25idCkJ0_Al3gHaEB?w=331&h=181&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.a06eFRDjIkFfrSbfAWnDagHaEZ?w=309&h=184&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.4t5KITL1UJzAsPGOXtIv4wHaEK?w=276&h=180&c=7&r=0&o=5&pid=1.7',
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: [
                      Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
              ),
            ))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: NestedScrollView(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              // scrollDirection: Axis.horizontal,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  CupertinoSliverNavigationBar(
                    automaticallyImplyLeading: false,
                    // leading: GestureDetector(
                    //     onTap: () {
                    //       Get.back();
                    //     },
                    //     child: Icon(Icons.arrow_back_ios)),
                    largeTitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Text('Informasi',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Container(
                              width: 100,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: '630000'.toColor(),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                child: CarouselSlider(
                                  items: imageSliders,
                                  options: CarouselOptions(
                                    height: 180.0,
                                    autoPlay: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      imgList.asMap().entries.map((entry) {
                                    return GestureDetector(
                                      onTap: () =>
                                          _controller.animateToPage(entry.key),
                                      child: Container(
                                        width: 7.0,
                                        height: 7.0,
                                        margin: EdgeInsets.symmetric(
                                          vertical: 8.0,
                                          horizontal: 4.0,
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black)
                                                  .withOpacity(
                                            _current == entry.key ? 0.9 : 0.3,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InformasiStokPage()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                4), // changes position of shadow
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://cdn-icons-png.flaticon.com/128/943/943579.png'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'Informasi Ketersediaan \nDarah',
                                              style: GoogleFonts.poppins(
                                                  color: "630000".toColor(),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          SyaratPendonorPage())));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                4), // changes position of shadow
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://cdn-icons-png.flaticon.com/128/4490/4490478.png'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'Syarat Pendonor',
                                              style: GoogleFonts.poppins(
                                                  color: "630000".toColor(),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),  
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManfaatDonorPage()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                4), // changes position of shadow
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://cdn-icons-png.flaticon.com/128/3588/3588592.png'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'Manfaat Donor Darah',
                                              style: GoogleFonts.poppins(
                                                  color: "630000".toColor(),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NotifikasiPage()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                4), // changes position of shadow
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://cdn-icons-png.flaticon.com/128/2950/2950553.png'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'Notification',
                                              style: GoogleFonts.poppins(
                                                  color: "630000".toColor(),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IlmuDarahPage()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                4), // changes position of shadow
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://cdn-icons-png.flaticon.com/128/2679/2679284.png'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'Apa itu Darah ?',
                                              style: GoogleFonts.poppins(
                                                  color: "630000".toColor(),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MenjagaKesehatanPage()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                4), // changes position of shadow
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://cdn-icons-png.flaticon.com/128/1668/1668531.png'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'Cara Menjaga \nKesehatan',
                                              style: GoogleFonts.poppins(
                                                  color: "630000".toColor(),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
