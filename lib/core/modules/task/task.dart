import 'dart:convert';

class Task {
  final int? id;
  final String title;
  final int isCompleted;
  final DateTime? dueDate;
  final String? comments;
  final String? description;
  final String? tags;

  Task({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.dueDate,
    this.comments,
    this.description,
    this.tags,
  });

  factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        isCompleted: json["is_completed"],
        dueDate:
            json["due_date"] != null ? DateTime.parse(json["due_date"]) : null,
        comments: json["comments"],
        description: json["description"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "is_completed": isCompleted,
        "due_date":
            "${dueDate?.year.toString().padLeft(4, '0')}-${dueDate?.month.toString().padLeft(2, '0')}-${dueDate?.day.toString().padLeft(2, '0')}",
        "comments": comments,
        "description": description,
        "tags": tags,
      };
}
