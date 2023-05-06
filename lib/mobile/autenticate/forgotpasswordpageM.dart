import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

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
    return Scaffold(
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Enter your email to reset password ⬇️",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: 'Email',
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
