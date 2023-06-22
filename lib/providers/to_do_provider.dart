import 'package:flutter/material.dart';
import '../services/to_do_service.dart';

import '../entities/to_do_entity.dart';

class ToDoProvider with ChangeNotifier {
  final service = ToDoService();
  List<ToDoEntity> _toDoList = [];

  ToDoProvider() {
    searchTasks();
  }

  searchTasks() async {
    toDoList = await service.search();
  }

  List<ToDoEntity> get toDoList => _toDoList;

  set toDoList(List<ToDoEntity> val) {
    _toDoList = val;
    notifyListeners();
  }
}
