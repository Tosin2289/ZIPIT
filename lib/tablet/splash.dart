import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zipit/tablet/autenticate/intro.dart';
import 'package:zipit/tablet/screens/homepage_tab.dart';

class SplashTablet extends StatefulWidget {
  SplashTablet({Key? key}) : super(key: key);

  @override
  State<SplashTablet> createState() => _SplashTabletState();
}

class _SplashTabletState extends State<SplashTablet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), (() {}));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
      return IntroScreenTablet();
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
                        Lottie.asset('assets/diary.json', height: 350),
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
                            style: TextStyle(
                                fontSize: 60,
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
                      style: TextStyle(
                          fontSize: 32,
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
