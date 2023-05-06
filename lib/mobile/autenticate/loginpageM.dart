import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zipit/mobile/autenticate/forgotpasswordpageM.dart';

class LoginPageMobile extends StatefulWidget {
  final Function()? onTap;
  const LoginPageMobile({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPageMobile> createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  void Signin() async {
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
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
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
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 12),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 20),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 27, horizontal: 10),
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
                      horizontal: 18.0, vertical: 12),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 20),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 27, horizontal: 10),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return forgotPasswordPageMobile();
                          })));
                        }),
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
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
                            fontSize: 30),
                      )),
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.black,
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
                    const Text(
                      "Dont have an account?",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        " Register".toUpperCase(),
                        style: const TextStyle(
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
