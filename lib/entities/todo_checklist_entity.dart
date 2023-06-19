class ToDoChecklistEntity {
  String titulo;
  bool isChecked;

  ToDoChecklistEntity({
    required this.titulo,
    this.isChecked = false,
  });
}
