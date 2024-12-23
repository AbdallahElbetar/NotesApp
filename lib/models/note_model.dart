import 'package:hive_flutter/adapters.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String dateTime;
  @HiveField(3)
  final String color;

  NoteModel(
      {required this.title,
      required this.description,
      required this.dateTime,
      required this.color});
}
