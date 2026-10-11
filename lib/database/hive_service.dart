import 'package:hive_ce_flutter/hive_flutter.dart';
import 'todo.dart';

class HiveService {
  static String boxName = 'task';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  Box get box => Hive.box(boxName);

  Future<void> addTask(Todo todo) async {
    await box.add({
      'title': todo.title,
      'isComplete': todo.isComplete,
    });
  }

  List<Todo> getTasks() {
    List<Todo> tasks = [];
    for (int i = 0; i < box.length; i++) {
      tasks.add(Todo(
        title: box.getAt(i)['title'],
        isComplete: box.getAt(i)['isComplete'],
      ));
    }
    return tasks;
  }

  // Method 1: تعديل مهمة موجودة (Update)
  Future<void> updateTask(int index, Todo todo) async {
    await box.putAt(index, {
      'title': todo.title,
      'isComplete': todo.isComplete,
    });
  }

  // Method 2: حذف مهمة (Delete)
  Future<void> deleteTask(int index) async {
    await box.deleteAt(index);
  }
}
