import 'package:flutter/material.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: Text(
                "Title",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              subtitle: Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.black),
              ),
            ),
            Text(
              "15 - 12 - 2024",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )
          ],
        ));
  }
}
