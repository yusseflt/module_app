import 'package:flutter/material.dart';
import 'package:module_app/bloc/task_manager_bloc.dart';

class TaskManagerPage extends StatefulWidget {
  const TaskManagerPage({Key? key}) : super(key: key);

  @override
  _TaskManagerPageState createState() => _TaskManagerPageState();
}

class _TaskManagerPageState extends State<TaskManagerPage> {
  TaskManagerBloc bloc = TaskManagerBloc();

  @override
  void initState() {
    super.initState();
    bloc.getSystemData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
