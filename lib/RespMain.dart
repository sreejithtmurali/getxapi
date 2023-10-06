import 'Todos.dart';

class RespMain {
  RespMain({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,});

  RespMain.fromJson(dynamic json) {
    if (json['todos'] != null) {
      todos = [];
      json['todos'].forEach((v) {
        todos.add(Todos.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  late List<Todos> todos;
  late int total;
  late int skip;
  late int limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (todos != null) {
      map['todos'] = todos.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}


