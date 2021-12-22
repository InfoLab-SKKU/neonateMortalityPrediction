import 'package:flutter/material.dart';
import 'package:nio_data/constants/colors.dart';
import 'package:nio_data/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neonate',
      theme: ThemeData(
        primaryColor: AppColors.mainColor,
      ),
      home: const MainPage(),
    );
  }
}
