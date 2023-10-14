import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zipit/mobile/autenticate/intro.dart';
import 'package:zipit/mobile/screens/homepage_mobile.dart';

class SplashMobile extends StatefulWidget {
  const SplashMobile({Key? key}) : super(key: key);

  @override
  State<SplashMobile> createState() => _SplashMobileState();
}

class _SplashMobileState extends State<SplashMobile> {
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), (() {}));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
      return IntroScreenMobile();
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        Lottie.asset('assets/diary.json', height: 200),
                        SizedBox(
                          height: 10,
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                                  colors: [Colors.pink, Colors.purple])
                              .createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: Text(
                            "Z I P I T",
                            style: GoogleFonts.delius(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.red, Colors.yellow]).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      "Made by phenomes".toUpperCase(),
                      style: GoogleFonts.delius(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
