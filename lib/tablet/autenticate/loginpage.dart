import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zipit/tablet/autenticate/forgotpasswordpageT.dart';

class LoginPageTablet extends StatefulWidget {
  final Function()? onTap;
  const LoginPageTablet({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPageTablet> createState() => _LoginPageTabletState();
}

class _LoginPageTabletState extends State<LoginPageTablet> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  void Signin() async {
    showDialog(
        context: context,
        builder: ((context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      showerrormessage(e.code);
    }
  }

  void showerrormessage(String message) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text(message),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/loginb.json',
                      height: 400,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 12),
                  child: TextField(
                    style: TextStyle(fontSize: 30),
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 30),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 37, horizontal: 12),
                      hintText: 'Email',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 12),
                  child: TextField(
                    style: TextStyle(fontSize: 30),
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 30),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 37, horizontal: 14),
                      hintText: 'Password',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return ForgotPasswordPageTablet();
                          })));
                        }),
                        child: Text(
                          "Forgot Password",
                          style: GoogleFonts.delius(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: GestureDetector(
                    onTap: Signin,
                    child: Container(
                      child: Center(
                          child: Text(
                        "Login",
                        style: TextStyle(
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      )),
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account?",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        " Register".toUpperCase(),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
