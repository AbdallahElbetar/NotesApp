import 'package:notes/models/note_model.dart';

abstract class DisplayNotesState {}

class IntialDisplayNotesState extends DisplayNotesState {}

class SuccessDisplayNotesState extends DisplayNotesState {
  final List<NoteModel> notesDataList; //= <NoteModel>[];
  SuccessDisplayNotesState({required this.notesDataList});
}

class LoadingDisplayNotesState extends DisplayNotesState {}

class FailureDisplayNotesState extends DisplayNotesState {
  final String errorMessage;
  FailureDisplayNotesState({required this.errorMessage});
}
