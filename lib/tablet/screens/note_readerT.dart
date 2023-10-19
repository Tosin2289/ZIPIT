import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zipit/tablet/style/app_styleT.dart';

class NoteReaderTablet extends StatefulWidget {
  NoteReaderTablet(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderTablet> createState() => _NoteReaderTabletState();
}

class _NoteReaderTabletState extends State<NoteReaderTablet> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyleTablet.cardsColorT[color_id],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: AppStyleTablet.cardsColorT[color_id],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStyleTablet.mainTitleTablet,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.doc["creation_date"],
              style: AppStyleTablet.dateTitleTablet,
            ),
            const SizedBox(
              height: 28,
            ),
            SelectableText(
              widget.doc["note_content"],
              style: AppStyleTablet.mainContentTablet,
            ),
          ],
        ),
      ),
    );
  }
}
