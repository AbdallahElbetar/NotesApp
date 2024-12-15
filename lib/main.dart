import 'package:flutter/material.dart';
import 'package:notes/views/notes_view_body.dart';

void main() {
  runApp(NotesView());
}

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: NotesViewBody(),
    );
  }
}
