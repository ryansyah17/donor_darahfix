import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputNotificationController extends GetxController {
  late TextEditingController namaPasien;
  late TextEditingController umurPasien;
  late TextEditingController alamatPasien;
  late TextEditingController banyakDarah;
  late TextEditingController golDarah;
  late TextEditingController resusDarah;
  late TextEditingController kontak;

  @override
  void onInit() {
    super.onInit();
    namaPasien = TextEditingController();
    umurPasien = TextEditingController();
    alamatPasien = TextEditingController();
    banyakDarah = TextEditingController();
    golDarah = TextEditingController();
    resusDarah = TextEditingController();
    kontak = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    namaPasien.dispose();
    umurPasien.dispose();
    alamatPasien.dispose();
    banyakDarah.dispose();
    golDarah.dispose();
    resusDarah.dispose();
    kontak.dispose();
  }
}
