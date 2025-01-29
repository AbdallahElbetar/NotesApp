import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/cubits/display_notes_cubit/display_notes_state.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/constants.dart';

class DisplayNotesCubit extends Cubit<DisplayNotesState> {
  DisplayNotesCubit() : super(IntialDisplayNotesState());

  final Box<NoteModel> box = Hive.box<NoteModel>(Constants.kNameBox);

  Future<void> displayNotes() async {
    try {
      emit(LoadingDisplayNotesState());
      final notesDataList = box.values.toList().cast<NoteModel>();
      emit(SuccessDisplayNotesState(notesDataList: notesDataList));
    } on HiveError catch (e) {
      emit(FailureDisplayNotesState(errorMessage: e.message));
    } catch (e) {
      emit(FailureDisplayNotesState(errorMessage: e.toString()));
    }
  }
}
