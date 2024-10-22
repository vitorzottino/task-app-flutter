import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/pages/task_list/widgets/task_widget.dart';
import 'package:todo_app/providers/task_provider.dart';

class TaskListPage extends StatefulWidget {
  final String groupId;
  const TaskListPage({super.key, required this.groupId});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  void initState() {
    final taskProvider = context.read<TaskProvider>();
    taskProvider.listTasksByGroupId(widget.groupId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Consumer<TaskProvider>(
        builder: (context, provider, _) {
          if (provider.hasError) {
            return const Center(
                child: Text("Erro ao buscar tasks, tente novamente"));
          }
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: provider.tasks.length,
            itemBuilder: (context, index) {
              return TaskWidget(
                task: provider.tasks[index],
                color: Colors.red,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
