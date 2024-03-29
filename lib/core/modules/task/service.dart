import 'package:tsk_mg/core/modules/task/repository.dart';
import 'package:tsk_mg/core/modules/task/task.dart';
import 'package:tsk_mg/core/utlis/local_tasks.dart';
import 'package:tsk_mg/core/utlis/verify_conection.dart';

//Apply here all your bussiness logic
class TaskService {
  TaskService(this.repository);
  final TaskRepository repository;

  Future<List<Task>?> getAllTasks() async {
    final hasConection = await verifyConnection();
    final tasks = await repository.getAllTasks();

    if (hasConection && tasks != null) {
      return tasks;
    }
    if (hasConection && tasks == null) {
      return localTasks.map((e) => Task.fromJson(e)).toList();
    }
    return null;
  }

  Future<Task?> getTaskById({required String id}) async {
    final hasConection = await verifyConnection();
    final task = await repository.getTaskById(id: id);

    if (hasConection && task != null) {
      return task;
    }
    if (hasConection && task == null) {
      return localTasks.map((e) => Task.fromJson(e)).toList().first;
    }
    return null;
  }
}
