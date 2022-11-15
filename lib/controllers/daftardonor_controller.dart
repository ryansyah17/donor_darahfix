import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class DaftarDonorController extends GetxController {
  late TextEditingController namaLengkap;
  late TextEditingController tempatLahir;
  late TextEditingController tanggalLahir;
  late TextEditingController umur;
  late TextEditingController jenisKelamin;
  late TextEditingController alamat;
  late TextEditingController noHandphone;
  late TextEditingController golonganDarah;
  late TextEditingController beratBadan;
  late TextEditingController tinggiBadan;
  late TextEditingController tekananDarah;
  late TextEditingController kadarHb;
  late TextEditingController tanggalDonor;
  late TextEditingController idUsers;

  @override
  void onInit() {
    super.onInit();
    idUsers = TextEditingController();
    namaLengkap = TextEditingController();
    tempatLahir = TextEditingController();
    tanggalLahir = TextEditingController();
    jenisKelamin = TextEditingController();
    alamat = TextEditingController();
    noHandphone = TextEditingController();
    golonganDarah = TextEditingController();
    beratBadan = TextEditingController();
    tekananDarah = TextEditingController();
    kadarHb = TextEditingController();
    tanggalDonor = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    idUsers.dispose();
    namaLengkap.dispose();
    tempatLahir.dispose();
    tanggalLahir.dispose();
    jenisKelamin.dispose();
    alamat.dispose();
    noHandphone.dispose();
    golonganDarah.dispose();
    beratBadan.dispose();
    tekananDarah.dispose();
    kadarHb.dispose();
    tanggalDonor.dispose();
  }
}
