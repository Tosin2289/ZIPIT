import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zipit/mobile/screens/note_readerM.dart';
import 'package:zipit/tablet/componets/note_cardT.dart';
import 'package:zipit/tablet/screens/new_note_screenT.dart';

class HomePageTab extends StatefulWidget {
  const HomePageTab({Key? key}) : super(key: key);

  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab> {
  final user = FirebaseAuth.instance.currentUser!;
  void SignOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Z I P I T"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: SignOut, icon: const Icon(Icons.logout))
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
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("notes").snapshots(),
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
                              crossAxisCount: 3),
                      children: snapshot.data!.docs
                          .map((note) => noteCardTablet(() {
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
                    "there's no Notes",
                    style:
                        GoogleFonts.nunito(color: Colors.white, fontSize: 20),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return NewNoteScreenTablet();
          })));
        },
        label: const Text(
          "New Note",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
