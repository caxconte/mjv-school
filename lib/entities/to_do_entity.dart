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
    this.isDone,
    this.content,
    this.image,
  });

  factory ToDoEntity.fromJson(Map<String, dynamic> json) {
    return ToDoEntity(
      uuid: json['uuid'],
      title: json['title'],
      initialDate: DateTime.fromMicrosecondsSinceEpoch(json['initialDate']),
      finalDate: DateTime.fromMicrosecondsSinceEpoch(json['finalDate']),
      isDone: json['isConcluido'],
      content: ToDoChecklistEntity.fromJsonList(json['content']),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'titulo': title,
      'dataInicio': initialDate.microsecondsSinceEpoch,
      'dataFim': finalDate.microsecondsSinceEpoch,
      'isConcluido': isDone,
      'conteudos': content,
      if (image != null) 'image': image,
    };
  }

  static List<ToDoEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => ToDoEntity.fromJson(item)).toList() ?? [];
  }
}
