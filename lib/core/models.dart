class Task {
  String id;
  String title;
  String description;
  DateTime date;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.date});
}

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void updateTask(Task updatedTask) {
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index >= 0) {
      tasks[index] = updatedTask;
    }
  }

  void removeTask(String taskId) {
    tasks.removeWhere((task) => task.id == taskId);
  }
}
