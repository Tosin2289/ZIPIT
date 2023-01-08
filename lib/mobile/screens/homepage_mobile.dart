import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageMobile extends StatefulWidget {
  HomePageMobile({Key? key}) : super(key: key);

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  final user = FirebaseAuth.instance.currentUser!;
  void SignOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("HomePage"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: SignOut, icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
