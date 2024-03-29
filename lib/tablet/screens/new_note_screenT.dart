import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zipit/tablet/style/app_styleT.dart';

class NewNoteScreenTablet extends StatefulWidget {
  const NewNoteScreenTablet({Key? key}) : super(key: key);

  @override
  State<NewNoteScreenTablet> createState() => _NewNoteScreenTabletState();
}

class _NewNoteScreenTabletState extends State<NewNoteScreenTablet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();
  int color_id = Random().nextInt(AppStyleTablet.cardsColorT.length);
  String date = DateTime.now().toString();
  final currentUser = FirebaseAuth.instance.currentUser;
  String userName = "";
  Future<void> getCurrentUsername() async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();
      if (mounted) {
        setState(() {
          userName = userDoc['Username'];
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyleTablet.cardsColorT[color_id],
      appBar: AppBar(
        backgroundColor: AppStyleTablet.cardsColorT[color_id],
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Add a new Note",
          style: GoogleFonts.indieFlower(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              scribbleEnabled: true,
              style: AppStyleTablet.mainTitleTablet,
              controller: titleController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Title'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: AppStyleTablet.dateTitleTablet,
            ),
            const SizedBox(
              height: 28.0,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              scribbleEnabled: true,
              style: AppStyleTablet.mainContentTablet,
              controller: mainController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Text'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (() async {
          FirebaseFirestore.instance
              .collection('thoughts')
              .add({
                'sender': userName,
                'id': currentUser!.uid,
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
        child: const Icon(Icons.save_outlined),
      ),
    );
  }
}
