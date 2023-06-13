class Task {
  String title;
  String description;
  DateTime date;
  bool isSelected;
  bool isCrossedOut;

  Task({
    required this.title,
    required this.description,
    required this.date,
    this.isCrossedOut = true,
    this.isSelected = false,
  });
}
