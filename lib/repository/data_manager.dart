import 'package:flutter/material.dart';
import 'package:module_app/repository/api_manager.dart';

class DataManager extends InheritedWidget {
  final ApiManager apiInstance = ApiManager();

  DataManager({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static DataManager of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<DataManager>();
    return result!;
  }
}
