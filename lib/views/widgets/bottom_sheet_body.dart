import 'package:flutter/material.dart';
import 'package:notes/views/widgets/custom_text_field.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: Column(
        children: [
          CustomTextField(title: "Tilte", maxLines: 1),
          CustomTextField(title: "Description", maxLines: 5),
        ],
      ),
    );
  }
}
