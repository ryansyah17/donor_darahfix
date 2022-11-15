import 'package:donor_darah/controllers/daftardonor_controller.dart';
import 'package:donor_darah/models/pendonor.dart';
import 'package:donor_darah/services/pendonor_services.dart';
import 'package:donor_darah/shared/shared.dart';
import 'package:donor_darah/ui/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'package:toast/toast.dart';

class DaftarDonorPage extends GetView<DaftarDonorController> {
  const DaftarDonorPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _floating = false;
    bool _pinned = true;
    final daftarDonor = Get.find<PendonorServices>();
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
                              child: Text('Daftar Donor',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Container(
                              width: 140,
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
                    children: [
                      Container(
                        // margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width - 60,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/oke.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        key: ValueKey('idUsers'),
                        controller: controller.idUsers,
                        keyboardType: TextInputType.name,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'sementara id user',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('nama'),
                        controller: controller.namaLengkap,
                        keyboardType: TextInputType.name,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Nama Lengkap',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('tempat'),
                        controller: controller.tempatLahir,
                        keyboardType: TextInputType.name,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Tempat Lahir',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('tanggal'),
                        controller: controller.tanggalLahir,
                        keyboardType: TextInputType.name,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Tanggal Lahir',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('jenisKelamin'),
                        controller: controller.jenisKelamin,
                        keyboardType: TextInputType.name,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Jenis Kelamin',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('alamat'),
                        controller: controller.alamat,
                        keyboardType: TextInputType.name,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Alamat',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('Nohandphone'),
                        controller: controller.noHandphone,
                        keyboardType: TextInputType.phone,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'No Handphone',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('golonganDarah'),
                        controller: controller.golonganDarah,
                        keyboardType: TextInputType.name,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Golongan Darah',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('beratBadan'),
                        controller: controller.beratBadan,
                        keyboardType: TextInputType.number,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Berat Badan',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('tekananDarah'),
                        controller: controller.tekananDarah,
                        keyboardType: TextInputType.name,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Tekanan Darah',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('kadarHb'),
                        controller: controller.kadarHb,
                        keyboardType: TextInputType.name,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Kadar HB',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: ValueKey('tanggalDonor'),
                        controller: controller.tanggalDonor,
                        keyboardType: TextInputType.name,
                        style: blackFontStyle2,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Tanggal Donor',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{4,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Nama tidak valid (Min. 4 karakter)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                if (controller.namaLengkap.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller
                                    .tempatLahir.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller
                                    .tanggalLahir.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller
                                    .jenisKelamin.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller.alamat.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller
                                    .noHandphone.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller
                                    .golonganDarah.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller.beratBadan.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller
                                    .tanggalDonor.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else {
                                  daftarDonor.createPendonor(Pendonor(
                                      name: controller.namaLengkap.text,
                                      tempatLahir: controller.tempatLahir.text,
                                      tanggalLahir:
                                          controller.tanggalLahir.text,
                                      jenisKelamin:
                                          controller.jenisKelamin.text,
                                      alamat: controller.alamat.text,
                                      nohp: controller.noHandphone.text,
                                      goldarah: controller.golonganDarah.text,
                                      beratbadan: controller.beratBadan.text,
                                      tekanandarah:
                                          controller.tekananDarah.text,
                                      tanggalDonor:
                                          controller.tanggalDonor.text,
                                      kadarhb: controller.kadarHb.text,
                                      idUsers: controller.idUsers.text));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: primer,
                                ),
                                padding: EdgeInsets.all(10),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                child: Center(
                                  child: Text(
                                    "Submit",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              decoration: BoxDecoration(
                                color: primer,
                                boxShadow: [
                                  BoxShadow(blurRadius: 5),
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
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
