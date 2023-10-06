class Todos {
  Todos({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,});

  Todos.fromJson(dynamic json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }
  late int id;
  late String todo;
  late bool completed;
  late int userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['todo'] = todo;
    map['completed'] = completed;
    map['userId'] = userId;
    return map;
  }

}

// TODO Implement this library.