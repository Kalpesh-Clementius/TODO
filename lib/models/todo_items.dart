class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todolist() {
    return [
      ToDo(id: "01", todoText: "Woke up before 7", isDone: true),
      ToDo(id: "02", todoText: "Go to the gym", isDone: true),
      ToDo(id: "03", todoText: "Eating Breakfast"),
      ToDo(id: "04", todoText: "Go to the office"),
      ToDo(id: "05", todoText: "Complete a task"),
      ToDo(id: "06", todoText: "Going For Lunch"),
      ToDo(id: "07", todoText: "Go to the pg"),
      ToDo(id: "08", todoText: "eating lunch"),
      ToDo(id: "09", todoText: "Going for the walk"),
      ToDo(id: "10", todoText: "Check mails")
    ];
  }
}
