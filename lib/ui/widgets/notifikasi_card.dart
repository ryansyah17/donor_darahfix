import 'package:donor_darah/models/notifikasi.dart';
import 'package:donor_darah/shared/shared.dart';
import 'package:donor_darah/ui/pages/detailnotifikasipage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifikasiCard extends StatelessWidget {
  final Notifications? notifikasi;
  final Widget? widget;

  NotifikasiCard(this.notifikasi, {this.widget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailNotifikasiPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5)],
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.airline_seat_flat,
                size: 40,
              ),
            ),
            Container(
              width: 3,
              height: 80,
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        'Nama :',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        notifikasi!.name!,
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        'Gol. Darah:',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        notifikasi!.goldarah!,
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 5, left: 5),
                        child: Icon(
                          Icons.bloodtype_outlined,
                          size: 20,
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        ':',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        notifikasi!.kebutuhanDarah!,
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        'Kantong',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
