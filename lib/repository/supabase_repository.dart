import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/models/task_group.dart';

class SupabaseRepository {
  Future<List<TaskGroup>> findAllTaskGroups() async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from("task_groups").select();
    final taskGroups = response.map((m) => TaskGroup.fromMap(m)).toList();
    return taskGroups;
  }
}
