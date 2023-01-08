import 'package:flutter/material.dart';
import 'package:zipit/tablet/autenticate/loginpage.dart';
import 'package:zipit/tablet/autenticate/registerpageT.dart';

class ShowLoginorRegisterPageTablet extends StatefulWidget {
  ShowLoginorRegisterPageTablet({Key? key}) : super(key: key);

  @override
  State<ShowLoginorRegisterPageTablet> createState() =>
      _ShowLoginorRegisterPageTabletState();
}

class _ShowLoginorRegisterPageTabletState
    extends State<ShowLoginorRegisterPageTablet> {
  bool showLoginPage = true;
  void tooglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPageTablet(onTap: tooglePage);
    } else {
      return RegisterPageTablet(
        onTap: tooglePage,
      );
    }
  }
}
