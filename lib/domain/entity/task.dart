class Task {
  Task({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  final String id;
  final String title;
  bool isDone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          isDone == other.isDone;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ isDone.hashCode;
}
