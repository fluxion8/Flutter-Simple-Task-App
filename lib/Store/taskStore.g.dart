// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskStore on TaskStoreBase, Store {
  final _$tasksAtom = Atom(name: 'TaskStoreBase.tasks');

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  final _$TaskStoreBaseActionController =
      ActionController(name: 'TaskStoreBase');

  @override
  void add(Task item) {
    final _$actionInfo =
        _$TaskStoreBaseActionController.startAction(name: 'TaskStoreBase.add');
    try {
      return super.add(item);
    } finally {
      _$TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(Task item) {
    final _$actionInfo = _$TaskStoreBaseActionController.startAction(
        name: 'TaskStoreBase.remove');
    try {
      return super.remove(item);
    } finally {
      _$TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
