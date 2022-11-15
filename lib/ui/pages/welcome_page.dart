// import 'package:donor_darah/main.dart';
import 'package:donor_darah/services/auth_services.dart';
// import 'package:donor_darah/shared/custom_primary_button.dart';
import 'package:donor_darah/shared/shared.dart';
import 'package:donor_darah/ui/pages/main_page.dart';
import 'package:donor_darah/ui/pages/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          reverse: true,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 30),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/blood-drop.png'))),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Selamat Datang,',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login ke Akun Anda untuk lanjut',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: const Text(
                              'Email',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        style: blackFontStyle2,
                        decoration: const InputDecoration(
                          hintText: 'email',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        validator: (value) {
                          // Reg Expression Email validator
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-z]")
                              .hasMatch(value!)) {
                            return 'Email tidak valid';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: defaultMargin * 2),
                            child: Text(
                              'Password',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: TextFormField(
                          controller: password,
                          style: blackFontStyle2,
                          obscureText: _obscureText,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            // border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: blackFontStyle3,
                            suffixIcon: new GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: new Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                          validator: (value) {
                            RegExp regExp = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            if (!regExp.hasMatch(value)) {
                              return 'Password tidak valid (Min. 6 karakter)';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 56,
                        decoration: BoxDecoration(
                            color: primer,
                            borderRadius: BorderRadius.circular(14)),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  });
                              context
                                  .read<AuthService>()
                                  .login(
                                      email: email.text,
                                      password: password.text)
                                  .then((value) => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MainPage(initialPage: 0),
                                      )));
                              // if (_formKey.currentState!.validate()) {
                              //   showDialog(
                              //       context: context,
                              //       builder: (context) {
                              //         return Center(
                              //             child: CircularProgressIndicator());
                              //       });
                              //   context
                              //       .read<AuthService>()
                              //       .login(
                              //           email: email.text,
                              //           password: password.text)
                              //       .then((value) => Navigator.pushReplacement(
                              //           context,
                              //           MaterialPageRoute(
                              //             builder: (context) =>
                              //                 MainPage(initialPage: 0),
                              //           )));
                              // }
                            },
                            borderRadius: BorderRadius.circular(14),
                            child: Center(
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum Punya Akun? ',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text('Daftar Sekarang',
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline)),
                          )
                        ],
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
