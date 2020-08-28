import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:simpletask/Models/task.dart';

part 'taskStore.g.dart';

class TaskStore = TaskStoreBase with _$TaskStore;

abstract class TaskStoreBase with Store {
  @observable
  ObservableList<Task> tasks = ObservableList<Task>();

  @action
  void add(Task item) {
    tasks.add(item);
  }

  @action
  void remove(Task item) {
    tasks.remove(item);
  }
}

final taskStore = TaskStore();