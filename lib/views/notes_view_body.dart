import 'package:flutter/material.dart';
import 'package:notes/views/widgets/notes_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return NotesItem();
        },
      ),
    );
  }
}
