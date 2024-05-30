import 'package:lesson47/models/todo_model.dart';
import 'package:lesson47/services/todo_http_service.dart';
import 'package:uuid/uuid.dart';

class TodoViewModel {
  TodoHttpService todoHttpService = TodoHttpService();
  final uuid = const Uuid();
  List<TodoModel> _list = [
    TodoModel(
      id: "1",
      title: "New Tasklar",
      time: DateTime.now().toString(),
      isDone: false,
    ),
  ];

  Future<List<TodoModel>> get list async {
    _list = await todoHttpService.getTodoTasks();
    return [..._list];
  }

  Future<void> addTodo(String title, String time) async {
    final newTask = await todoHttpService.addTodoTasks(title, time);
    _list.add(newTask);
  }

  Future<void> deleteTask(String id) async {
    await todoHttpService.deleteTask(id);
    _list.removeWhere((todo) => todo.id == id);
  }

  Future<void> editTask(String id, String newTitle, String newTime) async {
    await todoHttpService.editTask(id, newTitle, newTime);
    final index = _list.indexWhere((task) => task.id == id);

    if (index != -1) {
      _list[index].title = newTitle;
      _list[index].time = newTime;
    } else {
      print('Task topilmadi $id');
    }
  }
}
