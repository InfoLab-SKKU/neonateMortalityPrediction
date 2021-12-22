import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTexts extends StatelessWidget {
  final String option;
  final String name;

  const CustomTexts({
    Key? key,
    required this.option,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$option: ',
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
