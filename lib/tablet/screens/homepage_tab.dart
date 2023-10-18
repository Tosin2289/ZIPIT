import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

  final currentUser = FirebaseAuth.instance.currentUser;
  String userName = "";
  void deletethoughts(docId) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete?"),
          actions: [
            MaterialButton(
              textColor: Colors.white,
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.red,
              onPressed: () async {
                try {
                  await FirebaseFirestore.instance
                      .collection('thoughts')
                      .doc(docId)
                      .delete();
                  print('Document deleted successfully');
                  Navigator.pop(context);
                } catch (e) {
                  print('Error deleting document: $e');
                }
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Z I P I T"),
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
              style: GoogleFonts.indieFlower(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
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
                    List thoughtLists = snapshot.data!.docs;

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: thoughtLists.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = thoughtLists[index];
                        String docId = document.id;
                        return noteCardTablet(
                          () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return NoteReaderScreenMobile(
                                    thoughtLists[index]);
                              },
                            ));
                          },
                          thoughtLists[index],
                          () {
                            deletethoughts(docId);
                          },
                        )
                            .animate(delay: 100.ms)
                            .fadeIn(duration: 800.ms)
                            .moveY(begin: 20, end: 0);
                      },
                    );
                  }
                  return Text(
                    "there's no Notes",
                    style: GoogleFonts.indieFlower(
                        color: Colors.white, fontSize: 20),
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
            return const NewNoteScreenTablet();
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
