class ToDoChecklistEntity {
  String title;
  bool isChecked;

  ToDoChecklistEntity({
    required this.title,
    this.isChecked = false,
  });

  static fromJsonList(json) {}
}
