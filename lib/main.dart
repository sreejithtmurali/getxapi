import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'todosgetx.dart';

import 'Todos.dart';

void main() => runApp(GetMaterialApp(home: Home()));


class Home extends StatelessWidget {
  TodosGetx controller = Get.put(TodosGetx())..fetchtodos();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(title: Text("todos")),
        body:
        Obx(() =>  controller.todos.length>0?
            ListView.builder(
          shrinkWrap: true,
          itemCount:controller.todos.length,
          itemBuilder: (BuildContext context, int index) {
            Todos st = controller.todos[index];
            return Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      child: Column(
                        children: <Widget>[
                          Text('id: ${st.id}'),
                          Text('completed: ${st.completed}'),
                          Text('userId: ${st.userId}'),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },

        ):Text("No data")
        )


    );
  }

}


