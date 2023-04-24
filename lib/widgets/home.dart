import "package:flutter/material.dart";
import "package:myapp/models/todo_items.dart";
import "package:myapp/widgets/sidebar.dart";
import "package:myapp/widgets/todo.dart";

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todolist = ToDo.todolist();
  List<ToDo> _finalredult = [];
  final myController = TextEditingController();
  void initState() {
    _finalredult = todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 158, 158),
      drawer: SideBar(),
      appBar: _buildapp(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                searchbox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All Todos",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      for (ToDo todo in _finalredult)
                        Todo(
                          todo: todo,
                          ondeletetodo: (id) {
                            _deleteHandle(id);
                          },
                          onhandletodo: _handleChange,
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                        hintText: "Add a new todo", border: InputBorder.none),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: () {
                      print(myController.text);
                      setState(() {
                        todolist.add(ToDo(
                            id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            todoText: myController.text,
                            isDone: true));
                      });
                      print(todolist);
                      myController.text = "";
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _deleteHandle(String id) {
    setState(() {
      todolist.removeWhere((element) => element.id == id);
    });
  }

  void _handleChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _runfilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todolist;
    } else {
      results = todolist
          .where((element) => element.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _finalredult = results;
    });
  }

  Widget searchbox() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) {
          _runfilter(value);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }

  AppBar _buildapp() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color.fromARGB(255, 158, 158, 158),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.only(),
          child: Icon(Icons.menu, color: Colors.black, size: 30),
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/images/user.jpg"),
          ),
        )
      ]),
    );
  }
}
