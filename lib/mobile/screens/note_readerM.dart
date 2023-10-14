import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zipit/mobile/style/app_styleM.dart';

class NoteReaderScreenMobile extends StatefulWidget {
  NoteReaderScreenMobile(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreenMobile> createState() => _NoteReaderScreenMobileState();
}

class _NoteReaderScreenMobileState extends State<NoteReaderScreenMobile> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyleMoile.cardsColorM[color_id],
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: AppStyleMoile.cardsColorM[color_id],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStyleMoile.mainTitleMobile,
            ),
          const  SizedBox(
              height: 4,
            ),
            Text(
              widget.doc["creation_date"],
              style: AppStyleMoile.dateTitleMobile,
            ),
          const  SizedBox(
              height: 28,
            ),
            Text(
              widget.doc["note_content"],
              style: AppStyleMoile.mainContentMobile,
            ),
          ],
        ),
      ),
    );
  }
}
