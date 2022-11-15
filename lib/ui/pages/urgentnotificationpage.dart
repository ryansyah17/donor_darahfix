import 'package:donor_darah/controllers/input_notification_controller.dart';
import 'package:donor_darah/models/notifikasi.dart';
import 'package:donor_darah/services/notification_services.dart';
import 'package:donor_darah/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class UrgentNotificationPage extends GetView<InputNotificationController> {
//   Widget build(BuildContext context) {
//

//     return Scaffold(
//       body: Stack(
//         children: [

//             SafeArea(
//               child: CustomScrollView(
//             slivers: [
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 backgroundColor: Colors.white,
//                 pinned: _floating,
//                 floating: false,
//                 flexibleSpace: Container(),
//               ),
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 backgroundColor: Colors.white,
//                 expandedHeight: 60,
//                 shadowColor: Colors.transparent,
//                 pinned: _pinned,
//                 flexibleSpace: Container(
//                   padding: const EdgeInsets.symmetric(vertical: 3),
//                   child: Container(
//                     margin: EdgeInsets.only(left: 15, right: 15),
//                     child: Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               child: Text('Daftar Donor',
//                                   style: GoogleFonts.poppins(
//                                       color: Colors.black,
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.w400)),
//                             ),
//                             Container(
//                               width: 140,
//                               height: 10,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 color: '630000'.toColor(),
//                               ),
//                             )
//                           ],
//                         ),
//                         Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             child: Icon(
//                               Icons.arrow_back_ios,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             SliverList(delegate: SliverChildListDelegate([

