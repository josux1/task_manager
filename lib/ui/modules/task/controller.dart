import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsk_mg/core/modules/task/task.dart';
import 'package:tsk_mg/core/providers/providers.dart';

final taskControllerProvider = Provider<TaskController>((ref) {
  return TaskController();
});

//Here you controll your widgets, acordingly the response you have from your bussiness logic in service.dart file.
class TaskController {
  Future<List<Task>?> getAllTasks({required WidgetRef ref}) async {
    final service = ref.watch(taskServiceProvider);
    return await service.getAllTasks();
  }

  Future<Task?> getTaskById(
      {required WidgetRef ref, required String id}) async {
    final service = ref.watch(taskServiceProvider);
    return await service.getTaskById(id: id);
  }
}
