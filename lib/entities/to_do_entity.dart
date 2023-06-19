import 'todo_checklist_entity.dart';

class ToDoEntity {
  String uuid;
  String title;
  DateTime initialDate;
  DateTime finalDate;
  bool? isDone;
  List<ToDoChecklistEntity>? content;
  String? image;

  ToDoEntity({
    required this.uuid,
    required this.title,
    required this.initialDate,
    required this.finalDate,
    required this.isDone,
    this.content,
    this.image,
  });
}
