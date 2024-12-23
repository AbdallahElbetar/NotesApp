import 'package:flutter/material.dart';
import 'package:notes/views/widgets/custom_add_Button.dart';
import 'package:notes/views/widgets/custom_text_field.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            CustomTextField(title: "Tilte", maxLines: 1),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustomTextField(title: "Description", maxLines: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            CustomAddButton(
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
