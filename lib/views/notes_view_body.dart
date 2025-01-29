import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/display_notes_cubit/display_notes_cubit.dart';
import 'package:notes/cubits/display_notes_cubit/display_notes_state.dart';

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
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0), // Set the radius for top corners
                ),
              ),
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: BottomSheetBody(),
                );
              });
        },
      ),
      body: BlocConsumer<DisplayNotesCubit, DisplayNotesState>(
        listener: (BuildContext context, state) {
          if (state is FailureDisplayNotesState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              state.errorMessage,
            )));
          }
        },
        builder: (BuildContext context, state) {
          if (state is SuccessDisplayNotesState) {
            BlocProvider.of<DisplayNotesCubit>(context).displayNotes();
            if (state.notesDataList.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  await BlocProvider.of<DisplayNotesCubit>(context)
                      .displayNotes();
                },
                child: ListView.builder(
                  itemCount: state.notesDataList.length,
                  itemBuilder: (context, index) {
                    return NotesItem(
                      noteModel: state.notesDataList[index],
                    );
                  },
                ),
              );
            } else {
              return Center(child: Text("There are no Notes"));
            }
          } else {
            return Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
}
