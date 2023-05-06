import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterPageMobile extends StatefulWidget {
  final Function()? onTap;
  RegisterPageMobile({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPageMobile> createState() => _RegisterPageMobileState();
}

class _RegisterPageMobileState extends State<RegisterPageMobile> {
  final emailcontoller = TextEditingController();
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
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailcontoller.text, password: passwordcontoller.text);
      } else {
        showerrormessage("Password do not match!");
      }
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
    emailcontoller.dispose();
    passwordcontoller.dispose();
    confirmpasswordcontoller.dispose();
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 12),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: emailcontoller,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 20),
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
                    controller: passwordcontoller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 20),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 12),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: confirmpasswordcontoller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 20),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 27, horizontal: 10),
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
                      "Already have an account?",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        " Log in".toUpperCase(),
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
