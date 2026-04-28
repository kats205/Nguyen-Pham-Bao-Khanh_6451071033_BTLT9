import '../models/task_model.dart';
import '../repositories/task_repository.dart';

class TaskController {
  final TaskRepository _repository = TaskRepository();

  // Stream providing real-time task list
  Stream<List<TaskModel>> get tasksStream => _repository.getTasksStream();

  // Business logic: Add new task
  Future<void> addNewTask(String title, String description) async {
    if (title.trim().isEmpty) return;
    final newTask = TaskModel(
      id: '', 
      title: title,
      description: description,
      isDone: false,
      createdAt: DateTime.now(),
    );
    await _repository.add(newTask);
  }

  // Business logic: Toggle completion status
  Future<void> toggleTaskStatus(TaskModel task, bool? value) async {
    if (value == null) return;
    await _repository.updateStatus(task.id, value);
  }

  // Business logic: Edit task title
  Future<void> editTask(String id, String newTitle, String newDescription) async {
    if (newTitle.trim().isEmpty) return;
    await _repository.updateTask(id, newTitle, newDescription);
  }

  // Business logic: Delete task
  Future<void> deleteTask(String id) async {
    await _repository.delete(id);
  }
}
