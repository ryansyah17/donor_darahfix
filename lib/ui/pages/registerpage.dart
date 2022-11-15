import 'package:donor_darah/shared/shared.dart';
import 'package:donor_darah/ui/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = false;
  bool passwordConfirmVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'FORM REGISTER',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              TextFormField(
                key: ValueKey('Nama'),
                // controller: controller.nama,
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
                height: 10,
              ),
              TextFormField(
                key: ValueKey('email'),
                // controller: controller.nama,
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
                  labelText: 'Email',
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
                key: ValueKey('goldarah'),
                // controller: controller.nama,
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
                  hintText: 'A, B, AB, O',
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
                // controller: controller.nama,
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
                  labelText: 'alamat',
                  // hintText: '',
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
                key: ValueKey('jekel'),
                // controller: controller.nama,
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
                  hintText: 'laki-laki/perempuan',
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
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(14)),
                child: TextFormField(
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      // hintStyle: heading6.copyWith(color: textGrey),
                      suffixIcon: IconButton(
                        // color: textGrey,
                        splashRadius: 1,
                        icon: Icon(passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: togglePassword,
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    color: primer, borderRadius: BorderRadius.circular(14)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.snackbar('Berhasil', 'Register Berhasil');
                      Get.to(WelcomePage());
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: Center(
                      child: Text(
                        'Register',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    // style: regular16pt.copyWith(color: textGrey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('Login',

                        // style: regular16pt.copyWith(color: primaryBlue),
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            decoration: TextDecoration.underline)),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
