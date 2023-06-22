import 'dart:convert';

import 'package:school/entities/to_do_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoService {
  final _key = 'KEY_TODO';

  Future<void> salvar(List<ToDoEntity> items) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(items);
    await prefs.setString(_key, listJson);
  }

  Future<List<ToDoEntity>> search() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listJson = prefs.getString(_key);
    if (listJson != null) {
      return ToDoEntity.fromJsonList(jsonDecode(listJson));
    }
    return [];
  }
}
