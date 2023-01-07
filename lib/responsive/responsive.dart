import 'package:flutter/material.dart';

class Resposive extends StatelessWidget {
  final Widget mobilebody;
  final Widget tabletbody;
  Resposive({Key? key, required this.mobilebody, required this.tabletbody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobilebody;
      } else {
        return tabletbody;
      }
    });
  }
}
