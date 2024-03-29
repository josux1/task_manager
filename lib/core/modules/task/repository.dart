import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:tsk_mg/core/modules/task/task.dart';

//Here you make your repository pattern. Connect to any api, database, etc.
class TaskRepository {
  final _dio = Dio(BaseOptions(
    baseUrl: "https://ecsdevapi.nextline.mx/vdev/tasks-challenge",
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ));
  final String token =
      "e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd";

  Future<List<Task>?> getAllTasks() async {
    try {
      final response = await _dio.get(
        "/tasks",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      // final List<Task> finalTasks = response.data
      //     .map((dynamic task) => Task.fromJson(task as Map<String, dynamic>))
      //     .toList();
      final List<Task> tasks = [];
      for (var item in response.data) {
        tasks.add(Task.fromJson(item));
      }

      log(tasks.first.title);
      return tasks;
    } catch (error) {
      log('Error: ${error.toString()}');
      return null;
    }
  }

  Future<Task?> getTaskById({required String id}) async {
    try {
      final response = await _dio.get(
        "/tasks/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      final Task task = Task.fromJson(response.data);

      log(task.title);
      return task;
    } catch (error) {
      log('Error: ${error.toString()}');
      return null;
    }
  }

  Future<Task?> sendTask({required Task task}) async {
    try {
      final response = await _dio.post(
        "/tasks",
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/x-www-form-urlencoded",
        }),
        queryParameters: {
          "token": token,
          "title": task.title,
          "is_completed": task.isCompleted,
          "due_date": task.dueDate,
          "comments": task.comments,
          "description": task.description,
          "tags": task.tags,
        },
      );

      log(response.data);

      // final Task recivedTask = Task.fromJson(response.data);

      // log(recivedTask.title);
      // return recivedTask;
    } catch (error) {
      log('Error: ${error.toString()}');
      return null;
    }
    return null;
  }
}
