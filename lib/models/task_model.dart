class TaskModel {
  String id;
  String title;
  bool isDone;
  DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    this.isDone = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory TaskModel.fromMap(Map<dynamic, dynamic> map) {
    return TaskModel(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      isDone: map['isDone'] == true,
      createdAt: map['createdAt'] != null
          ? DateTime.tryParse(map['createdAt'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  TaskModel copyWith({
    String? id,
    String? title,
    bool? isDone,
    DateTime? createdAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
