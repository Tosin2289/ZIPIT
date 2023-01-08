import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPageTablet extends StatefulWidget {
  ForgotPasswordPageTablet({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPageTablet> createState() =>
      _ForgotPasswordPageTabletState();
}

class _ForgotPasswordPageTabletState extends State<ForgotPasswordPageTablet> {
  final emailcontroller = TextEditingController();
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Forgot password"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Text("Enter your email to reset password ⬇️",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 35)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12),
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
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                      fontSize: 30,
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
