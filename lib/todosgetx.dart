import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'Todos.dart';
import 'package:http/http.dart' as http;
class TodosGetx extends GetxController {
  RxList<Todos> todos = <Todos>[].obs;

  Future<void> fetchtodos() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/todos"));
    if (response.statusCode == 200) {
      var gettodosData = json.decode(response.body.toString());
      final todosData = gettodosData['todos'] as List<dynamic>;

      final todoList = todosData.map((todoJson) => Todos.fromJson(todoJson)).toList();

      todos.assignAll(todoList);
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}// TODO Implement this library.