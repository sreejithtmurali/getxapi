import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'todosgetx.dart';

import 'Todos.dart';

void main() => runApp(MaterialApp(home: Home()));


class Home extends StatelessWidget {
  final controller = Get.put(TodosGetx());


  @override
  Widget build(BuildContext context) {
    controller.fetchtodos();

    return Scaffold(
        appBar: AppBar(title: Text("todos")),
        body:
        Obx(() =>  ListView.builder(
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
                          Container(width: MediaQuery.of(context).size.width-100,
                              child: Text('todo: ${st.todo}',maxLines: 3,)),
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

        ))


    );
  }

}


