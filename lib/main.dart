import 'package:flutter/material.dart';
import 'package:flutterapp/main_page.dart';
import 'file:///D:/FlutterWorkspace/flutter_app/lib/resources/values/app_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.appTheme,
      ),
      home: MainPage(),
    );
  }
}

