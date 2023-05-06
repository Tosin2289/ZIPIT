import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zipit/firebase_options.dart';
import 'package:zipit/mobile/spalsh.dart';
import 'package:zipit/responsive/responsive.dart';
import 'package:zipit/tablet/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSize(),
    );
  }
}

class ScreenSize extends StatefulWidget {
  const ScreenSize({Key? key}) : super(key: key);

  @override
  State<ScreenSize> createState() => _ScreenSizeState();
}

class _ScreenSizeState extends State<ScreenSize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Resposive(mobilebody: SplashMobile(), tabletbody: SplashTablet()),
    );
  }
}
