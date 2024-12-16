import 'package:flutter/material.dart';
import 'package:notes/views/widgets/bottom_sheet_body.dart';
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0), // Set the radius for top corners
                ),
              ),
              context: context,
              builder: (context) {
                return BottomSheetBody();
              });
        },
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
