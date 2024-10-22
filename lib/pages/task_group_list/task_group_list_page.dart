import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/task_list/task_list_page.dart';
import 'package:todo_app/providers/task_group_provider.dart';

class TaskGroupListPage extends StatelessWidget {
  const TaskGroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Groups'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.light_mode),
          ),
        ],
      ),
      body: Consumer<TaskGroupProvider>(
        builder: (context, provider, _) {
          if (provider.hasError) {
            return const Center(
                child: Text("Erro ao buscar task groups, tente novamente"));
          }
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: provider.taskGroups.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          TaskListPage(groupId: provider.taskGroups[index].id),
                    ),
                  );
                },
                title: Text(provider.taskGroups[index].name),
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

  /*Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: this,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Ocorreu um erro'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Ocorreu um erro, tente novamente'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}*/
}
