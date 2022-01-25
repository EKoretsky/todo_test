import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nanoid/nanoid.dart';
import 'package:todo_test/domain/entity/task.dart';

class TaskCubit extends Cubit<List<Task>> {
  TaskCubit() : super([]) {
    initState();
  }

  Future<void> initState() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TaskAdapter());
    }
    // Hive.deleteBoxFromDisk('todo');
    late final Box box;
    if (Hive.isBoxOpen('todo')) {
      box = Hive.box<Task>('todo');
    } else {
      box = await Hive.openBox<Task>('todo');
    }

    final taskList = box.values.toList() as List<Task>;

    if (taskList.isNotEmpty) {
      emit(taskList);
    }
  }

  void addTask({required String title}) async {
    final id = nanoid(6);

    final task = Task(
      title: title,
      id: id,
    );
    final box = Hive.box<Task>('todo');
    await box.put(id, task);

    final List<Task> newTasksList = List.from(state)..add(task);

    emit(newTasksList);
  }

  void changeStatusTask({
    required String id,
    required bool value,
  }) async {
    final List<Task> newTaskList = List.from(state);
    final task = newTaskList.firstWhere((task) => task.id == id);
    task.isDone = value;

    final box = Hive.box<Task>('todo');
    await box.delete(id);
    await box.put(id, task);

    emit(newTaskList);
  }
}

class TaskAdapter extends TypeAdapter<Task> {
  @override
  Task read(BinaryReader reader) {
    final id = reader.readString();
    final title = reader.readString();
    final isDone = reader.readBool();
    return Task(id: id, title: title, isDone: isDone);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeString(obj.id)
      ..writeString(obj.title)
      ..writeBool(obj.isDone);
  }
}
