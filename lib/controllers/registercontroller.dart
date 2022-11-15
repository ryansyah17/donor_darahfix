import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController nama;
  late TextEditingController email;
  late TextEditingController goldarah;
  late TextEditingController alamat;
  late TextEditingController jeniskelamin;
  late TextEditingController password;

  @override
  void onInit() {
    super.onInit();
    nama = TextEditingController();
    email = TextEditingController();
    goldarah = TextEditingController();
    alamat = TextEditingController();
    jeniskelamin = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nama.dispose();
    email.dispose();
    goldarah.dispose();
    alamat.dispose();
    jeniskelamin.dispose();
    password.dispose();
  }
}
