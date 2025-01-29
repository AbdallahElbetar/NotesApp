import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                title: Text(
                  noteModel.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
                subtitle: Text(
                  noteModel.description,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14),
                ),
                trailing: IconButton(
                  onPressed: () async {
                    await noteModel.delete();
                  },
                  icon: Icon(Icons.delete, color: Colors.black),
                ),
              ),
              Text(
                noteModel.timeDate,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )
            ],
          )),
    );
  }
}
