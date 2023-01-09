import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zipit/mobile/style/app_styleM.dart';

class NewNoteScreenMobile extends StatefulWidget {
  NewNoteScreenMobile({Key? key}) : super(key: key);

  @override
  State<NewNoteScreenMobile> createState() => _NewNoteScreenMobileState();
}

class _NewNoteScreenMobileState extends State<NewNoteScreenMobile> {
  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();
  int color_id = Random().nextInt(AppStyleMoile.cardsColorM.length);
  String date = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyleMoile.cardsColorM[color_id],
      appBar: AppBar(
        backgroundColor: AppStyleMoile.cardsColorM[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add a new Note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              scribbleEnabled: true,
              style: AppStyleMoile.mainTitleMobile,
              controller: titleController,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Title'),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: AppStyleMoile.dateTitleMobile,
            ),
            SizedBox(
              height: 28.0,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              scribbleEnabled: true,
              style: AppStyleMoile.mainContentMobile,
              controller: mainController,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Text'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (() async {
          FirebaseFirestore.instance
              .collection('notes')
              .add({
                'note_title': titleController.text,
                'creation_date': date,
                'note_content': mainController.text,
                'color_id': color_id
              })
              .then((value) => {
                    print(value.id),
                    Navigator.pop(context),
                  })
              .catchError((error) =>
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      "Unable to save due to $error",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.symmetric(vertical: 20),
                  )));
        }),
        child: Icon(Icons.save_outlined),
      ),
    );
  }
}
