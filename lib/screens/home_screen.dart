import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/screens/notes_details.dart';
import 'add_notes_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbRef = FirebaseDatabase.instance.reference().child("Notes");
  List<Map<dynamic, dynamic>> lists = [];

  void _addNotes() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) => AddNotesScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: FutureBuilder(
          future: dbRef.once(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            if (snapshot.hasData) {
              lists.clear();
              Map<dynamic, dynamic> values = snapshot.data.value;
              if (values != null) {
                values.forEach((key, values) {
                  lists.add(values);
                });
              }
              return new ListView.builder(
                  shrinkWrap: true,
                  itemCount: lists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      hoverColor: Colors.blue[100],
                      title: Text(
                        lists[index]["title"],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotesDetails(),
                            settings: RouteSettings(
                                arguments: lists[index]["content"]),
                          ),
                        );
                      },
                    );
                  });
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Oopppsss !! Data cannot be retrieved. Please try again later",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          }),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addNotes,
        tooltip: 'Add Notes',
        child: Icon(Icons.add),
      ),
    );
  }
}
