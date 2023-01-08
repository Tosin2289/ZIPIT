import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zipit/mobile/autenticate/show_login_or_register_mobile.dart';
import 'package:zipit/mobile/screens/homepage_mobile.dart';

class AuthPageMobile extends StatelessWidget {
  const AuthPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return HomePageMobile();
          }
          //user not logged in
          else {
            return ShowLoginorRegisterPageMobile();
          }
        },
      ),
    );
  }
}
