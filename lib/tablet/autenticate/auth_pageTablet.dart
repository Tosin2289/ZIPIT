import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zipit/tablet/autenticate/show_login_or_register_tablet.dart';
import 'package:zipit/tablet/screens/homepage_tab.dart';

class AuthPageTablet extends StatelessWidget {
  const AuthPageTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return HomePageTab();
          }
          //user not logged in
          else {
            return ShowLoginorRegisterPageTablet();
          }
        },
      ),
    );
  }
}
