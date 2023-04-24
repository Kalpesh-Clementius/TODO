import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "../models/todo_items.dart";

class Todo extends StatelessWidget {
  final ToDo todo;
  final ondeletetodo;
  final onhandletodo;

  Todo(
      {Key? key,
      required this.todo,
      required this.ondeletetodo,
      required this.onhandletodo})
      : super(key: key);

  final todolist = ToDo.todolist();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onhandletodo(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              onPressed: () {
                ondeletetodo(todo.id);
              },
              icon: Icon(Icons.delete),
              color: Colors.white,
              iconSize: 18,
            )),
      ),
    );
  }
}
