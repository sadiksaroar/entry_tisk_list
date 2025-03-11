import 'package:flutter/material.dart';

void main() {
  runApp(TimeTrackerApp());
}

class TimeTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AddTimeEntryScreen(),
    );
  }
}

class AddTimeEntryScreen extends StatefulWidget {
  @override
  _AddTimeEntryScreenState createState() => _AddTimeEntryScreenState();
}

class _AddTimeEntryScreenState extends State<AddTimeEntryScreen> {
  List<String> projects = [
    "Project A",
    "Project B",
    "Project C",
  ]; // Sample projects
  List<String> tasks = ["Task 1", "Task 2", "Task 3"]; // Sample tasks
  String? selectedProject; // Selected project
  String? selectedTask; // Selected task

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Time Entry")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Project:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(border: OutlineInputBorder()),
              value: selectedProject,
              hint: Text("Choose a project"),
              items:
                  projects.map((String project) {
                    return DropdownMenuItem<String>(
                      value: project,
                      child: Text(project),
                    );
                  }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedProject = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              "Select Task:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(border: OutlineInputBorder()),
              value: selectedTask,
              hint: Text("Choose a task"),
              items:
                  tasks.map((String task) {
                    return DropdownMenuItem<String>(
                      value: task,
                      child: Text(task),
                    );
                  }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedTask = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
