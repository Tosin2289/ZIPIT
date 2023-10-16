import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterPageMobile extends StatefulWidget {
  final Function()? onTap;
  RegisterPageMobile({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPageMobile> createState() => _RegisterPageMobileState();
}

class _RegisterPageMobileState extends State<RegisterPageMobile> {
  final emailcontoller = TextEditingController();
  final usernamecontoller = TextEditingController();
  final passwordcontoller = TextEditingController();
  final confirmpasswordcontoller = TextEditingController();
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
  void dispose() {
    emailcontoller.dispose();
    usernamecontoller.dispose();
    passwordcontoller.dispose();
    confirmpasswordcontoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: !isDark ? Colors.white : Colors.black,
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
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 12),
                  child: TextField(
                    style: GoogleFonts.delius(fontSize: 20),
                    controller: usernamecontoller,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.delius(
                          fontSize: 20,
                          color: isDark ? Colors.white70 : Colors.black87),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 27, horizontal: 10),
                      hintText: 'Username',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: !isDark ? Colors.white : Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: !isDark ? Colors.black : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: isDark ? Colors.grey[700] : Colors.grey[200],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 12),
                  child: TextField(
                    style: GoogleFonts.delius(fontSize: 20),
                    controller: emailcontoller,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.delius(
                          fontSize: 20,
                          color: isDark ? Colors.white70 : Colors.black87),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 27, horizontal: 10),
                      hintText: 'Email',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: !isDark ? Colors.white : Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: !isDark ? Colors.black : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: isDark ? Colors.grey[700] : Colors.grey[200],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 12),
                  child: TextField(
                    style: GoogleFonts.delius(fontSize: 20),
                    controller: passwordcontoller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.delius(
                          fontSize: 20,
                          color: isDark ? Colors.white70 : Colors.black87),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 27, horizontal: 10),
                      hintText: 'Password',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: !isDark ? Colors.white : Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: !isDark ? Colors.black : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: isDark ? Colors.grey[700] : Colors.grey[200],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 12),
                  child: TextField(
                    style: GoogleFonts.delius(fontSize: 20),
                    controller: confirmpasswordcontoller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.delius(
                          fontSize: 20,
                          color: isDark ? Colors.white70 : Colors.black87),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 27, horizontal: 10),
                      hintText: 'Confirm Password',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: !isDark ? Colors.white : Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: !isDark ? Colors.black : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: isDark ? Colors.grey[700] : Colors.grey[200],
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
                            color: !isDark ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )),
                      height: 80,
                      decoration: BoxDecoration(
                          color: !isDark ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.delius(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: !isDark ? Colors.black : Colors.white),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        " Log in".toUpperCase(),
                        style: GoogleFonts.delius(
                            fontSize: 20,
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
