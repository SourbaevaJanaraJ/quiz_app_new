import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_new/modules/controllers/home_controller.dart';
import 'modules/home/screens/quiz_ui_screen.dart';

void main() {
  Get.lazyPut<HomeController>(()=>HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
@override
  Widget build(BuildContext context) {
      return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizUiScreen(),
    );
  }
}

