import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tsk_mg/core/modules/task/repository.dart';
import 'package:tsk_mg/core/modules/task/task.dart';
import 'package:tsk_mg/ui/modules/task/controller.dart';
import 'package:tsk_mg/ui/modules/task/widgets/empty_list.dart';
import 'package:tsk_mg/ui/modules/task/widgets/loading_list.dart';
import 'package:tsk_mg/ui/modules/task/widgets/task_list.dart';
import 'package:tsk_mg/ui/utils/utils.dart';

class TaskPage extends ConsumerStatefulWidget {
  const TaskPage({super.key});

  @override
  ConsumerState<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends ConsumerState<TaskPage> {
  List<Task>? tasks = [];
  bool isLoading = false;

  @override
  void initState() {
    onStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task\'s to do', style: t.title),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: isLoading
          ? const LoadingList(items: 7)
          : tasks == null
              ? EmptyList(onRefresh: onStart)
              : tasks!.isEmpty
                  ? const Center(child: Text('No data'))
                  : TaskList(tasks: tasks, onRefresh: onStart),

      //
      floatingActionButton: const FloatingActionButton.extended(
        onPressed: null,
        // onPressed: () async {
        //   await TaskRepository().getAllTasks();
        //   // await TaskRepository().getTaskById(id: '123123');
        //   // await TaskRepository().sendTask(
        //   //     task: Task(
        //   //         id: 987656,
        //   //         title: 'New Task on fire',
        //   //         isCompleted: 1,
        //   //         dueDate: DateTime.now()));
        // },
        label: Text('Create new task'),
        icon: Icon(Icons.add),
      ),
    );
  }

  Future<void> onStart() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() => isLoading = true);
      tasks = await ref.read(taskControllerProvider).getAllTasks(ref: ref);
      setState(() => isLoading = false);
    });
  }
}
