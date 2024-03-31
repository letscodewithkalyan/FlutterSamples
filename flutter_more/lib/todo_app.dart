import 'package:flutter/material.dart';
import 'package:flutter_more/views/home_view.dart';
import 'package:flutter_more/views/tab_view.dart';
import 'package:get/get.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: MoreTabView());
  }
}
