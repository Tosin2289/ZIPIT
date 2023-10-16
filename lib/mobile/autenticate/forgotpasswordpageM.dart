import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class forgotPasswordPageMobile extends StatefulWidget {
  const forgotPasswordPageMobile({Key? key}) : super(key: key);

  @override
  State<forgotPasswordPageMobile> createState() =>
      _forgotPasswordPageMobileState();
}

class _forgotPasswordPageMobileState extends State<forgotPasswordPageMobile> {
  final emailcontroller = TextEditingController();
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: ((context) {
            return const AlertDialog(
              content: Text('Password reset link sent! Check your mail'),
            );
          }));
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          }));
    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Forgot password"),
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Enter your email to reset password ⬇️",
                textAlign: TextAlign.center,
                style: GoogleFonts.delius(
                  fontSize: 25,
                  color: isDark ? Colors.white : Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.delius(
                    color: !isDark ? Colors.black : Colors.white),
                hintText: 'Email',
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: !isDark ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: !isDark ? Colors.black : Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: !isDark ? Colors.grey[200] : Colors.grey[700],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: passwordReset,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: !isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Reset Password",
                    style: GoogleFonts.delius(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: !isDark ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
