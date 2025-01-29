import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/constants.dart';

import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes/cubits/display_notes_cubit/display_notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/custom_add_button.dart';
import 'package:notes/views/widgets/custom_text_field.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({super.key});

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is FailureAddNoteState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          } else if (state is SuccessAddNoteState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Success Add Note")),
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is LoadingAddNoteState,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      CustomTextField(
                        controller: titleController,
                        title: "Title",
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CustomTextField(
                        controller: descriptionController,
                        title: "Description",
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: ColorListView(),
                      ),
                      CustomAddButton(
                        text: (state is LoadingAddNoteState)
                            ? "Loading..."
                            : "Add",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            DateFormat dateFormat = DateFormat("dd-MM-yyyy");
                            String formattedDate =
                                dateFormat.format(DateTime.now());
                            BlocProvider.of<AddNoteCubit>(context).addNote(
                              NoteModel(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  timeDate: formattedDate,
                                  color: (Constants.kColorNote != null)
                                      ? Constants.kColorNote!
                                      : Colors.white.value),
                            );
                          }
                          BlocProvider.of<DisplayNotesCubit>(context)
                              .displayNotes();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

////*      Colors Notes   */

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.color,
    required this.tapped,
  });
  final Color color;
  final bool tapped;

  @override
  Widget build(BuildContext context) {
    return tapped
        ? CircleAvatar(
            radius: (MediaQuery.of(context).size.height * 0.07) / (2.4),
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: (MediaQuery.of(context).size.height * 0.07) / (2.4 * 1.5),
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: (MediaQuery.of(context).size.height * 0.07) / 2.4,
            backgroundColor: color,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                Constants.kColorNote = colorList[index].value;
              });
            },
            child: ColorItem(
              color: colorList[index],
              tapped: currentIndex == index,
            ),
          );
        });
  }
}

List<Color> colorList = [
  Color(0xffb7b3a1),
  Color(0xffd1ca98),
  Color(0xffedbf85),
  Color(0xfff7f06d),
  Color(0xffffb140),
  Color(0xffdbfe87),
  Color(0xff03b5aa),
  Color(0xffb2aa8e),
  Color(0xff7a306c),
  Colors.blue,
  Colors.brown,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.brown,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.brown,
  Colors.yellow,
  Colors.green
];
