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
  final user = FirebaseAuth.instance.currentUser!;
  void SignOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white,
              ),
              accountName: Text(
                user.displayName!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                user.email!,
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
          SizedBox(
            height: 30,
          ),
          ListTile(
            onTap: SignOut,
            textColor: Colors.white,
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 20),
            ),
          )
        ]),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Z I P I T"),
        centerTitle: true,
        elevation: 0,
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
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                    "there's no Notes",
                    style: GoogleFonts.nunito(color: Colors.white),
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
            return NewNoteScreenMobile();
          })));
        },
        label: Text(
          "New Note",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
