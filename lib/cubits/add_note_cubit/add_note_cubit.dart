import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/add_note_cubit/add_note_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(IntialState());

  final Box<NoteModel> box = Hive.box<NoteModel>(Constants.kNameBox);

  Future<void> addNote(NoteModel note) async {
    try {
      emit(LoadingAddNoteState());
      await Future.delayed(Duration(milliseconds: 200));
      await box.add(note);
      emit(SuccessAddNoteState());
    } on HiveError catch (e) {
      emit(FailureAddNoteState(errorMessage: e.message));
    } catch (e) {
      emit(FailureAddNoteState(errorMessage: e.toString()));
    }
  }
}
