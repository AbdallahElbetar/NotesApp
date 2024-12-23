import 'package:flutter/material.dart';
import 'package:notes/views/widgets/custom_text_field.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Note",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                size: 40,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomTextField(title: "Tilte", maxLines: 1),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustomTextField(title: "Description", maxLines: 5),
          ],
        ),
      ),
    );
  }
}
