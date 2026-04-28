import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskRepository {
  final CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection('tasks');

  // Stream providing real-time task list
  Stream<List<TaskModel>> getTasksStream() {
    return _taskCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => TaskModel.fromFirestore(doc)).toList();
    });
  }

  // Add new task
  Future<void> add(TaskModel task) {
    return _taskCollection.add(task.toFirestore());
  }

  // Update status
  Future<void> updateStatus(String id, bool isDone) {
    return _taskCollection.doc(id).update({'isDone': isDone});
  }

  // Update task
  Future<void> updateTask(String id, String title, String description) {
    return _taskCollection.doc(id).update({
      'title': title,
      'description': description,
    });
  }

  // Delete task
  Future<void> delete(String id) {
    return _taskCollection.doc(id).delete();
  }
}
