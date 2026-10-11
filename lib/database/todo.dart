class Todo {
  String title;
  bool isComplete;

  Todo({
    required this.title,
    this.isComplete = false,
  });

  bool get isDone => isComplete;
  set isDone(bool value) => isComplete = value;
}
