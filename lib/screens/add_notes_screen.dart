import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/screens/home_screen.dart';

class AddNotesScreen extends StatefulWidget {
  @override
  _AddNotesScreenState createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  //final Future<FirebaseApp> _future = Firebase.initializeApp();
  final noteContentController = TextEditingController();
  final noteTitleController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();

  Future<void> saveNotes(String title, String content) async {
    final dbOject = databaseRef.child("Notes");
    DataSnapshot snapshot = await databaseRef.once();

    dbOject.push().set({
      "title": noteTitleController.text,
      "content": noteContentController.text,
    });
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "Title",
                hintText: "Title",
              ),
              controller: noteTitleController,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: TextField(
                maxLines: 10,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                controller: noteContentController,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          saveNotes(noteTitleController.text, noteContentController.text);
        },
      ),
    );
  }
}
