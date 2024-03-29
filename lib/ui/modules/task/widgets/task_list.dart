import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tsk_mg/core/modules/task/task.dart';
import 'package:tsk_mg/ui/utils/utils.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.tasks, required this.onRefresh});
  final List<Task>? tasks;
  final Future<void> Function() onRefresh;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: widget.tasks!.length,
        itemBuilder: (context, index) {
          final item = widget.tasks![index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  onTap: () {},
                  title: Text(item.title, style: t.medium),
                  subtitle: Text(
                      DateFormat.jm().format(item.dueDate ?? DateTime.now())),
                  trailing: CustomChip(
                      enebled: item.isCompleted,
                      title:
                          item.isCompleted == 1 ? 'Complete' : 'Not started'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
