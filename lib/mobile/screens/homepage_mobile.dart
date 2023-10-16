import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zipit/mobile/componets/note_cardM.dart';
import 'package:zipit/mobile/screens/new_note_screenM.dart';
import 'package:zipit/mobile/screens/note_readerM.dart';
import 'package:zipit/mobile/style/app_styleM.dart';

class HomePageMobile extends StatefulWidget {
  HomePageMobile({Key? key}) : super(key: key);

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  void SignOut() {
    FirebaseAuth.instance.signOut();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  String userName = "";

  Future<void> fetchuserData() async {
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
    fetchuserData();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Z I P I T",
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: SignOut,
              icon: Icon(Icons.logout,
                  color: isDark ? Colors.white : Colors.black))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your recent thoughts",
              style: GoogleFonts.indieFlower(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: isDark ? Colors.white : Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("thoughts")
                    .where('sender', isEqualTo: userName)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => noteCardMobile(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return NoteReaderScreenMobile(note);
                                  },
                                ));
                              }, note))
                          .toList(),
                    );
                  }
                  return Text(
                    "no notes found",
                    style: GoogleFonts.indieFlower(color: Colors.white),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: isDark ? Colors.white : Colors.black,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return const NewNoteScreenMobile();
          })));
        },
        label: Text(
          "New Note",
          style: GoogleFonts.indieFlower(
              color: !isDark ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        icon: Icon(
          Icons.add,
          color: !isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
