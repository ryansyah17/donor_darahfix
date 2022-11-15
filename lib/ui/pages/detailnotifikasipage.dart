import 'package:donor_darah/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailNotifikasiPage extends StatelessWidget {
  const DetailNotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primer,
        title: Text(
          'Detail Notifikasi',
          style: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            'Segera',
            style: GoogleFonts.poppins(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
