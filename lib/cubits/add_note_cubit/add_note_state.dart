abstract class AddNoteState {}

class IntialState extends AddNoteState {}

class SuccessAddNoteState extends AddNoteState {}

class LoadingAddNoteState extends AddNoteState {}

class FailureAddNoteState extends AddNoteState {
  final String errorMessage;
  FailureAddNoteState({required this.errorMessage});
}
