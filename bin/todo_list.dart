import 'dart:io';

void main() {
  List<String> todoList = [];

  while(true) {
    print('Choose an option: [1] Add Task, [2] View Task, [3] Remove Task, [4] Mark Task Completed, [5] Exit');
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      addTask(todoList);
    } else if(choice == '2') {
      viewTask(todoList);
    } else if(choice == '3') {
      removeTask(todoList);
    } else if(choice == '4') {
      markTaskComplete(todoList);
    } else if (choice == '5') {
      print("Exiting Program.");
      break;
    } else {
      print("Invalid option. Please try again.");
    }
  }
}

void addTask(List<String> todoList) {
  print("Enter the Task: ");
  String? task = stdin.readLineSync();

  if(task != null && task.isNotEmpty) {
    todoList.add(task);
    print("Task Added.");
  } else {
    print("Task cannot be empty.");
  }
}

void viewTask(List<String> todoList) {
  if(todoList.isEmpty) {
    print("No task available.");
  } else {
    print("Available Task");
    for (int i = 0; i < todoList.length; i++){
      print('${i+1}. ${todoList[i]}');
    }
  }
}

void removeTask(List<String> todoList) {
  viewTask(todoList);
  print("Enter the task number you want to remove: ");
  String? taskNumber = stdin.readLineSync();
  int? index = int.tryParse(taskNumber ?? '');

  if(index != null && index > 0 && index <= todoList.length) {
    todoList.removeAt(index - 1);
    print("Task Removed.");
  } else {
    print("Invalid task number");
  }
}

void markTaskComplete(List<String> todoList) {
  viewTask(todoList);
  print("Enter the number of task to mark completed: ");
  String? taskNumber = stdin.readLineSync();
  int? index = int.tryParse(taskNumber ?? '');

  if(index != null && index > 0 && index <= todoList.length) {
    String task = todoList.removeAt(index - 1);
    todoList.add("$task (completed)");
    print('Task marked as completed');
  } else {
    print("Invalid task number.");
  }
}







