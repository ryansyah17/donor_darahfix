import 'package:donor_darah/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class SyaratPendonorPage extends StatelessWidget {
  bool _pinned = true;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                pinned: _floating,
                floating: false,
                flexibleSpace: Container(),
              ),
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                expandedHeight: 60,
                shadowColor: Colors.transparent,
                pinned: _pinned,
                flexibleSpace: Container(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Syarat Pendonor',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Container(
                              width: 175,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: '630000'.toColor(),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        width: MediaQuery.of(context).size.width - 60,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://imgx.parapuan.co/crop/0x0:0x0/x/photo/2021/01/31/2736410jpg-20210131121959.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Beberapa Syarat Sebagai Pendonor :',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://daihatsujember.com/wp-content/uploads/2016/12/Logo-Donor-Darah.jpg',
                                ),
                                opacity: 0.1)),
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '1. Kondisi fisik harus dalam keadaan sehat, jasmani maupun rohani.\n\n2. Berusia 17-60 tahun. Namun, untuk remaja usia 17 tahun diperbolehkan menjadi donor darah, bila mendapat izin tertulis dari orangtua dan memenuhi persyaratan lain.\n\n3. Memiliki berat badan minimal 45 kilogram.\n\n4. Suhu tubuh 36,6-37,5 derajat Celcius.\n\n5. Tekanan darah harus berada di angka 100-160 untuk sistolik dan 70-100 untuk diastolik.\n\n6. Saat pemeriksaan, denyut nadi harus sekitar 50-100 kali per menit.\n\n7. Kadar hemoglobin minimal 12 gr/dl untuk wanita, dan minimal 12,5 gr/dl untuk pria.',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        width: MediaQuery.of(context).size.width - 35,
                        height: 5,
                        color: primer,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          width: MediaQuery.of(context).size.width - 35,
                          height: 5,
                          color: primer),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        width: MediaQuery.of(context).size.width - 35,
                        height: 5,
                        color: primer,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Kelompok Orang yang tidak boleh mendonor :',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://daihatsujember.com/wp-content/uploads/2016/12/Logo-Donor-Darah.jpg',
                                ),
                                opacity: 0.1)),
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '1. Orang yang mengidap Hipertensi.\n\n2. Orang dengan Berat Badan Kurang dari 45 Kg.\n\n3. Orang yang Mengidap Hepatitis B dan C.\n\n4.Orang yang Sedang Hamil.',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ]))
            ],
          ))
        ],
      ),
    );
  }
}
