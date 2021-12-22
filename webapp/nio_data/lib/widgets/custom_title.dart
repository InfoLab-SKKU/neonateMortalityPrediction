import 'package:flutter/material.dart';
import 'package:nio_data/constants/colors.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  const CustomTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.mainColor,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }
}