//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//               // color: Colors.blue,
//               child: Column(
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width - 60,
//                     height: 150,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('assets/oke.jpg'),
//                             fit: BoxFit.cover)),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     key: ValueKey('namaPasien'),
//                     controller: controller.namaPasien,
//                     keyboardType: TextInputType.name,
//                     style: blackFontStyle2,
//                     textInputAction: TextInputAction.next,
//                     decoration: InputDecoration(
//                       contentPadding: new EdgeInsets.symmetric(
//                         vertical: 16.0,
//                         horizontal: 15.0,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       labelText: 'Nama Pasien',
//                       labelStyle: TextStyle(fontSize: 14),
//                     ),
//                     validator: (value) {
//                       RegExp regExp = RegExp(r'^.{4,}$');
//                       if (value!.isEmpty) {
//                         return 'Nama tidak boleh kosong';
//                       }
//                       if (!regExp.hasMatch(value)) {
//                         return 'Nama tidak valid (Min. 4 karakter)';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     key: ValueKey('umurPasien'),
//                     controller: controller.umurPasien,
//                     keyboardType: TextInputType.number,
//                     style: blackFontStyle2,
//                     textInputAction: TextInputAction.next,
//                     decoration: InputDecoration(
//                       contentPadding: new EdgeInsets.symmetric(
//                         vertical: 16.0,
//                         horizontal: 15.0,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       labelText: 'Umur Pasien',
//                       labelStyle: TextStyle(fontSize: 14),
//                     ),
//                     validator: (value) {
//                       RegExp regExp = RegExp(r'^.{4,}$');
//                       if (value!.isEmpty) {
//                         return 'Nama tidak boleh kosong';
//                       }
//                       if (!regExp.hasMatch(value)) {
//                         return 'Nama tidak valid (Min. 4 karakter)';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     key: ValueKey('alamatPasien'),
//                     controller: controller.alamatPasien,
//                     keyboardType: TextInputType.name,
//                     style: blackFontStyle2,
//                     textInputAction: TextInputAction.next,
//                     decoration: InputDecoration(
//                       contentPadding: new EdgeInsets.symmetric(
//                         vertical: 16.0,
//                         horizontal: 15.0,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       labelText: 'Alamat Pasien / tempat dirawat',
//                       labelStyle: TextStyle(fontSize: 14),
//                     ),
//                     validator: (value) {
//                       RegExp regExp = RegExp(r'^.{4,}$');
//                       if (value!.isEmpty) {
//                         return 'Nama tidak boleh kosong';
//                       }
//                       if (!regExp.hasMatch(value)) {
//                         return 'Nama tidak valid (Min. 4 karakter)';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     key: ValueKey('banyakDarah'),
//                     controller: controller.banyakDarah,
//                     keyboardType: TextInputType.number,
//                     style: blackFontStyle2,
//                     textInputAction: TextInputAction.next,
//                     decoration: InputDecoration(
//                       contentPadding: new EdgeInsets.symmetric(
//                         vertical: 16.0,
//                         horizontal: 15.0,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       labelText: 'Kebutuhan Darah',
//                       labelStyle: TextStyle(fontSize: 14),
//                     ),
//                     validator: (value) {
//                       RegExp regExp = RegExp(r'^.{4,}$');
//                       if (value!.isEmpty) {
//                         return 'Nama tidak boleh kosong';
//                       }
//                       if (!regExp.hasMatch(value)) {
//                         return 'Nama tidak valid (Min. 4 karakter)';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     key: ValueKey('golDarah'),
//                     controller: controller.golDarah,
//                     keyboardType: TextInputType.name,
//                     style: blackFontStyle2,
//                     textInputAction: TextInputAction.next,
//                     decoration: InputDecoration(
//                       contentPadding: new EdgeInsets.symmetric(
//                         vertical: 16.0,
//                         horizontal: 15.0,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       labelText: 'Golongan Darah',
//                       labelStyle: TextStyle(fontSize: 14),
//                     ),
//                     validator: (value) {
//                       RegExp regExp = RegExp(r'^.{4,}$');
//                       if (value!.isEmpty) {
//                         return 'Nama tidak boleh kosong';
//                       }
//                       if (!regExp.hasMatch(value)) {
//                         return 'Nama tidak valid (Min. 4 karakter)';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     key: ValueKey('resusDarah'),
//                     controller: controller.resusDarah,
//                     keyboardType: TextInputType.name,
//                     style: blackFontStyle2,
//                     textInputAction: TextInputAction.next,
//                     decoration: InputDecoration(
//                       contentPadding: new EdgeInsets.symmetric(
//                         vertical: 16.0,
//                         horizontal: 15.0,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       labelText: 'Resus Darah',
//                       labelStyle: TextStyle(fontSize: 14),
//                     ),
//                     validator: (value) {
//                       RegExp regExp = RegExp(r'^.{4,}$');
//                       if (value!.isEmpty) {
//                         return 'Nama tidak boleh kosong';
//                       }
//                       if (!regExp.hasMatch(value)) {
//                         return 'Nama tidak valid (Min. 4 karakter)';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   TextFormField(
//                     key: ValueKey('kontak'),
//                     controller: controller.kontak,
//                     keyboardType: TextInputType.phone,
//                     style: blackFontStyle2,
//                     textInputAction: TextInputAction.next,
//                     decoration: InputDecoration(
//                       contentPadding: new EdgeInsets.symmetric(
//                         vertical: 16.0,
//                         horizontal: 15.0,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       labelText: 'Kontak Keluarga',
//                       labelStyle: TextStyle(fontSize: 14),
//                     ),
//                     validator: (value) {
//                       RegExp regExp = RegExp(r'^.{4,}$');
//                       if (value!.isEmpty) {
//                         return 'Nama tidak boleh kosong';
//                       }
//                       if (!regExp.hasMatch(value)) {
//                         return 'Nama tidak valid (Min. 4 karakter)';
//                       }
//                       return null;
//                     },
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       TextButton(
//                           onPressed: () {
//                             if (controller.namaPasien.text.isEmpty) {
//                               Get.snackbar(
//                                 "Field Required",
//                                 "Nama Harus Diinputkan",
//                                 colorText: Colors.white,
//                                 backgroundColor: Colors.red[300],
//                                 icon: Icon(Icons.warning, color: Colors.red),
//                                 snackPosition: SnackPosition.TOP,
//                               );
//                             } else if (controller.umurPasien.text.isEmpty) {
//                               Get.snackbar(
//                                 "Field Required",
//                                 "Nama Harus Diinputkan",
//                                 colorText: Colors.white,
//                                 backgroundColor: Colors.red[300],
//                                 icon: Icon(Icons.warning, color: Colors.red),
//                                 snackPosition: SnackPosition.TOP,
//                               );
//                             } else if (controller.alamatPasien.text.isEmpty) {
//                               Get.snackbar(
//                                 "Field Required",
//                                 "Nama Harus Diinputkan",
//                                 colorText: Colors.white,
//                                 backgroundColor: Colors.red[300],
//                                 icon: Icon(Icons.warning, color: Colors.red),
//                                 snackPosition: SnackPosition.TOP,
//                               );
//                             } else if (controller.banyakDarah.text.isEmpty) {
//                               Get.snackbar(
//                                 "Field Required",
//                                 "Nama Harus Diinputkan",
//                                 colorText: Colors.white,
//                                 backgroundColor: Colors.red[300],
//                                 icon: Icon(Icons.warning, color: Colors.red),
//                                 snackPosition: SnackPosition.TOP,
//                               );
//                             } else if (controller.golDarah.text.isEmpty) {
//                               Get.snackbar(
//                                 "Field Required",
//                                 "Nama Harus Diinputkan",
//                                 colorText: Colors.white,
//                                 backgroundColor: Colors.red[300],
//                                 icon: Icon(Icons.warning, color: Colors.red),
//                                 snackPosition: SnackPosition.TOP,
//                               );
//                             } else if (controller.resusDarah.text.isEmpty) {
//                               Get.snackbar(
//                                 "Field Required",
//                                 "Nama Harus Diinputkan",
//                                 colorText: Colors.white,
//                                 backgroundColor: Colors.red[300],
//                                 icon: Icon(Icons.warning, color: Colors.red),
//                                 snackPosition: SnackPosition.TOP,
//                               );
//                             } else if (controller.kontak.text.isEmpty) {
//                               Get.snackbar(
//                                 "Field Required",
//                                 "Nama Harus Diinputkan",
//                                 colorText: Colors.white,
//                                 backgroundColor: Colors.red[300],
//                                 icon: Icon(Icons.warning, color: Colors.red),
//                                 snackPosition: SnackPosition.TOP,
//                               );
//                             } else {
//                               urgentNotification.createNotification(
//                                   Notifications(
//                                       name: controller.namaPasien.text,
//                                       umur: controller.umurPasien.text,
//                                       alamat: controller.alamatPasien.text,
//                                       kebutuhanDarah:
//                                           controller.banyakDarah.text,
//                                       goldarah: controller.golDarah.text,
//                                       resusDarah: controller.resusDarah.text,
//                                       kontak: controller.kontak.text));
//                             }
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: primer,
//                             ),
//                             padding: EdgeInsets.all(10),
//                             width: double.infinity,
//                             child: Center(
//                               child: Text(
//                                 "Submit",
//                                 style: GoogleFonts.poppins(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           )),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(bottom: 30),
//                           height: 50,
//                           width: MediaQuery.of(context).size.width / 2 - 40,
//                           decoration: BoxDecoration(
//                             color: primer,
//                             boxShadow: [
//                               BoxShadow(blurRadius: 5),
//                             ],
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Center(
//                             child: Text(
//                               'Batalkan',
//                               style: GoogleFonts.poppins(
//                                   color: Colors.white, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             ],
//             ),
//             );

//   }
// }

  Widget build(BuildContext context) {
    bool _floating = false;
    bool _pinned = true;
    final urgentNotification = Get.find<NotificationServices>();
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
                              child: Text('Urgent Notif',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Container(
                              width: 130,
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
                        key: ValueKey('namaPasien'),
                        controller: controller.namaPasien,
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
                          labelText: 'Nama Pasien',
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
                        height: 20,
                      ),
                      TextFormField(
                        key: ValueKey('umurPasien'),
                        controller: controller.umurPasien,
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
                          labelText: 'Umur Pasien',
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
                        height: 20,
                      ),
                      TextFormField(
                        key: ValueKey('alamatPasien'),
                        controller: controller.alamatPasien,
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
                          labelText: 'Alamat Pasien / tempat dirawat',
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
                        height: 20,
                      ),
                      TextFormField(
                        key: ValueKey('banyakDarah'),
                        controller: controller.banyakDarah,
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
                          labelText: 'Kebutuhan Darah',
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
                        height: 20,
                      ),
                      TextFormField(
                        key: ValueKey('golDarah'),
                        controller: controller.golDarah,
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
                        height: 20,
                      ),
                      TextFormField(
                        key: ValueKey('resusDarah'),
                        controller: controller.resusDarah,
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
                          labelText: 'Resus Darah',
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
                      TextFormField(
                        key: ValueKey('kontak'),
                        controller: controller.kontak,
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
                          labelText: 'Kontak Keluarga',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                if (controller.namaPasien.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller.umurPasien.text.isEmpty) {
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
                                    .alamatPasien.text.isEmpty) {
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
                                    .banyakDarah.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller.golDarah.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller.resusDarah.text.isEmpty) {
                                  Get.snackbar(
                                    "Field Required",
                                    "Nama Harus Diinputkan",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[300],
                                    icon:
                                        Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                } else if (controller.kontak.text.isEmpty) {
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
                                  urgentNotification
                                      .createNotification(Notifications(
                                    name: controller.namaPasien.text,
                                    umur: controller.umurPasien.text,
                                    alamat: controller.alamatPasien.text,
                                    kebutuhanDarah: controller.banyakDarah.text,
                                    goldarah: controller.golDarah.text,
                                    resusDarah: controller.resusDarah.text,
                                    kontak: controller.kontak.text,
                                  ));
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
                                  'Batalkan',
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
