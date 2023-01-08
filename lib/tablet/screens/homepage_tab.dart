import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageTab extends StatefulWidget {
  HomePageTab({Key? key}) : super(key: key);

  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab> {
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
