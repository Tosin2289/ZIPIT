import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterPageTablet extends StatefulWidget {
  final Function()? onTap;
  RegisterPageTablet({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPageTablet> createState() => _RegisterPageTabletState();
}

class _RegisterPageTabletState extends State<RegisterPageTablet> {
  final emailcontoller = TextEditingController();
  final passwordcontoller = TextEditingController();
  final confirmpasswordcontoller = TextEditingController();
  final usernamecontoller = TextEditingController();
  void SignUserUp() async {
    showDialog(
        context: context,
        builder: ((context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }));
    try {
      if (passwordcontoller.text == confirmpasswordcontoller.text) {
        UserCredential userCredentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontoller.text, password: passwordcontoller.text);
        String userId = userCredentials.user!.uid;
        await FirebaseFirestore.instance.collection("users").doc(userId).set(
            {'Email': emailcontoller.text, 'Username': usernamecontoller.text});
        if (context.mounted) Navigator.pop(context);
      } else {
        showerrormessage("Password do not match!");
      }
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      showerrormessage(e.code);
    }
    Navigator.of(context).pop();
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 12),
                  child: TextField(
                    style: GoogleFonts.delius(fontSize: 30),
                    controller: usernamecontoller,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.delius(fontSize: 30),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 37, horizontal: 12),
                      hintText: 'Username',
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 12),
                  child: TextField(
                    style: GoogleFonts.delius(fontSize: 30),
                    controller: emailcontoller,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.delius(fontSize: 30),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 37, horizontal: 12),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 12),
                  child: TextField(
                    style: GoogleFonts.delius(fontSize: 30),
                    controller: passwordcontoller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.delius(fontSize: 30),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 37, horizontal: 12),
                      hintText: 'Password',
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 12),
                  child: TextField(
                    style: GoogleFonts.delius(fontSize: 30),
                    controller: confirmpasswordcontoller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.delius(fontSize: 30),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 37, horizontal: 12),
                      hintText: 'Confirm Password',
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: GestureDetector(
                    onTap: SignUserUp,
                    child: Container(
                      child: Center(
                          child: Text(
                        "Register",
                        style: GoogleFonts.delius(
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
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.delius(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        " Log in".toUpperCase(),
                        style: GoogleFonts.delius(
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
