import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsk_mg/core/modules/task/repository.dart';
import 'package:tsk_mg/core/modules/task/service.dart';

final taskRepoProvider = Provider<TaskRepository>((ref) {
  return TaskRepository();
});

final taskServiceProvider = Provider<TaskService>((ref) {
  final respository = ref.watch(taskRepoProvider);
  return TaskService(respository);
});

//---------------------------------

