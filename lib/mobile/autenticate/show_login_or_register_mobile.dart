import 'package:flutter/material.dart';
import 'package:zipit/mobile/autenticate/loginpageM.dart';
import 'package:zipit/mobile/autenticate/registerpageM.dart';

class ShowLoginorRegisterPageMobile extends StatefulWidget {
  const ShowLoginorRegisterPageMobile({Key? key}) : super(key: key);

  @override
  State<ShowLoginorRegisterPageMobile> createState() =>
      _ShowLoginorRegisterPageMobileState();
}

class _ShowLoginorRegisterPageMobileState
    extends State<ShowLoginorRegisterPageMobile> {
  bool showLoginPage = true;
  void tooglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPageMobile(onTap: tooglePage);
    } else {
      return RegisterPageMobile(onTap: tooglePage);
    }
    ;
  }
}
