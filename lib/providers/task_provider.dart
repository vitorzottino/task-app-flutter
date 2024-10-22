import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/repository/supabase_repository.dart';

class TaskProvider extends ChangeNotifier {
  final _repo = SupabaseRepository();

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _isLoading;

  Future<void> listTasksByGroupId(String groupId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _tasks = await _repo.listTasksByGroup(groupId);
    } catch (e) {
      _hasError = true;
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
