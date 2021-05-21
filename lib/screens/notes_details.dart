import 'package:flutter/material.dart';

class NotesDetails extends StatefulWidget {
  @override
  _NotesDetailsState createState() => _NotesDetailsState();
}

class _NotesDetailsState extends State<NotesDetails> {
  @override
  Widget build(BuildContext context) {
    final String content = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes Details'),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 10, 20),
                child: Row(
                  children: [
                    Text(
                      content,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      softWrap: true,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
