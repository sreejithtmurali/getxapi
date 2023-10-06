import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'Todos.dart';
import 'package:http/http.dart' as http;
class TodosGetx extends GetxController {
  RxList<Todos> todos = <Todos>[].obs;

  Future<void> fetchtodos() async {
    print("called");
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    if (response.statusCode == 200) {
      print("${response.body}");
      // convert data to list of json
      var gettodosData = json.decode(response.body.toString()) as List;
      //generate list fom that json list
      final todoList = gettodosData.map((todoJson) => Todos.fromJson(todoJson)).toList();

      //convert that list as RXlist
      var list =todoList as Iterable<Todos>;
      //assign value to controller variable
      todos.assignAll(list);
      //call update to notify
      update();
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}// TODO Implement this library.